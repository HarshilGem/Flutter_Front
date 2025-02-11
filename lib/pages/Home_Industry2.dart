import 'package:flutter/material.dart';
import 'package:test_logo/pages/Add_post.dart';
import 'package:test_logo/pages/Employee_Notification.dart';
import 'package:test_logo/pages/Html_Test.dart';
import 'package:test_logo/pages/Industry_Homefield.dart';
import 'package:test_logo/pages/Industry_Notification.dart';
import 'package:test_logo/pages/Profile_Industry.dart';
import 'package:test_logo/pages/Drawer_Industry.dart';

class Home_Industry2 extends StatefulWidget {
  dynamic result;
   Home_Industry2({Key? key,this.result}) : super(key: key);

  @override
  State<Home_Industry2> createState() => _Home_Industry2State();
}

class _Home_Industry2State extends State<Home_Industry2> {
  int currentIndex = 0;
  final screens = [
   Industry_Homefield(),
    GFG(),
    Add_post(),
    Industry_Notification(),
    Profile_Industry(),
  ];

  //DateTime timeBackpressed  = DateTime.now();
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          // final difference = DateTime.now().difference(timeBackpressed);
          // final  isExisting = difference >= Duration(seconds: 2);
          // timeBackpressed = DateTime.now();
          // if(isExisting)
          //   {
          //     final message = 'press back aain to exit ';
          //     Fluttertoast.showToast(msg: message);
          //     return false;
          //   }
          // else
          //   {
          //     return true;
          //   }
          final shouldPop = await showWarning(context);
          return shouldPop;

        },

        child: SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //  backgroundColor:Color(0xff3040A5),
            // centerTitle: true,
            //  title: const Text('Gemstone',style:TextStyle(fontSize: 25),),
            // ),
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
                currentIndex: currentIndex,
                onTap: (index) => setState(() => currentIndex = index),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_sharp),
                    label: "Home",
                    backgroundColor: Colors.indigo,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                    backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline, size: 50),
                    label: "Add Post",
                    backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: "Notification",
                    backgroundColor: Colors.indigo,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                    backgroundColor: Colors.blue,
                  ),
                ]),

          ),
        ),
      );
}

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
