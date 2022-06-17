import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//Widgets
import 'package:kapi_projesi/widgets/elevated_button.dart';
import 'package:kapi_projesi/widgets/text_field.dart';
import 'package:kapi_projesi/widgets/alert_dialog.dart';

//Models
import 'package:kapi_projesi/models/employee_model.dart';

class AddByQrScreen extends StatefulWidget {
  const AddByQrScreen({Key? key}) : super(key: key);
  static String id = "add_by_qr_screen_id"; //screen id

  @override
  State<AddByQrScreen> createState() => _AddByQrScreenState();
}

class _AddByQrScreenState extends State<AddByQrScreen> {
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
  bool qrScanning = false; //true when "QR Tarat" button pressed
  bool saving = false; //when waiting the API for saving the changes
  bool saved = false; //when saving is complete

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
      child: SafeArea(
          child: Scaffold(
              body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
                child: Text(
              "QR Taratarak Çalışan Ekle",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 23,
                  fontWeight: FontWeight.w300,
                  fontFamily: "RobotoMono"),
            )), //title
            SizedBox(
              height: 40,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      color: Colors.red,
                      height: 50,
                      width: 200,
                      borderRadius: 20,
                      onPressed: () {
                        qrScanning = true;
                        scanQR();
                        checkForErrors();
                        qrScanning = false;
                      },
                      child: Text("QR Tarat")), //button for scanning QR
                  SizedBox(
                    height: 30,
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                          color: Colors.green,
                          height: 50,
                          width: 170,
                          borderRadius: 20,
                          onPressed: () async {
                            checkForErrors();
                            setState(() {
                              saving = true;
                            });
                            await new Future.delayed(new Duration(seconds: 4),
                                () {
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
                          height: 50,
                          width: 170,
                          borderRadius: 20,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                              "Çıkış")), //button for returning to admin_screen
                    ],
                  ),
                ]),
          ]),
        ),
      ))),
    );
  }

  Future<void> scanQR() async {
    //function for scaning QR code and then filling employee object with the data in it
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      setEmployee(barcodeScanRes);
    });
  }

  void setEmployee(String qrCode) {
    //function for filling the employee object with the data coming from the QR and setting the fields with the data
    employee.surname = (qrCode.indexOf("VERSION:") > -1 &&
            qrCode.indexOf(";") > -1)
        ? qrCode.substring(qrCode.indexOf("VERSION:") + 14, qrCode.indexOf(";"))
        : "";
    employee.name =
        (qrCode.indexOf("FN:") > -1 && qrCode.indexOf("TITLE:") > -1)
            ? qrCode.substring(
                qrCode.indexOf("FN:") + 3, qrCode.indexOf("TITLE:") - 1)
            : "";
    if (employee.name!.isNotEmpty && employee.surname!.isNotEmpty) {
      int surnameLength = employee.surname!.length;
      employee.name =
          employee.name!.substring(0, employee.name!.length - surnameLength);
    }
    employee.title =
        (qrCode.indexOf("TITLE:") > -1 && qrCode.indexOf("ORG:") > -1)
            ? qrCode.substring(
                qrCode.indexOf("TITLE:") + 6, qrCode.indexOf("ORG:") - 1)
            : "";
    employee.organization =
        (qrCode.indexOf("ORG:") > -1 && qrCode.indexOf("EMAIL;") > -1)
            ? qrCode.substring(
                qrCode.indexOf("ORG:") + 4, qrCode.indexOf("EMAIL;") - 1)
            : "";
    employee.email =
        (qrCode.indexOf("INTERNET:") > -1 && qrCode.indexOf("TEL;") > -1)
            ? qrCode.substring(
                qrCode.indexOf("INTERNET:") + 9, qrCode.indexOf("TEL;") - 1)
            : "";
    employee.phone =
        (qrCode.indexOf("pref:") > -1 && qrCode.indexOf("END:") > -1)
            ? qrCode.substring(
                qrCode.indexOf("pref:") + 5, qrCode.indexOf("END:") - 1)
            : "";
    name.text = employee.name!;
    surname.text = employee.surname!;
    title.text = employee.title!;
    organization.text = employee.organization!;
    email.text = employee.email!;
    phone.text = employee.phone!;
    /*
    print(employee.name);
    print(employee.surname);
    print(employee.title);
    print(employee.organization);
    print(employee.email);
    print(employee.phone);
    */
  }

  void checkForErrors() {
    //check if any error occured during logging in
    if ((name.text == "" || surname.text == "" || email.text == "") &&
        !qrScanning) {
      //error for empty fields: isim, soyisim, e-mail
      errorOccured = true;
      errorMsg = "İsim, soyisim ve e-mail alanlarının doldurulması zorunludur.";
    } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email.text) &&
        !qrScanning) {
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
