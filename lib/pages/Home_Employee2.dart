import 'package:flutter/material.dart';
import 'package:test_logo/pages/Drawer_Employee.dart';
import 'package:test_logo/pages/Employee_Homefield.dart';
import 'package:test_logo/pages/Employee_Network.dart';
import 'package:test_logo/pages/Employee_Notification.dart';
import 'package:test_logo/pages/Hire_Or_Job.dart';
import 'package:test_logo/pages/Industry_Notification.dart';
import 'package:test_logo/pages/Profile_Employee.dart';

class Home_Employee2 extends StatefulWidget {
  const Home_Employee2({Key? key}) : super(key: key);

  @override
  State<Home_Employee2> createState() => _Home_Employee2State();
}

class _Home_Employee2State extends State<Home_Employee2> {
  int currentIndex = 0;
  final screens = [
    Employee_Homefield(),
    Employee_Network(),
   Employee_Notification(),
    Profile_Employee(),
  ];

  @override
  Widget build(BuildContext context)  => WillPopScope (
      onWillPop: () async{
        final shouldPop = await showWarning(context);
        return shouldPop;
      },

    child: SafeArea(
        child: Scaffold(
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

          ),

        ),
    ),

  );
}

// appBar: AppBar(
//  backgroundColor:Color(0xff3040A5),
// centerTitle: true,
//  title: const Text('Gemstone',style:TextStyle(fontSize: 25),),
// ),

Future<bool> showWarning(BuildContext context) async {
  bool exitapp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are You Sure You Want To Exit??"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("No")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Yes"))
          ],
        );

      }

  );
  return exitapp ;

}