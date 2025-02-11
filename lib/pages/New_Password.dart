import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/comtroller/auth/auth_controller.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';

import 'package:test_logo/pages/Login_Industry.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Forget_Password.dart';

class New_Password extends StatefulWidget {
  const New_Password({Key? key}) : super(key: key);

  @override
  State<New_Password> createState() => _New_PasswordState();
}

class _New_PasswordState extends State<New_Password> {
  final authcontroller = Get.put(AuthController());
  // TextEditingController password = new TextEditingController();
  TextEditingController newpassword = new TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();


  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate() ) {

      if (_formkey.currentState!.validate())
      {
        Map<String, String> data = {

          "email": authcontroller.emailControllerforget.value.text,
          "password": newpassword.text
        };
        await networkHandler.post("/user/forgetpassword", data);
        // var output = jsonDecode(response);
        // print(output);
        Fluttertoast.showToast(
            msg: "password updated succesfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            fontSize: 15);

      }

      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login_Industry()));
    }}
  bool validate = false;
  bool ishidden = true;
  String name = "";
  TextEditingController _password = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  TextEditingController _otpcon = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3040A5),
          title: Text(
            "New Password",
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
                          builder: (context) => Forgot_Password()));
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
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1,top: height*0.02),
                  child: TextFormField(
                      controller: newpassword,
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
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
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
                height: height * 0.02,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                  child: TextFormField(
                    controller: _confirm,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9D9D9),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Enter Confirm Password",
                      labelText: "Confirm",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      //  hintStyle: TextStyle(color: Colors.black)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please re-type your password";
                      } else if (newpassword.text != _confirm.text) {
                        return "Not matched re-type password";
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
                        "Reset",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],

          ),
        ));
  }
}
