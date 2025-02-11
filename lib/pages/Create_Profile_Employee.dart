import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:test_logo/pages/Login_Employee.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:test_logo/pages/Login_Employee2.dart';

import '../comtroller/auth/auth_controller.dart';

class Diamond {
  final int id;
  final String name;

  Diamond({
    required this.id,
    required this.name,
  });
}

class CreateProfileEmployee extends StatefulWidget {
  const CreateProfileEmployee({Key? key}) : super(key: key);

  @override
  State<CreateProfileEmployee> createState() => _CreateProfileEmployeeState();
}

class _CreateProfileEmployeeState extends State<CreateProfileEmployee> {
  final _otplessFlutterPlugin = Otpless();
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
  List selectedDiamonds = [];
  List skills = [];

  // List<Diamond> _item = [];
  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _contact2 = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _currentplace = TextEditingController();
  TextEditingController _skills = TextEditingController();
  TextEditingController _desc = TextEditingController();
  bool showvalue = false;
  bool validate = false;
  NetworkHandler networkHandler = NetworkHandler();
  String name = "";
  bool changebutton = false;

  // String _email = "";
  bool circular = false;
  final authcontroller = Get.put(AuthController());
  moveToHome(BuildContext context) async {
    Text("done");
    if (_formkey.currentState!.validate()) {
      Map<String, String> data = {
        "name": _name.text,
        "email": _email.text,
        "contact":  authcontroller.employephonenumber.value.text,
        "contact2": _contact2.text,
        "address": _address.text,
        "currentplace": _currentplace.text,
        "skills": jsonEncode(selectedDiamonds),
        "desc": _desc.text,
        "year":_year.text,
        "salary":_salary.text
      };
      authcontroller.profilename.value=_name;
      authcontroller.profileemail.value=_email;
      authcontroller.profilecontact.value=authcontroller.employephonenumber.value;
      authcontroller.profilecontact2.value=_contact2;
      authcontroller.profileaddress.value=_address;
      authcontroller.profilecurrentplace.value=_currentplace;
      authcontroller.profileskills.value.text= jsonEncode(selectedDiamonds);
      authcontroller.profiledesc.value=_desc;
      authcontroller.profileyear.value=_year;
      authcontroller.profilesalary.value=_salary;


      Map<String, String> noti = {
        "contact" : "1111111111",
        "body": jsonEncode(selectedDiamonds),
        "title":_desc.text
      };
      Map<String,String> notification = {
        "registrationToken": authcontroller.tokenforsms.value,
        "title": "New Employee skills ${jsonEncode(selectedDiamonds[0])+"..."} ",
        "body":_desc.text.substring(0,30)+"...",
      };


      print("/*-------------$data");

      // await networkHandler.post("https://97ca-2405-201-200d-11ff-f497-d43c-aeea-86e1.in.ngrok.io/user/storenotificationindustry",data);
    var response =   await networkHandler.post("/emp/createproemp", data);
    print(response);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_Employee2()));
    if(response=="ok")
      {
        // var res = await networkHandler.post("/emp/storenotificationindustry", noti);
        //
        // print(res);
        if(response=="ok")
          {
      networkHandler.post("/user/notification", notification);

      Navigator.push(
         context, MaterialPageRoute(builder: (context) => Login_Employee2()));
          }
    //   var res=   await networkHandler.post("/user/notification", notification);

      }



      // await networkHandler.post("/emp/storenotificationindustry", noti);
      // await networkHandler.post("/user/notification", notification);




