import 'package:flutter/material.dart';

import 'package:test_logo/pages/Drawer_Employee.dart';

void main() => runApp(const Home_Employee());

class Home_Employee extends StatelessWidget {
  const Home_Employee({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: People',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notification',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xff3040A5),
          centerTitle: true,
          title: const Text('Gemstone',style:TextStyle(fontSize: 25),),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              backgroundColor: Color(0xff3040A5),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded),
              backgroundColor: Color(0xff3040A5),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              backgroundColor: Color(0xff3040A5),
              label: 'Notification',
              // icon:  ElevatedButton.icon(onPressed: (){}, icon: (Icons.notifications), label: "notification")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Color(0xff3040A5),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        drawer: Drawer_Employee(),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class page8 extends StatefulWidget {
//   const page8({Key? key}) : super(key: key);
//
//   @override
//   State<page8> createState() => _page8State();
// }
//
// class _page8State extends State<page8> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true ,
//         title: Text("Gemstone",style:TextStyle(fontSize: 25),),
//       ),
//
//       // bottomNavigationBar: BottomNavigationBar(
//       //   // currentIndex: 4,
//       //   items: [
//       //     BottomNavigationBarItem(
//       //       icon:  Icon(Icons.fact_check),
//       //       label: 'Posts',
//       //       backgroundColor: Colors.blue,
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon:  Icon(Icons.people_rounded),
//       //
//       //       //label: 'People',
//       //       backgroundColor: Colors.blue,
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon:  Icon(Icons.notifications),
//       //       label: 'Notification',
//       //       backgroundColor: Colors.blue,
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon:  Icon(Icons.person_rounded),
//       //       label: 'Profile',
//       //       backgroundColor: Colors.blue,
//       //     ),
//       //
//       //   ],
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
