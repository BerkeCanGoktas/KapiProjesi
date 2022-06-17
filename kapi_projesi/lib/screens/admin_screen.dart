import 'package:flutter/material.dart';

//Widgets
import 'package:kapi_projesi/widgets/elevated_button.dart';

//Screens
import 'package:kapi_projesi/screens/additional_admin_screens/add_by_card_screen.dart';
import 'package:kapi_projesi/screens/additional_admin_screens/add_by_qr_screen.dart';
import 'package:kapi_projesi/screens/additional_admin_screens/manage_employees_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);
  static String id = "admin_screen_id"; //screen id

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Center(
                child: Text(
              "Admin Paneli",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                  fontFamily: "RobotoMono"),
            )), //title
            SizedBox(
              height: 35,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3 * 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      color: Colors.red,
                      height: 50,
                      width: 220,
                      borderRadius: 20,
                      onPressed: () {
                        Navigator.pushNamed(context, AddByQrScreen.id);
                      },
                      child: Text(
                          "QR Tarayarak Çalışan Ekle")), //button for add_by_qr_screen
                  SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                      color: Colors.red,
                      height: 50,
                      width: 220,
                      borderRadius: 20,
                      onPressed: () {
                        Navigator.pushNamed(context, AddByCardScreen.id);
                      },
                      child: Text(
                          "Kart Okutarak Çalışan Ekle")), //button for add_by_card_screen
                  SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                      color: Colors.red,
                      height: 50,
                      width: 220,
                      borderRadius: 20,
                      onPressed: () {
                        Navigator.pushNamed(context, ManageEmployeesScreen.id);
                      },
                      child: Text(
                          "Çalışanları Düzenle veya Sil")), //button for manage_employees_screen
                  SizedBox(
                    height: 50,
                  ),
                  CustomElevatedButton(
                      color: Colors.red,
                      height: 50,
                      width: 220,
                      borderRadius: 20,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text("Çıkış")), //button for returning to login_screen
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
