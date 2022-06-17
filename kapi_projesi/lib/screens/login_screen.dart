import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//Widgets
import 'package:kapi_projesi/widgets/text_field.dart';
import 'package:kapi_projesi/widgets/elevated_button.dart';
import 'package:kapi_projesi/widgets/alert_dialog.dart';

//Screens
import 'admin_screen.dart';
import 'user_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = "login_screen_id"; //screen id

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAdmin = false; //indicates if the user is admin or not
  TextEditingController username =
      TextEditingController(); //controller for username field
  TextEditingController password =
      TextEditingController(); //controller for password field
  String errorMsg =
      ""; //when an error occurs, this message would be displayed after updating its value
  bool errorOccured = false; //when an error occurs, this value would be true
  bool loggingIn = false; //when trying to log in
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loggingIn,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "PITON",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w100,
                  fontSize: 50,
                  fontFamily: 'MarsNews'),
            ), //title
            SizedBox(
              height: 25,
            ),
            CustomTextField(
              controller: username,
              labelText: "Kullanıcı Adı",
              icon: Icons.account_circle_sharp,
            ), //textfield for username
            CustomTextField(
              controller: password,
              labelText: "Şifre",
              obscureText: true,
              icon: Icons.lock_sharp,
            ), //textfield for password
            SizedBox(
              height: 15,
            ),
            CustomElevatedButton(
                color: Colors.blueAccent,
                height: 50,
                width: 200,
                borderRadius: 20,
                onPressed: () async {
                  checkForErrors();
                  if (!errorOccured) {
                    checkIfAdmin(username.text);
                    setState(() {
                      loggingIn = true;
                    });
                    await new Future.delayed(new Duration(seconds: 4), () {
                      setState(() {
                        loggingIn = false;
                      });
                    });
                    if (isAdmin) {
                      Navigator.pushNamed(context, AdminScreen.id);
                    } else {
                      Navigator.pushNamed(context, UserScreen.id);
                    }
                  }
                },
                child: Text("Giriş Yap")), //sign in button
            SizedBox(
              height: 20,
            ),
            // CustomElevatedButton(
            //     color: Colors.blueAccent,
            //     height: 50,
            //     width: 200,
            //     borderRadius: 20,
            //     onPressed: () {
            //       Navigator.pushNamed(context, AdminScreen.id);
            //     },
            //     child: Text("Giriş Yap (Admin Test)")),
          ],
        ),
      ),
    );
  }

  void checkForErrors() {
    //check if any error occured during logging in
    if (username.text == "" || password.text == "") {
      //error for empty fields: kullanıcı adı, şifre
      errorOccured = true;
      errorMsg = "Lütfen kullanıcı adı ve şifre bilgilerinizi giriniz.";
    }
    // else if(){
    //error for wrong or false user
    //hatalı kullanıcı adı veya şifre
    // }
    //else if(){
    //error for API problems
    //API'ye erişilemiyorsa
    //}
    if (errorOccured) {
      showAlertDialog(context,
          title: "Uyarı",
          content: errorMsg,
          defaultActionText: "Tamam", onPressed: () {
        errorOccured = false;
      });
    }
  }

  void checkIfAdmin(String _isAdmin) {
    //check if the user signing in is admin or not
    if (_isAdmin == "admin") {
      isAdmin = true;
    }
  }
}
