import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Applied_Page.dart';
import 'package:test_logo/pages/Employee_settings.dart';

import '../comtroller/auth/auth_controller.dart';

class Drawer_Employee extends StatefulWidget {
  const Drawer_Employee({Key? key}) : super(key: key);

  @override
  State<Drawer_Employee> createState() => _Drawer_EmployeeState();
}
final authcontroller = Get.put(AuthController());

class _Drawer_EmployeeState extends State<Drawer_Employee> {
  @override
  Widget build(BuildContext context){
    // final imageUrl = "https://lh3.googleusercontent.com/ogw/AOh-ky1ecRxoRULPb7VXsNpgLKjTwf3nVpB_THIrgyG5=s32-c-mo";
    final imageUrl = "assets/images/Profile.png";
    return Drawer(
      child:Container(
        //color: Colors.blue,
        //color: Color(0xff3040A5),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Mobile no:"),
                accountEmail: Text(authcontroller.employephonenumber.value.text),
                currentAccountPicture: CircleAvatar(
                  // backgroundImage: NetworkImage(imageUrl),
                  child: ClipRRect(
                    child: Image.asset(imageUrl,
                        height: 100),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
                leading:Icon(Icons.work,color: Colors.black,
                ),
                title:Text(
                  "Applied Jobs",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),
                ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Applied_Page()));
              } ,

            ),
             ListTile(
                  leading:Icon(Icons.settings,color: Colors.black,
                  ),
                  title:Text(
                    "Settings",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Employee_settings()));
                  }),
            ListTile(
                leading:Icon(Icons.description,color: Colors.black,
                ),
                title:Text(
                  "About Us",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),
                )
            ),
            ListTile(
                leading:Icon(Icons.contact_phone,color: Colors.black,
                ),
                title:Text(
                  "Contact Us",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),
                )
            ),
          ],
        ),
      ),
    );
  }
}
