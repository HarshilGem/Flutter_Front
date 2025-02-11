import 'package:flutter/material.dart';
// import 'package:test_logo/pages/Help.dart';
import 'package:test_logo/pages/Industry_settings.dart';
import 'package:test_logo/pages/User_Manual.dart';

import 'Help.dart';
class Help_and_Support_Page extends StatefulWidget {
  const Help_and_Support_Page({Key? key}) : super(key: key);

  @override
  State<Help_and_Support_Page> createState() => _Help_and_Support_PageState();
}

class _Help_and_Support_PageState extends State<Help_and_Support_Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        title: Text(
          "Help",
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
                primary: Color(0xff3040A5),
                // shadowColor: Colors.transparent
              ),
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
                  leading: Icon(Icons.help_rounded,
                      color: Colors.black, size: 30),
                  title:  Text(
                    "Help & Support",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 25),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Help()));
                  },
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
                    leading: Icon(Icons.chrome_reader_mode_rounded,
                        color: Colors.black, size: 30),
                    title:  Text(
                      "User Manual",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 25),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => User_Manual()));
                    }
                )
            ),
          ),
        ],
      ),
    );
  }
}
