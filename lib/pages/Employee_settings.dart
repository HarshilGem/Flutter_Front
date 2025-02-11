import 'package:flutter/material.dart';
// import 'package:test_logo/pages/Employee_account_settings.dart';
// import 'package:test_logo/pages/Help_and_Support_Page.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/Industry_Homefield.dart';
import 'package:test_logo/pages/Privacy_Policy.dart';

import 'Employee_account_settings.dart';
import 'Help_and_Support_Page.dart';

class Employee_settings extends StatefulWidget {
  const Employee_settings({Key? key}) : super(key: key);

  @override
  State<Employee_settings> createState() => _Employee_settingsState();
}

class _Employee_settingsState extends State<Employee_settings> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.02),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_Employee2()));
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
                  leading: Icon(Icons.manage_accounts,
                      color: Colors.black, size: 30),
                  title:  Text(
                    "Account settings",
                    style: TextStyle(fontSize: 20),
                  ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Employee_account_settings()));
                    }
                )
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
                    leading: Icon(Icons.language,
                        color: Colors.black, size: 30),
                    title: Text(
                      "Language",
                      style: TextStyle(fontSize: 20),
                    ))),
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
                    leading: Icon(Icons.help,
                        color: Colors.black, size: 30),
                    title: Text(
                      "Help",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Help_and_Support_Page()));
                    }
                )
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
                    leading: Icon(Icons.privacy_tip_rounded,
                        color: Colors.black, size: 30),
                    title: Text(
                      "Privacy policy",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Privacy_Policy()));
                    }
                )),
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
                    leading: Icon(Icons.logout,
                        color: Colors.black, size: 30),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontSize: 20),
                    ))),
          )
        ],
      ),
    );
  }
}
