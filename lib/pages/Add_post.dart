import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:test_logo/pages/Employee_Homefield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:test_logo/comtroller/auth/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Diamond {
  final int id;
  final String name;

  Diamond({
    required this.id,
    required this.name,
  });
}

class Add_post extends StatefulWidget {
  const Add_post({Key? key}) : super(key: key);

  @override
  State<Add_post> createState() => _Add_postState();
}

class _Add_postState extends State<Add_post> {
  _Add_postState() {
    dropdownvalue = item[0];
  }

  final authcontroller = Get.put(AuthController());
  TextEditingController _address = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _reqworker = TextEditingController();
  TextEditingController _noworker = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _timefrom = TextEditingController();
  TextEditingController _timeto = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TimeOfDay time = TimeOfDay(hour: 09, minute: 00);
  TimeOfDay time2 = TimeOfDay(hour: 07, minute: 00);
  List growableList = [];
  NetworkHandler networkHandler = NetworkHandler();
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
  final _formkey = GlobalKey<FormState>();


  moveToHome(BuildContext context) async {



    if (_formkey.currentState!.validate()) {


      Map<String,String> notification = {
        "registrationToken": authcontroller.tokenforsms.value,
        "title": "You are getting a chance for ${_reqworker.text} tap to learn more",
        "body":_desc.text.substring(0,30)+"...",
      };

      Map<String,String> storenotification = {
      "email":authcontroller.emailControllerlogin.value.text,
        "title": _reqworker.text,
        "body":_desc.text,
      };

      Map<String, String> data = {
        "name": _name.text,
        "address": _address.text,
        "contact": _contact.text,
        "reqworker": _reqworker.text,
        "noworker": _noworker.text,
        "desc": _desc.text,
        "jobtype": authcontroller.jobType.value,
        "salary": _salary.text,
        "timefrom": authcontroller.timefromaddpost.value,
        "timeto": authcontroller.timetoaddpost.value,
        "email": authcontroller.emailControllerlogin.value.text
      };
      print("/*-------------$data");

     var response =  await networkHandler.post("/user/addpost", data);
     print(response);
     var re2;
     if(response=="ok")
       {
          // re2 =  await networkHandler.post("/user/notification", notification);
         await networkHandler.post("/user/storenotification", storenotification);
          networkHandler.post("/user/notification", notification);
         Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => Home_Industry2(),
             ));

       }

//      var re2 =  await networkHandler.post("/user/notification", notification);
// if(re2=="Notification sent successfully") {
//   await networkHandler.post("/user/storenotification", storenotification);
// }
print("----------------------------------------");
// print(response);

      Fluttertoast.showToast(
          msg: "add post cread",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          fontSize: 15);
      print("notification sent succefully");


    }

  }

  String? dropdownvalue = "";
  final item = ["Full Time", "Part Time"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Padding(
            padding:  EdgeInsets.only(top: height*0.001),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Industry2()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shadowColor: Colors.transparent),
                child:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 40)),
          ),
          title:  Padding(
            padding: EdgeInsets.only(top: height*0.001),
            child: Text(
              "Add Post",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(children: [
                Padding(
                  padding:  EdgeInsets.only(top: height*0.03),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff2030A5),
                    radius: 60.0,
                    child: ClipRRect(
                      child:
                          Image.asset('assets/images/Profile.png', height: 150),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                 SizedBox(
                  height:  height*0.03,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
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
                        hintText: "Enter your Company name",
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
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
                  height:  height*0.01,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
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
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
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
                  height:  height*0.01,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                    child: TextFormField(
                      controller: _contact,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.add_call),
                        hintText: "Enter Contact No ",
                        labelText: "Contact No ",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Contact No 2 cannot be empty";
                        } else if (value.length < 10) {
                          return "Please enter valid contact number 2";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height:  height*0.01,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                    child: TextFormField(
                      controller: authcontroller.emailControllerlogin.value,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: UnderlineInputBorder(),

                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        //   hintStyle: TextStyle(color: Colors.black),
                        hintText: authcontroller.emailControllerlogin.value.text,
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
                    ),
                  ),
                ),
                SizedBox(
                  height:  height*0.01,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                    child: TextFormField(
                      controller: _salary,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.currency_rupee),
                        // prefixIcon: Icon(Icons.currency_rupee),
                        hintText: "Enter Salary for employee",
                        labelText: "Salary",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Salary cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height:  height*0.01,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                    child: TextFormField(
                      controller: _noworker,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.people),
                        hintText: "Enter no. of workers",
                        labelText: "No. of workers",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "No. of workers cannot be empty";
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
                      width:  width*0.02,
                    ),
                    Text(
                      "Enter your Requirement:",
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
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                    child: TextFormField(
                      controller: _reqworker,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.people),
                        hintText: "Enter required workers",
                        labelText: "required  workers",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required workers cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
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
                          padding:  EdgeInsets.only(left: width*0.05,bottom: height*0.01,right: width*0.04),
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
                        prefixIcon: Icon(Icons.description),
                        hintText: "Enter Description",
                        labelText: "Description",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 50, right: 50),
                //   child: MultiSelectBottomSheetField(
                //     initialChildSize: 0.4,
                //     listType: MultiSelectListType.CHIP,
                //     searchable: true,
                //     buttonText: Text(
                //       "Required Workers",
                //       style: TextStyle(
                //         fontSize: 17,
                //       ),
                //     ),
                //     title: Text("Skills"),
                //     items: _items,
                //     onConfirm: (values) {
                //       _selected_diamonds = _diamonds;
                //     },
                //     chipDisplay: MultiSelectChipDisplay(
                //       onTap: (value) {
                //         setState(() {
                //           _selected_diamonds.remove(value);
                //         });
                //       },
                //     ),
                //     validator: (value) {
                //       if (_selected_diamonds.isEmpty) {
                //         return "Skills cannot be empty";
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                SizedBox(
                  height:  height*0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(left: width*0.15),
                        child: Text(
                          '${time.hour}:${time.minute}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    // Text("${authcontroller.timefromaddpost.value}"),
                    SizedBox(
                      width:  width*0.01,
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(right: width*0.13),
                        child: ElevatedButton(
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time,
                            );
                            if (newTime == null) return;
                            setState(() => time = newTime);

                            authcontroller.timefromaddpost.value = time.toString();
                          },
                          child: Text("Select Time"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height:  height*0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(left: width*0.15),
                        child: Text(
                          '${time2.hour}:${time2.minute}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:  width*0.01,
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(right: width*0.13),
                        child: ElevatedButton(
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: time2,
                            );
                            if (newTime == null) return;
                            setState(() => time2 = newTime);
                            authcontroller.timetoaddpost.value = time2.toString();
                          },
                          child: Text("Select Time"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:EdgeInsets.only(left: width*0.15),
                  child: Row(
                    children: [
                      Text(
                        "Enter Job Type:",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width:  width*0.05,
                      ),
                      DropdownButton2(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: item
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              dropdownvalue = val as String;
                              authcontroller.jobType.value = val;
                              print("object === ${authcontroller.jobType.value}");
                            });
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height:  height*0.05,
                ),
                Material(
                  color: Color(0xff3040A5),
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 55,
                      width: 170,
                      alignment: Alignment.center,

                      // child: changebutton
                      //     ? Icon(
                      //   Icons.done,
                      //   color: Colors.white,
                      //   //color: Color(0xff3040A5)
                      // )
                      //     :
                      child: Text(
                        "Create Post",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
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
      ),
    );
  }
}
