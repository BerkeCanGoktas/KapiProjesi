import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//Widgets
import 'package:kapi_projesi/widgets/text_field.dart';
import 'package:kapi_projesi/widgets/elevated_button.dart';
import 'package:kapi_projesi/widgets/alert_dialog.dart';

//Models
import 'package:kapi_projesi/models/employee_model.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({Key? key}) : super(key: key);
  static String id = "edit_employee_screen_id"; //screen id

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
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
  bool saving = false; //when waiting the API for saving the changes
  bool saved = false; //when saving is complete

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: saving,
        opacity: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                  child: Text(
                "Çalışanı Düzenle",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "RobotoMono"),
              )), //title
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                        color: Colors.red,
                        height: 40,
                        width: 140,
                        borderRadius: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                            "Çıkış")), //button for returning to manage_employees_screen
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      height: 30,
                    ),
                    Row(
                      children: [
                        CustomElevatedButton(
                            color: Colors.green,
                            height: 50,
                            width: 175,
                            borderRadius: 20,
                            onPressed: () async{
                              checkForErrors();
                              setState(() {
                                saving = true;
                              });
                              await new Future.delayed(new Duration(seconds: 4), () {
                                setState(() {
                                  saving = false;
                                  saved = true;
                                });
                              });
                              if (saved) {
                                saved = false;
                                showAlertDialog(context,
                                    title: "Kayıt Başarılı",
                                    content:
                                        "Değişiklikler başarı ile kaydedildi.",
                                    defaultActionText: "Tamam",
                                    onPressed: () {});
                              }
                            },
                            child: Text(
                                "Değişiklikleri Kaydet")), //button for saving the changes in the database
                        SizedBox(
                          width: 10,
                        ),
                        CustomElevatedButton(
                            color: Colors.red,
                            height: 50,
                            width: 175,
                            borderRadius: 20,
                            onPressed: () async{
                              checkForErrors();
                              setState(() {
                                saving = true;
                              });
                              await new Future.delayed(new Duration(seconds: 4), () {
                                setState(() {
                                  saving = false;
                                  saved = true;
                                });
                              });
                              if (saved) {
                                saved = false;
                                showAlertDialog(context,
                                    title: "Silme Başarılı",
                                    content:
                                        "Çalışan başarı ile silindi.",
                                    defaultActionText: "Tamam",
                                    onPressed: () {});
                              }
                            },
                            child: Text(
                                "Çalışanı Sil")), //button for deleting the employee from the database
                      ],
                    ),
                  ]),
            ]),
          ),
        ),
      ),
    ));
  }

  void checkForErrors() {
    //check if any error occured during logging in
    if ((name.text == "" || surname.text == "" || email.text == "")) {
      //error for empty fields: isim, soyisim, e-mail
      errorOccured = true;
      errorMsg = "İsim, soyisim ve e-mail alanlarının doldurulması zorunludur.";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
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
