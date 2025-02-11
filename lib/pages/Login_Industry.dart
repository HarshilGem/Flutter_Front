import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_logo/pages/Forget_Password.dart';

import 'package:test_logo/pages/Handler/NetworkHandlerForIndustryLogin.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_logo/pages/Profile_Employee.dart';

import 'Login_Employee.dart';

class Login_Industry extends StatefulWidget {
  const Login_Industry({Key? key}) : super(key: key);

  @override
  State<Login_Industry> createState() => _Login_IndustryState();
}

class _Login_IndustryState extends State<Login_Industry> {
  String name = "";
  bool showvalue = false;
  NetworkHandlerLogin networkHandlerLogin = NetworkHandlerLogin();
  bool changebutton = false;
  bool ishidden = true;
  String _email = "";
  bool vaidate = false;
  bool isLoading = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirm = TextEditingController();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double pass_strength = 0;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    await check();
    if (_formkey.currentState!.validate() && vaidate==true) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home_Industry2(),
          ));
      setState(() {
        changebutton = false;
      });
      // setState(() {
      //   isLoading = true;
      // }
      // );
      // await Future.delayed(const Duration(seconds: 5));
      // setState(() {
      //   isLoading = false;
      // });
      // (isLoading)
      //     ? Center(
      //     child: CircularProgressIndicator(
      //       color: Colors.black,
      //       strokeWidth: 1.5,
      //     )
      // ) : await Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Home_Industry2(),
      //     ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3040A5),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Image.asset("assets/images/page5.1.png",
                        height: height * 0.15, width: width * 0.7),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        controller: authcontroller.emailControllerlogin.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter Email",
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          //hintStyle: TextStyle(fontSize: 30)
                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
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
                    height: height * 0.02,
                  ),
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 50.0, right: 50),
                  //     child: TextFormField(
                  //       controller: _password,
                  //       obscureText: ishidden,
                  //       decoration: InputDecoration(
                  //         filled: true,
                  //         fillColor: Color(0xffD9D9D9),
                  //         border: OutlineInputBorder(),
                  //         enabledBorder: OutlineInputBorder(
                  //           //borderRadius: BorderRadius.circular(30),
                  //         ),
                  //         prefixIcon: Icon(Icons.lock),
                  //         suffixIcon: InkWell(
                  //             onTap: () {
                  //               // if(ishidden==true)
                  //               //   {
                  //               //     ishidden= false;
                  //               //   }
                  //               setState(() {
                  //                 ishidden = !ishidden;
                  //               });
                  //             },
                  //             child: Icon(ishidden ? Icons.visibility_off : Icons
                  //                 .visibility)
                  //
                  //         ),
                  //         hintText: "Enter Password",
                  //         labelText: "Password",
                  //         labelStyle: TextStyle(color: Colors.black,
                  //             fontSize: 18),
                  //         //hintStyle: TextStyle(color: Colors.black)
                  //       ),
                  //
                  //       validator: (value) {
                  //         if (value!.isEmpty) {
                  //           return "Password cannot be empty";
                  //         }
                  //         return null;
                  //         // else {
                  //         //   bool result = validatePassword(value);
                  //         //   if(result){
                  //         //     return null;
                  //         //   }
                  //         // else{
                  //         //   return "password should contain capital,small letter & capital letter";
                  //         //   }
                  //         // }
                  //       },
                  //       onChanged: (value) {
                  //         name = value;
                  //         setState(() {});
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                          controller: _password,
                          obscureText: ishidden,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffD9D9D9),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            //border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
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
                            hintText: "Enter Password",
                            labelText: "Password",
                            labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                            //hintStyle: TextStyle(color: Colors.black)
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
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Forgot_Password(),
                  ));
                  },child: Text("Forget Password?",style: TextStyle(decoration: TextDecoration.underline),)),
                  SizedBox(
                    height: 40,
                  ),

                  // InkWell(
                  //   onTap: () async=> moveToHome(context),
                  //     child:Center(
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 10.0),
                  //       child: Container(
                  //       width: 150,
                  //       height: 50,
                  //       decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //         color: Color(0xff3040A5)
                  //         ),
                  //       child: Center(
                  //        child:Text("Login", style: TextStyle(color: Colors.white,
                  //        fontSize: 18,
                  //          fontWeight: FontWeight.bold
                  //         ),
                  //         ),
                  //       ),
                  Material(
                    color: Color(0xff3040A5),
                    borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changebutton ? 50 : 140,
                        alignment: Alignment.center,

                        child: changebutton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                                //color: Color(0xff3040A5)
                              )
                            : Text(
                                "Login",
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
                  )
                ],
              ),
            ),
          ),
        ));
  }

  check() async {
    Map<String, String> data = {
      "email": authcontroller.emailControllerlogin.value.text,
      "password": _password.text,
    };

    var response = await networkHandlerLogin.post("/user/login", data);
    var output = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(output['token']);
      // Fluttertoast.showToast(msg: output);
      setState(() {
        vaidate = true;
      });
    } else {
      print(output);
      setState(() {
        vaidate = false;
      });
      Fluttertoast.showToast(msg: output);
    }
    //   setState((){
    // vaidate=true;
    //   });
  }
}
