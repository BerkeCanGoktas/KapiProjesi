import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

//Widgets
import 'package:kapi_projesi/widgets/elevated_button.dart';
import 'package:kapi_projesi/widgets/text_field.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  static String id = "user_screen_id"; //screen id

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController controller =
      TextEditingController(); //controller for textfields, not important since they are passive but necessary anyway
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Çalışan Bilgileri",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    fontFamily: "RobotoMono"),
              )), //title
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                enabled: false,
                controller: controller,
                labelText: "İsim:",
                icon: Icons.account_circle_sharp,
              ), //first field
              CustomTextField(
                enabled: false,
                controller: controller,
                labelText: "Soyisim:",
                icon: Icons.account_circle_sharp,
              ), //second field
              CustomTextField(
                  enabled: false,
                  controller: controller,
                  labelText: "Unvan:",
                  icon: Icons.business_center_sharp), //third field
              CustomTextField(
                enabled: false,
                controller: controller,
                labelText: "Şirket:",
                icon: Icons.business,
              ), //fourth field
              CustomTextField(
                enabled: false,
                controller: controller,
                labelText: "E-Mail:",
                icon: Icons.mail,
              ), //fifth field
              CustomTextField(
                enabled: false,
                controller: controller,
                labelText: "Telefon Numarası:",
                icon: Icons.local_phone_sharp,
              ), //sixth field
              Center(
                child: QrImage(
                  data: 'This QR code has an embedded image as well',
                  version: 15,
                  size: 200,
                  gapless: true,
                  embeddedImage: AssetImage('assets/images/logo-p-bg.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(50, 50),
                  ),
                ),
              ), //QR image specific to employee
              SizedBox(
                height: 15,
              ),
              Center(
                child: CustomElevatedButton(
                    color: Colors.red,
                    height: 50,
                    width: 200,
                    borderRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Çıkış")),
              ), //exit button
            ],
          ),
        ),
      ),
    );
  }
}
