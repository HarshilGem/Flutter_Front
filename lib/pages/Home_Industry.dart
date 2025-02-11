import 'package:flutter/material.dart';

import 'package:test_logo/pages/Drawer_Industry.dart';




void main() => runApp(const Home_Industry());

  class Home_Industry extends StatelessWidget {
  const Home_Industry({Key? key}) : super(key: key);

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
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Add Post',
      style: optionStyle,
    ),
    Text(
      'Index 3: Notification',
      style: optionStyle,
    ),
    Text(
      'Index 4: Profile',
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
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height*0.1,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                backgroundColor: Color(0xff3040A5),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                backgroundColor: Color(0xff3040A5),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline,size: 50),
                backgroundColor: Color(0xff3040A5),
                label: 'Add Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                backgroundColor: Color(0xff3040A5),
                label: 'Notification',
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
        ),
        drawer: Drawer_Industry(),
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
