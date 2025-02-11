import 'package:flutter/material.dart';

import '../Employee_Homefield.dart';
import '../Employee_Notification.dart';
import '../Hire_Or_Job.dart';
import '../Profile_Employee.dart';


class Bottom_Navigation_bar extends StatefulWidget {
  const Bottom_Navigation_bar({Key? key}) : super(key: key);

  @override
  State<Bottom_Navigation_bar> createState() => _Bottom_Navigation_barState();
}

class _Bottom_Navigation_barState extends State<Bottom_Navigation_bar> {
  int currentIndex = 0;
  final screens = [
    Employee_Homefield(),
    Hire_Or_Job(),
    Employee_Notification(),
    Profile_Employee(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff3040A5),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 30,
        // selectedFontSize: 25,
        // unselectedFontSize: 16,
        showUnselectedLabels: false,
        // showSelectedLabels: false,
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

    );
  }
}
