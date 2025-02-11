import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Employee.dart';
import 'package:test_logo/pages/Home_Industry.dart';
import 'package:test_logo/pages/Industry_Signup.dart';
import 'package:test_logo/pages/Login_Employee.dart';

class Test_Bottom extends StatefulWidget {
  const Test_Bottom({Key? key}) : super(key: key);

  @override
  State<Test_Bottom> createState() => _Test_BottomState();
}

class _Test_BottomState extends State<Test_Bottom> {
  int currentIndex = 0;
  final screens = [
    // Center(child: Text("Home",style:TextStyle(fontSize: 60))),
    // Center(child: Text("People",style:TextStyle(fontSize: 60))),
    // Center(child: Text("Notification",style:TextStyle(fontSize: 60))),
    // Center(child: Text("Profile",style:TextStyle(fontSize: 60))),
    Home_Employee(),
    Login_Employee(),
    Industry_Signup(),
    Home_Industry(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
        centerTitle: true,
      ),
     body: screens[currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff3040A5),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: 30,
          // selectedFontSize: 25,
          // unselectedFontSize: 16,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex:  currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items:[
       BottomNavigationBarItem(
         icon:Icon(Icons.home_sharp),
         label: "Home",
         backgroundColor: Colors.indigo,
       ),
       BottomNavigationBarItem(
         icon:Icon(Icons.people_rounded),
         label: "People",
         backgroundColor: Colors.blue,
       ),
       BottomNavigationBarItem(
         icon:Icon(Icons.notifications),
         label: "Notification",
         backgroundColor: Colors.indigo,
       ),
       BottomNavigationBarItem(
         icon:Icon(Icons.person),
         label: "Profile",
         backgroundColor: Colors.blue,
       ),
     ]
     ),
    );
  }
}
