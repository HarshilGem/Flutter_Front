import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Applied_Employee_List.dart';
import 'package:test_logo/pages/Industry_settings.dart';
import 'package:test_logo/pages/Profile_Industry.dart';
import 'package:test_logo/comtroller/auth/auth_controller.dart';
class Drawer_Industry extends StatefulWidget {
  const Drawer_Industry({Key? key}) : super(key: key);

  @override
  State<Drawer_Industry> createState() => _Drawer_IndustryState();
}
final authcontroller = Get.put(AuthController());
class _Drawer_IndustryState extends State<Drawer_Industry> {
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
                accountName: Text("Email:"),
                accountEmail: Text(authcontroller.emailControllerlogin.value.text),
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
                  leading:Icon(Icons.settings,color: Colors.black,
                  ),
                  title:Text(
                    "Settings",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.black),
                  ),
                 onTap: () {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Industry_settings()));
                 }
              ),
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
            ListTile(
                leading:Icon(Icons.people,color: Colors.black,
                ),
                title:InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Applied_Employee_List()));
                  },
                  child: Text(
                    "New Joinings",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.black),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
