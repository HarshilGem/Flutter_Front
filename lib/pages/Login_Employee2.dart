import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:test_logo/pages/Create_Profile_Employee.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:test_logo/pages/Profile_Employee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:test_logo/pages/Handler/NetworkHandlerForIndustryLogin.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Login_Employee.dart';

class Login_Employee2 extends StatefulWidget {
  const Login_Employee2({Key? key}) : super(key: key);

  @override
  State<Login_Employee2> createState() => _Login_Employee2State();
}

class _Login_Employee2State extends State<Login_Employee2> {
  String name = "";
  bool showvalue = false;
  NetworkHandlerLogin networkHandlerLogin = NetworkHandlerLogin();
  bool changebutton = false;
  bool ishidden = true;
  String _email = "";
  bool vaidate = false;
  bool isLoading = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mobile = TextEditingController();
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
            builder: (context) => Home_Employee2(),
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
                    height: height * 0.10,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.1, right: width * 0.1),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: authcontroller.employephonenumber.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.people),
                          hintText: "Enter your Contact Number",
                          labelText: "Contact No.",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          //hintStyle: TextStyle(fontSize: 30)
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
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width*0.01),
                    child: Row(
                        children: [
                          Expanded(
                              child: Divider(color: Colors.black,
                              thickness: 2,
                              indent: 40,
                              endIndent: 10,)
                          ),
                          Text("OR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Expanded(
                              child: Divider(color: Colors.black,
                              thickness: 2,
                                indent: 10,
                                endIndent: 40,)
                          ),
                        ]
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width*0.1),
                    child: SizedBox(
                      height: height * 0.08,
                      width: width * 0.8,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.1),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.whatsapp,
                              size: 30, color: Colors.black),
                          // onPressed: () {Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Create_Profile_Employee()),
                          // );},

                          onPressed: () async {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => Create_Profile_Employee()));
                            // final header = <String, String>{};
                            // header.addAll({
                            //   'appId': 'OTPLess:XSOPDIACXTHYYQHEGTKVKGZNIOQYQNUV',
                            //   'Content-Type': 'application/json'
                            // });
                            // final body = <String, String>{};
                            // body.addAll({
                            // "loginMethod": "WHATSAPP",
                            // "redirectionURL": "https://test-app-3362.herokuapp.com/",
                            // "state": "YOUR_STATE",
                            // "orderId": "YOUR_ORDER_ID"
                            // });
                            //
                            //
                            //
                            //
                            // http.Response response = await http.post(
                            //   Uri.parse(
                            //       "https://api.otpless.app/v1/client/user/session/initiate"),
                            //   body:body,
                            //   headers: header,
                            //
                            //
                            // );
                            //
                            // print("hello");
                            // final res = json.decode(response.body);
                            // if(res['message'] == "Session initiated successfully" || res['intent'] != null){
                            //   launchUrl(Uri.parse(res['intent']!.trim()),mode: LaunchMode.platformDefault);
                            //
                            // }
                            var headers = {
                              'appId': 'OTPLess:XSOPDIACXTHYYQHEGTKVKGZNIOQYQNUV',
                              'Content-Type': 'application/json'
                            };
                            var request = http.Request(
                                'POST',
                                Uri.parse(
                                    'https://api.otpless.app/v1/client/user/session/initiate'));
                            request.body = json.encode({
                              "loginMethod": "WHATSAPP",
                              "redirectionURL":
                              "https://gemstonefinal.page.link/start",
                              "state": "YOUR_STATE",
                              "orderId": "YOUR_ORDER_ID"
                            });
                            request.headers.addAll(headers);

                            http.StreamedResponse response = await request.send();
                            debugPrint(
                                "Response==================${response.stream}");
                            if (response.statusCode == 200) {
                              var res = await response.stream.bytesToString();
                              debugPrint("Response STream=================>${res}");
                              var res2 = jsonDecode(res);
                              print(res2["data"]["intent"]);
                              if (res2['message'] ==
                                  "Session initiated successfully" ||
                                  res2['data']['intent'] != null) {
                                launchUrl(Uri.parse(res2['data']['intent']!.trim()),
                                    mode: LaunchMode.platformDefault);
                              }
                            } else {
                              print(response.reasonPhrase);
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home_Employee2()));

                            // Map<String, String> data = {
                            //   "name": "jetani harshil",
                            //   "mobile": "9925975431",
                            //
                            //
                            // };
                            // print("/*-------------$data");
                            // await networkHandlerForEmpSignup.post("/emp/regist", data);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff25D366),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                          label: Padding(
                            padding: EdgeInsets.only(left: width * 0.001),
                            child: Text(
                              "Login With Whatsapp",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.15,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  check() async {
    Map<String, String> data = {
      "mobile":authcontroller.employephonenumber.value.text,
    };

    var response = await networkHandlerLogin.post("/emp/login", data);
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