      setState(() {
        changebutton = false;
      });
    }

  }

  @override
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    selectedDiamonds.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
      child: Form(
        key: _formkey,
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height*0.02),
                    child: Image.asset("assets/images/page3.jpg",
                        fit: BoxFit.cover,
                        height: height * 0.25,
                        width: width * 0.7),
                  ),
                   Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.030,
                          right: width * 0.01),
                      child: const Text(
                        "Create Profile",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          //decoration: TextDecoration.underline,
                        ),
                      )),
                   SizedBox(
                    height: height * 0.001,
                  ),
                   Padding(
                    padding: EdgeInsets.only( left: width * 0.150, right: width * 0.160),
                    child: Text(
                      "For Getting Job Only",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: height * 0.01 * 3,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),

                          prefixIcon: Icon(Icons.person),
                          hintText: "Enter your name",
                          labelText: "Name",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          //hintStyle: TextStyle(fontSize: 30)
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
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
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        // obscureText: true,
                        controller: _email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),

                          prefixIcon: Icon(Icons.email),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          //   hintStyle: TextStyle(color: Colors.black),
                          hintText: "Enter your email",
                          labelText: "E-mail",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }

                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Please enter valid email address";
                          }
                          return null;
                        },
                        // onSaved: (String? name) {
                        //   _email = name!;
                        // },
                      ),
                    ),
                  ),
                   SizedBox(
                    height: height * 0.01,
                  ),



                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.add_call),
                          hintText: "Enter Contact No 2",
                          labelText: "Contact No 2",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty)
                        //   {
                        //     return "Contact No cannot be empty";
                        //   }
                        //   else if (value.length < 10 )
                        //   {
                        //     return "Please enter valid contact number";
                        //   }
                        //   return null;
                        // },
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
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        controller: _address,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.location_pin),
                          hintText: "Enter your Address",
                          labelText: "Address",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
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
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        controller: _currentplace,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.place),
                          hintText: "Enter your current place",
                          labelText: "Current Place",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Current place cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height:  height*0.02,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        controller: _year,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.work),
                          hintText: "Enter Year Of Experience",
                          labelText: "Experience",
                          labelStyle: TextStyle(color: Colors.black,
                              fontSize: 18),
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty)
                          {
                            return "Year of experience cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height:  height*0.02,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        controller: _salary,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.currency_rupee_rounded),
                          hintText: "Enter Your Salary Range",
                          labelText: "Salary Range",
                          labelStyle: TextStyle(color: Colors.black,
                              fontSize: 18),
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty)
                          {
                            return "Salary range cann't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height:  height*0.02,
                  ),
                  Container(
                    padding:  EdgeInsets.only(left: width*0.14),
                    child: Row(children: [
                      Icon(Icons.workspaces_sharp),
                      SizedBox(
                        height:  height*0.01,
                      ),
                      SizedBox(
                        width:  width*0.02,
                      ),
                      Text(
                        "Select your skills:",
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
                      //     },
                      //     chipDisplay: MultiSelectChipDisplay(
                      //       onTap: (value) {
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
                    height:  height*0.02,
                  ),

                  Wrap(
                    children: [
                      for (var i = 0; i < _diamonds.length; i++)
                        InkWell(
                          onTap: () {
                            if (selectedDiamonds
                                .contains(_diamonds[i].toString())) {
                              setState(() {
                                selectedDiamonds
                                    .remove(_diamonds[i].toString());
                              });
                              print(
                                  "-----------------------------------> ${selectedDiamonds}");
                            } else {
                              setState(() {
                                selectedDiamonds
                                    .add("${_diamonds[i].toString()}");
                                print(
                                    "-----------------------------------> ${selectedDiamonds}");
                              });
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(left: width*0.05,bottom: height*0.01,right: width*0.001),
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
                    height:  height*0.02,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                      child: TextFormField(
                        controller: _desc,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,
                          prefixIcon: Icon(Icons.info_outline_rounded),
                          hintText: "Enter more about yourself",
                          labelText: "About",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:  height*0.02,
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
                                "Create",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                        // decoration: BoxDecoration(
                        //   color: Colors.lightGreen,
                        //   //shape: changebutton?BoxShape.circle:BoxShape.rectangle,
                        //
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:  height*0.05,
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
