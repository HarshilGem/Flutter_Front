import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_logo/comtroller/auth/auth_controller.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:http/http.dart' as http;
import 'package:test_logo/pages/Hire_Or_Job.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Login_Industry.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'New_Password.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}


class _Forgot_PasswordState extends State<Forgot_Password> {
  NetworkHandler networkHandler = NetworkHandler();
  final authcontroller = Get.put(AuthController());

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate() && validate == true) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => New_Password()));
    }}
  final _formkey = GlobalKey<FormState>();
  bool validate = false;
  String _email = "";
  String name = "";
  TextEditingController email = TextEditingController();
  // TextEditingController _usernameController = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  TextEditingController _otpcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3040A5),
          title: Text(
            "Forgot Password",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login_Industry()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff3040A5),
                    shadowColor: Colors.transparent),
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.02),
                  child: Icon(Icons.arrow_back_ios_new,
                      color: Colors.white, size: 25),
                )),
          ),
        ),
        body: Form(
          key: _formkey,
          child: Column(children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.1, right: width * 0.1, top: height * 0.02),
                child: TextFormField(
                    controller: authcontroller.emailControllerforget.value,
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
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                    //   hintStyle: TextStyle(color: Colors.black),
                    hintText: "Enter your E-mail",
                    labelText: "E-mail",
                    suffixIcon: TextButton(
                      style: TextButton.styleFrom(primary: Color(0xff3040A5)),
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        sendOtp();
                        setState(() {
                          validate = false;
                        });
                      },
                    ),
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
                  onSaved: (String? name) {
                    _email = name!;
                  },
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                child: TextFormField(
                  controller: _otpcon,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //border: UnderlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter OTP",
                    labelText: "OTP",
                    suffixIcon: TextButton(
                      style: TextButton.styleFrom(primary: Color(0xff3040A5)),
                      child: Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        verifyOtp();
                        setState(() {
                        validate = true;
                        });
                      },
                    ),

                    labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                    //  hintStyle: TextStyle(color: Colors.black)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "OTP cannot be empty";
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
              height: height*0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left:width* 0.20, right:width* 0.20),
              child: Material(
                color: Color(0xff3040A5),
                borderRadius: BorderRadius.circular(40),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
  sendOtp() async{
    Map<String, String> data = {
      "email": authcontroller.emailControllerforget.value.text,
    };
    print("/*-------------$data");
    await networkHandler.post("/user/sendotp", data);
    Fluttertoast.showToast(
        msg: "otp sent",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        fontSize: 15);
  }
  verifyOtp()async{
    Map<String, String> data = {
      "email":authcontroller.emailControllerforget.value.text,
      "otp":   _otpcon.text
    };
    print("/*-------------$data");
    var res = await networkHandler.post("/user/verifyotp", data);
    print(res);

    // print(res);
    // var output = jsonDecode(res.body);
    // print(output);


    if (res !=null&&res["msg"].toString() == "success") {
      print("done");
      Fluttertoast.showToast(
          msg: "otp verified move to further process",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          fontSize: 15);
    }
    else
    {
      print("not done");
      Fluttertoast.showToast(
          msg: "otp expire or not correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          fontSize: 15);
    }
  }
  checkUser() async {
    if (authcontroller.emailControllerforget.value.text.length == 0) {
      setState(() {

        validate = false;

      });
    } else {
      //
      var response = await http.get(Uri.parse(
          "https://pleasant-trunks-bear.cyclic.app/user/checkmail/${authcontroller.emailControllerforget.value.text}"));
      // if(response.statusCode == 200 || response.statusCode == 201){
      var data = jsonDecode(response.body);
      print("=============================${data}");
      // _emailController.clear();
      if (data["status"] == true) {
        setState(() {
          validate = false;
        });
        print("============================= USER EXISTS");
        Fluttertoast.showToast(
            msg: "user Found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            fontSize: 15);
      } else {
        print("============================= USER NOT EXISTS");
        Fluttertoast.showToast(
            msg: "user not found" ,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            fontSize: 15);
        setState(() {
          validate = true;
        });
      }
      // }
    }
  }
}
