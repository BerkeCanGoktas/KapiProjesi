import 'package:flutter/material.dart';

//Screens
import 'package:kapi_projesi/screens/admin_screen.dart';
import 'package:kapi_projesi/screens/login_screen.dart';
import 'package:kapi_projesi/screens/user_screen.dart';
import 'package:kapi_projesi/screens/additional_admin_screens/add_by_card_screen.dart';
import 'package:kapi_projesi/screens/additional_admin_screens/add_by_qr_screen.dart';
import 'package:kapi_projesi/screens/additional_admin_screens/manage_employees_screen.dart';
import 'package:kapi_projesi/screens/additional_admin_screens/edit_employee_screen.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(KapiProjesi());
}


class KapiProjesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          initialRoute: LoginScreen.id,                 //home screen
          routes: {
           LoginScreen.id: (context) => LoginScreen(),  //screens
           UserScreen.id: (context) => UserScreen(),
           AdminScreen.id:(context) => AdminScreen(),  
           AddByCardScreen.id:(context) => AddByCardScreen(),
           AddByQrScreen.id:(context) => AddByQrScreen(),
           ManageEmployeesScreen.id:(context) => ManageEmployeesScreen(),
           EditEmployeeScreen.id:(context) => EditEmployeeScreen() //screens
          },
    );
  }
}
