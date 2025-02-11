import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/comtroller/auth/auth_controller.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/Login_Industry.dart';

class Create_Profile_Industry extends StatefulWidget {
  const Create_Profile_Industry({Key? key}) : super(key: key);

  @override
  State<Create_Profile_Industry> createState() =>
      _Create_Profile_IndustryState();
}

class _Create_Profile_IndustryState extends State<Create_Profile_Industry> {
  TimeOfDay time = TimeOfDay(hour: 09, minute: 00);
  TimeOfDay time2 = TimeOfDay(hour: 07, minute: 00);
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _desc = TextEditingController();
  // TextEditingController _timefrom = TextEditingController();
  // TextEditingController _timeto = TextEditingController();
  final authcontroller = Get.put(AuthController());
  NetworkHandler networkHandler = NetworkHandler();
  String name = "";
  bool validate = false;
  bool changebutton = false;
  String _email = "";

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      Map<String, String> data = {
        "email": authcontroller.emailControllerlogin.value.text,
        "name": _name.text,
        "contact": _contact.text,
        "address": _address.text,
        "desc": _desc.text,
        "timefrom": authcontroller.timefrom.value,
        "timeto": authcontroller.timeto.value,
      };
      print("/*-------------$data");
      await networkHandler.post("/user/createpro", data);

      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login_Industry(),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.02),
                child: Image.asset("assets/images/page3.jpg",
                    fit: BoxFit.cover,
                    height: height * 0.25,
                    width: width * 0.7),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.030,
                      left: width * 0.0100,
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
                padding:
                    EdgeInsets.only(left: width * 0.250, right: width * 0.250),
                child: Text(
                  "For Hiring Only",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: height * 0.01 * 3,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                      hintText: "Enter your company Name",
                      labelText: "Company Name",
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
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                  child: TextFormField(
                    enabled: false,
                    // obscureText: true,
                    controller: authcontroller.emailControllerlogin.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9D9D9),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      // border: UnderlineInputBorder(),

                      prefixIcon: Icon(Icons.email),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      //   hintStyle: TextStyle(color: Colors.black),
                      hintText: authcontroller.emailController.value.text,
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
                    onSaved: (String? name) {
                      _email = name!;
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
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                      hintText: "Enter Contact No",
                      labelText: "Contact",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact No cannot be empty";
                      } else if (value.length < 10) {
                        return "Please enter valid contact number";
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
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                height: height * 0.01,
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      // hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.15),
                      child: Text(
                        '${time.hour}:${time.minute}',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  // Text("${authcontroller.timefrom.value}"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: width * 0.13),
                      child: ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );
                          if (newTime == null) return;
                          setState(() => time = newTime);

                          authcontroller.timefrom.value = time.toString();
                        },
                        child: Text("Select Time"),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.15),
                      child: Text(
                        '${time2.hour}:${time2.minute}',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: width * 0.13),
                      child: ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: time2,
                          );
                          if (newTime == null) return;
                          setState(() => time2 = newTime);
                          authcontroller.timeto.value = time2.toString();
                        },
                        child: Text("Select Time"),
                      ),
                    ),
                  )
                ],
              ),
              // Container(
              //   child: Padding(
              //     padding:  EdgeInsets.only(left: 50.0, right: 50),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         // filled: true,
              //         // fillColor: Color(0xffD9D9D9),
              //         // border: OutlineInputBorder(),
              //         // enabledBorder: OutlineInputBorder(
              //         //   borderRadius: BorderRadius.circular(30),
              //         // ),
              //         border: UnderlineInputBorder(),
              //         //border: InputBorder.none,
              //         prefixIcon: Icon(Icons.access_time),
              //         hintText: "Enter your Company Time",
              //         labelText: "Company Time",
              //         labelStyle: TextStyle(color: Colors.black,
              //             fontSize: 18),
              //         // hintStyle: TextStyle(color: Colors.black)
              //       ),
              //       validator: (value) {
              //         if (value!.isEmpty)
              //         {
              //           return "Company Time cannot be empty";
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(
                height: height * 0.03,
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
                height: height * 0.05,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
