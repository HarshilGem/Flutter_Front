import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Drawer_Employee.dart';
import 'package:test_logo/pages/Industry_settings.dart';
import 'package:test_logo/pages/Reset_Password.dart';

import '../comtroller/auth/auth_controller.dart';
class Industry_account_settings extends StatefulWidget {
  const Industry_account_settings({Key? key}) : super(key: key);
  @override
  State<Industry_account_settings> createState() => _Industry_account_settingsState();
}
final authcontroller = Get.put(AuthController());
class _Industry_account_settingsState extends State<Industry_account_settings> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        title: Text(
          "Account settings",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.02),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Industry_settings()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3040A5), shadowColor: Colors.transparent),
              child: Padding(
                padding:  EdgeInsets.only(bottom: height*0.02),
                child:  Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 25),
              )
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.03, top: height * 0.02, right: width * 0.03),
            child: Card(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Color(0xff3040A5),
                elevation: 8,
                child: ListTile(
                    leading: Icon(Icons.email,
                        color: Colors.black, size: 30),
                    title:  Text(
                      "Email address:"+"               "+authcontroller.emailControllerlogin.value.text,
                      style: TextStyle(fontSize: 20),
                    ),


                ),


            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.03, top: height * 0.02, right: width * 0.03),
            child: Card(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Color(0xff3040A5),
                elevation: 8,
                child: ListTile(
                  leading: Icon(Icons.password,
                      color: Colors.black, size: 30),
                  title:  Text(
                    "Reset password",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 25),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ResetPassword()));
                    }
                )
            ),
          ),
        ],
      ),
    );
  }
}
