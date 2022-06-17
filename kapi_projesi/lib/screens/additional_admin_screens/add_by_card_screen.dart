import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//Widgets
import 'package:kapi_projesi/widgets/elevated_button.dart';
import 'package:kapi_projesi/widgets/text_field.dart';
import 'package:kapi_projesi/widgets/alert_dialog.dart';

//Models
import 'package:kapi_projesi/models/employee_model.dart';

class AddByCardScreen extends StatefulWidget {
  const AddByCardScreen({Key? key}) : super(key: key);
  static String id = "add_by_card_screen_id"; //screen id

  @override
  State<AddByCardScreen> createState() => _AddByCardScreenState();
}

class _AddByCardScreenState extends State<AddByCardScreen> {
  Employee employee = Employee(); //employee object to manage
  TextEditingController name = TextEditingController(); //textfield controllers
  TextEditingController surname = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController organization = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController card = TextEditingController(); //textfield controllers
  String errorMsg =
      ""; //when an error occurs, this message would be displayed after updating its value
  bool errorOccured = false; //when an error occurs, this value would be true
  bool cardReading = false; //true when "Kart Okut" button pressed
  bool saving = false; //when waiting the API for saving the changes
  bool saved = false; //when saving is complete

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: saving,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Kart Okutarak Çalışan Ekle",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        fontFamily: "RobotoMono"),
                  )), //title
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                          color: Colors.red,
                          height: 40,
                          width: 200,
                          borderRadius: 20,
                          onPressed: () {
                            cardReading = true;
                            checkForErrors();
                            cardReading = false;
                          },
                          child: Text(
                              "Kart Okut")), //button for accessing the API for card reading
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        " Kart okutarak çalışan eklemek için yukarıdaki butona basıp kapıdaki kart okuyucuya, eklemek istediğiniz kartı okutunuz.",
                        style: TextStyle(
                            fontFamily: "RobotoMono",
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.redAccent),
                      ), //explanation text
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: name,
                        labelText: "İsim:",
                        icon: Icons.account_circle_sharp,
                      ), //first field
                      CustomTextField(
                        controller: surname,
                        labelText: "Soyisim:",
                        icon: Icons.account_circle_sharp,
                      ), //second field
                      CustomTextField(
                          controller: title,
                          labelText: "Unvan:",
                          icon: Icons.business_center_sharp), //third field
                      CustomTextField(
                        controller: organization,
                        labelText: "Şirket:",
                        icon: Icons.business,
                      ), //fourth field
                      CustomTextField(
                        controller: email,
                        labelText: "E-Mail:",
                        icon: Icons.mail,
                      ), //fifth field
                      CustomTextField(
                        controller: phone,
                        labelText: "Telefon Numarası:",
                        icon: Icons.local_phone_sharp,
                      ), //sixth field
                      CustomTextField(
                        controller: card,
                        labelText: "Kart ID:",
                        icon: Icons.credit_card_sharp,
                      ), //seventh field
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                              color: Colors.green,
                              height: 40,
                              width: 170,
                              borderRadius: 20,
                              onPressed: () async {
                                checkForErrors();
                                setState(() {
                                  saving = true;
                                });
                                await new Future.delayed(
                                    new Duration(seconds: 4), () {
                                  setState(() {
                                    saving = false;
                                    saved = true;
                                  });
                                });
                                if (saved) {
                                  saved = false;
                                  showAlertDialog(context,
                                      title: "Kayıt Başarılı",
                                      content: "Çalışan başarı ile eklendi",
                                      defaultActionText: "Tamam",
                                      onPressed: () {});
                                }
                              },
                              child: Text(
                                  "Kaydet")), //button for saving the employee in the database
                          SizedBox(
                            width: 15,
                          ),
                          CustomElevatedButton(
                              color: Colors.red,
                              height: 40,
                              width: 170,
                              borderRadius: 20,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                  "Çıkış")), //button for returning to admin_screen
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkForErrors() {
    //check if any error occured during logging in
    if ((name.text == "" || surname.text == "" || email.text == "") &&
        !cardReading) {
      //error for empty fields: isim, soyisim, e-mail
      errorOccured = true;
      errorMsg = "İsim, soyisim ve e-mail alanlarının doldurulması zorunludur.";
    } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email.text) &&
        !cardReading) {
      //error for badly formatted e-mail
      errorOccured = true;
      errorMsg = "E-mail hatalı veya yanlış formatta.";
    }
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
}
