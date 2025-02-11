import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Industry_account_settings.dart';
import 'package:test_logo/pages/OnLoad.dart';

import '../comtroller/auth/auth_controller.dart';
import 'Handler/NetworkHandler.dart';
import 'Profile_Employee.dart';


class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  bool ishidden = true;
  bool ishidden2 = true;
  var email = "";
  bool showvalue = false;
  bool changebutton = false;
  final authcontroller = Get.put(AuthController());
  NetworkHandler networkHandler = NetworkHandler();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  TextEditingController emailController = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController newpassword = new TextEditingController();


 moveToHome(BuildContext context)async {


   if (_formkey.currentState!.validate())
     {
       Map<String, String> data = {
         "email": emailController.text,
         "password": password.text,
         "password2": newpassword.text
       };
      var response =  await networkHandler.post("/user/resetpassword", data);
        // var output = jsonDecode(response.body);

        print(response);

        if(response == "password incorrect")
          {
            Fluttertoast.showToast(
                    msg: "current password is incorrect",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.black,
                    fontSize: 15);
          }
        if(response == "Either email incorrect")
          {
            Fluttertoast.showToast(
                msg: "Email incorrect",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.black,
                fontSize: 15);
          }
        if(response == "password updated succesfully")
          {
            Fluttertoast.showToast(
                msg: "Password updated succesfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.black,
                fontSize: 15);
            await Future.delayed(Duration(seconds: 1));
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Industry_account_settings(),
                ));
          }
       // print(response.statusCode);
       // if(response.statusCode == 403)
       //   {
       //     print("hrllo");
       //   }
       //
       //
       // Fluttertoast.showToast(
       //     msg: "password updated succesfully go back",
       //     toastLength: Toast.LENGTH_SHORT,
       //     gravity: ToastGravity.BOTTOM,
       //     timeInSecForIosWeb: 2,
       //     backgroundColor: Colors.black,
       //     fontSize: 15);



     }


 }
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        title: Text(
          "Reset Password",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.02),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Industry_account_settings()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3040A5), shadowColor: Colors.transparent),
              child: Padding(
                padding:  EdgeInsets.only(bottom: height*0.02),
                child:  Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 25),
              )
          ),
        ),
      ),
      body: Column(
        children: [

          Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(

                        controller: emailController,
                        // obscureText: true,
                        decoration: InputDecoration(
                          // errorText: validate ? null : errorText,

                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelStyle:
                          TextStyle(color: Colors.black, fontSize: 18),
                          //   hintStyle: TextStyle(color: Colors.black),
                          hintText: "Enter your E-mail",
                          labelText: "E-mail",

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "E-mail cannot be empty";
                          }
                          if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Please enter valid E-mail address";
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
                  Container(
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        obscureText: ishidden,

                        controller: password,
                        // obscureText: true,
                        decoration: InputDecoration(
                          // errorText: validate ? null : errorText,

                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelStyle:
                          TextStyle(color: Colors.black, fontSize: 18),
                          //   hintStyle: TextStyle(color: Colors.black),
                          hintText: "Enter your Current Password",
                          labelText: "Current Password",
                          suffixIcon: InkWell(
                              onTap: () {
                                // if(ishidden==true)
                                //   {
                                //     ishidden= false;
                                //   }
                                setState(() {
                                  ishidden = !ishidden;
                                });
                              },
                              child: Icon(ishidden
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }

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
                  Container(
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(

                        controller: newpassword,
                        obscureText: ishidden2,
                        decoration: InputDecoration(
                          // errorText: validate ? null : errorText,

                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelStyle:
                          TextStyle(color: Colors.black, fontSize: 18),
                          //   hintStyle: TextStyle(color: Colors.black),
                          hintText: "Enter your New Password",
                          labelText: "New Password",
                          suffixIcon: InkWell(
                              onTap: () {
                                // if(ishidden==true)
                                //   {
                                //     ishidden= false;
                                //   }
                                setState(() {
                                  ishidden2 = !ishidden2;
                                });
                              },
                              child: Icon(ishidden2
                                  ? Icons.visibility_off
                                  : Icons.visibility)),

                        ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 8) {
                              return "Must contain at least 8 characters";
                            } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              return "Password must contain at least:\n"
                                  "one uppercase letter\n"
                                  "one lowercase letter\n"
                                  "one number\n"
                                  "one special character";
                            }
                            return null;
                          }
                        // onSaved: (String? name) {
                        //   _email = name!;
                        // },
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width*0.25,right: width*0.25),
            child: Material(
              color: Color(0xff3040A5),
              borderRadius: BorderRadius.circular(40),
              child: InkWell(
                onTap: () async => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}