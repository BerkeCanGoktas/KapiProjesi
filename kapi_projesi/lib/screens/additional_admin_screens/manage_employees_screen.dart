import 'package:flutter/material.dart';

//Screens
import 'package:kapi_projesi/screens/additional_admin_screens/edit_employee_screen.dart';
import 'package:kapi_projesi/widgets/elevated_button.dart';

class ManageEmployeesScreen extends StatefulWidget {
  const ManageEmployeesScreen({Key? key}) : super(key: key);
  static String id = "manage_employees_screen_id"; //screen id

  @override
  State<ManageEmployeesScreen> createState() => _ManageEmployeesScreenState();
}

class _ManageEmployeesScreenState extends State<ManageEmployeesScreen> {
  final List<Map> employees = [
    //list for keeping all the employees
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
    {
      "name": "Berke Can",
      "surname": "Göktaş",
      "title": "Stajyer",
      "organization": "Piton",
      "email": "berke200395@gmail.com",
      "phone": "05303677830",
      "cardID": "15adgfDFsdfa41"
    },
  ];
  int rowCount = 0; //number of rows for designing
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Text(
                "Çalışanları Düzenle veya Sil",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontFamily: "RobotoMono"),
              )), //title
              SizedBox(
                height: 25,
              ),
              Text(
                " Çalışan düzenlemek veya silmek için, çalışanın üzerine tıklayınız.",
                style: TextStyle(
                    fontFamily: "RobotoMono",
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Colors.redAccent),
              ), //explanation text
              SizedBox(
                height: 10,
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
                            "Çıkış")), //button for returning to admin_screen
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView( 
                    scrollDirection: Axis.horizontal, //making the table horizontally scrollable
                    child: DataTable( //table
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blueGrey),
                        dataRowColor: MaterialStateColor.resolveWith((states) {
                          rowCount++;
                          if (rowCount % 2 == 0) {
                            return Colors.white;
                          } else {
                            return Color.fromRGBO(0, 0, 0, 200);
                          }
                        }),
                        showCheckboxColumn: false,
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'İsim',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //first column
                          DataColumn(
                            label: Text(
                              'Soyisim',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //second column
                          DataColumn(
                            label: Text(
                              'Unvan',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //third column
                          DataColumn(
                            label: Text(
                              'Kurum',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //fourth column
                          DataColumn(
                            label: Text(
                              'E-Mail',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //fifth column
                          DataColumn(
                            label: Text(
                              'Telefon Numarası',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //sixth column
                          DataColumn(
                            label: Text(
                              'Kart ID',
                              style: TextStyle(
                                  fontFamily: "RobotoMono",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ), //seventh column
                        ],
                        rows: <DataRow>[ //rows
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                          DataRow(
                            onSelectChanged: (newValue) {
                              Navigator.pushNamed(
                                  context, EditEmployeeScreen.id);
                            },
                            cells: <DataCell>[
                              DataCell(Text('Berke Can')),
                              DataCell(Text('Göktaş')),
                              DataCell(Text('Stajyer')),
                              DataCell(Text('Piton')),
                              DataCell(Text('berke200395@gmail.com')),
                              DataCell(Text('05303677830')),
                              DataCell(Text('dafsdsf8451DFSG')),
                            ],
                          ),
                        ])),
              )
            ],
          ),
        ),
      )),
    );
  }
}
