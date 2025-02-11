import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'Profile_Employee.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Diamond {
  final int id;
  final String name;

  Diamond({
    required this.id,
    required this.name,
  });
}

class Edit_Profile_Employee extends StatefulWidget {
  const Edit_Profile_Employee({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Employee> createState() => _Edit_Profile_EmployeeState();
}

class _Edit_Profile_EmployeeState extends State<Edit_Profile_Employee> {
  List growableList = [];

  List _diamonds = [
    "Semi-asort",
    "Full-asort",
    "Galaxy Planner",
    "Manual Marker",
    "Sarin-operator",
    "Rekert",
    "Vajan",
    "Data entery",
    "Boil",
    "Manager",
    "Taliya",
    "Russian",
    "Table",
    "Taliya pel",
    "Blocking-chapka",
    "Mathala",
    "Diy-Fixening",
    "Dori",
  ];

  // final _items = _diamonds
  //     .map((diamond) => MultiSelectItem<Diamond>(diamond, diamond.name))
  //     .toList();
  // List<Diamond> _selected_diamonds = [];
  List selectedDiamonds = [];
  List skills = [];
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _contact2 = new TextEditingController();
  TextEditingController _currentplace = new TextEditingController();
  TextEditingController _about = new TextEditingController();

  // TextEditingController  = new TextEditingController();

  String name = "";

  bool changebutton = false;

  moveToHome(BuildContext context) async {



    if (_formkey.currentState!.validate()) {

      Map<String, String> data = {
        "name": _name.text,
        "email": _email.text,
        "contact": authcontroller.employephonenumber.value.text,
        "contact2": _contact2.text,
        "address": _address.text,
        "currentplace": _currentplace.text,
        "skills": jsonEncode(selectedDiamonds),
        "desc": _about.text
      };
      print("/*-------------$data");

      await networkHandler.post("/emp/updateempprofile", data);
      print("done");
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home_Employee2(),
          ));
      setState(() {
        changebutton = false;
      });
    }
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(top: height * 0.001),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home_Employee2()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shadowColor: Colors.transparent),
                child: const Icon(Icons.arrow_back,
                    color: Colors.black, size: 40)),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: height * 0.001),
            child: Text(
              "Edit Profile",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: CircleAvatar(
                  backgroundColor: const Color(0xff2030A5),
                  radius: 80.0,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/Profile.png',
                      height: 150,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD9D9D9),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // border: UnderlineInputBorder(),
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Enter your name",
                      labelText: "Name",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      //hintStyle: TextStyle(fontSize: 30)
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD9D9D9),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // border: UnderlineInputBorder(),
                      //border: InputBorder.none,

                      prefixIcon: const Icon(Icons.email),
                      hintText: "Enter your E-mail",
                      labelText: "E-mail",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "E-mail cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD9D9D9),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // border: UnderlineInputBorder(),
                      //border: InputBorder.none,

                      prefixIcon: const Icon(Icons.location_pin),
                      hintText: "Enter your Address",
                      labelText: "Address",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: TextFormField(
                    controller: _contact2,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9D9D9),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //border: UnderlineInputBorder(),
                      // border: UnderlineInputBorder(),
                      //border: InputBorder.none,

                      prefixIcon: Icon(Icons.add_call),
                      hintText: "Enter Contact No.2",
                      labelText: "Contact No.2",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact No.2 cannot be empty";
                      } else if (value.length < 10) {
                        return "Please enter valid contact number 2";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: TextFormField(
                    controller: _currentplace,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD9D9D9),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // border: UnderlineInputBorder(),
                      //border: InputBorder.none,

                      prefixIcon: const Icon(Icons.location_pin),
                      hintText: "Enter your Current Place",
                      labelText: "Current Place",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Current Place cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: TextFormField(
                    controller: _about,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD9D9D9),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //border: UnderlineInputBorder(),
                      //border: InputBorder.none,

                      prefixIcon: const Icon(Icons.info_outline_rounded),
                      hintText: "Enter more about yourself",
                      labelText: "About",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: EdgeInsets.only(left: width * 0.14),
                child: Row(children: [
                  Icon(Icons.workspaces_sharp),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Edit your skills:",
                    style: TextStyle(fontSize: 17),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 50,right: 50),
                  //   child: MultiSelectBottomSheetField(
                  //     initialChildSize: 0.4,
                  //     listType: MultiSelectListType.CHIP,
                  //     searchable: true,
                  //     buttonText: Text("Diamond Fields"),
                  //     title: Text("Diamond"),
                  //     items: _items,
                  //     onConfirm: (values) {
                  //       _selected_diamonds = _diamonds;
                  //
                  //         growableList.add(_selected_diamonds.toString());
                  //         print("-------> ${growableList}");
                  //
                  //     },
                  //
                  //
                  //     chipDisplay: MultiSelectChipDisplay(
                  //       onTap: (value) {
                  //
                  //
                  //         setState(() {
                  //           _selected_diamonds.remove(value);
                  //           print("-------> ${growableList}");
                  //         });
                  //       },
                  //     ),
                  //     validator: (value) {
                  //       if (_selected_diamonds.isEmpty)
                  //       {
                  //         return "Skills cannot be empty";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                ]),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Wrap(
                children: [
                  for (var i = 0; i < _diamonds.length; i++)
                    InkWell(
                      onTap: () {
                        if (selectedDiamonds
                            .contains(_diamonds[i].toString())) {
                          setState(() {
                            selectedDiamonds.remove(_diamonds[i].toString());
                          });
                          print(
                              "-----------------------------------> ${selectedDiamonds}");
                        } else {
                          setState(() {
                            selectedDiamonds.add("${_diamonds[i].toString()}");
                            print(
                                "-----------------------------------> ${selectedDiamonds}");
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.05,
                            bottom: height * 0.01,
                            right: width * 0.04),
                        child: Text(
                          _diamonds[i].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: selectedDiamonds
                                      .contains(_diamonds[i].toString())
                                  ? Colors.blue
                                  : Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Material(
                color: Color(0xff3040A5),
                borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: changebutton ? 50 : 150,
                    alignment: Alignment.center,
                    child: changebutton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            //color: Color(0xff3040A5)
                          )
                        : Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ]),
          ),
        ));
  }
}
