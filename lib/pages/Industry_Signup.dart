import 'package:flutter/material.dart';
import 'package:test_logo/pages/Create_Profile_Industry.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../comtroller/auth/auth_controller.dart';


class Industry_Signup extends StatefulWidget {
  const Industry_Signup({Key? key}) : super(key: key);
  @override

  State<Industry_Signup> createState() => _Industry_Signupstate();
}

class _Industry_Signupstate extends State<Industry_Signup> {
  NetworkHandler networkHandler = NetworkHandler();
  final authcontroller = Get.put(AuthController());
  String name = "";
  bool showvalue = false;
  bool changebutton = false;
  bool ishidden = true;
  String _email = "";
  bool isLoading = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _confirm = TextEditingController();
  TextEditingController _otpcon = TextEditingController();
  String errorText = "";
  bool validate = false;
  bool circular = false;
bool isEmailVerified  = false;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double pass_strength = 0;
//    void sendOtp() async{
//      EmailAuth.sessionName = "";
//       var res = await EmailAuth.sendOtp(receiver)
// }

  moveToHome(BuildContext context) async {
    await checkUser();
    // await sendOtp();
    if (_formkey.currentState!.validate() && validate == true) {
      Map<String, String> data = {
        "username": _usernameController.text,
        "email": authcontroller.emailControllerlogin.value.text,
        "password": _password.text,
      };
      print("/*-------------$data");
      await networkHandler.post("/user/register", data);
      if (showvalue == true) {
        await Future.delayed(Duration(seconds: 1));
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Create_Profile_Industry(),
            ));
        setState(() {
          changebutton = false;
        });
      } else {
        setState(() {
          circular = false;
        });
      }
    }
  }

  // void sendOtp()async{
  //    EmailAuth.sessionName = "Test Session";
  //    var res = await EmailAuth.sendOtp(recipientMail: _emailControllerlogin.text );
  //    if(res){}
  // }
  //
  // void verifyOtp()async{
  //   var res = EmailAuth.validate(receiverMail: _emailControllerlogin.text,userOtp: _otpcon.text);
  // }

  final _formkey = GlobalKey<FormState>();
  // bool validatePassword(String Pass)
  // {
  //
  // }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: height*0.02),
                  child: Container(
                    child: Image.asset("assets/images/page3.jpg",
                        fit: BoxFit.cover,
                        height: height * 0.25,
                        width: width * 0.7),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.030,
                        left: width * 0.0100,
                        right: width * 0.01),
                    child: const Text(
                      "Create an account",
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
                  padding: EdgeInsets.only(
                      left: width * 0.210, right: width * 0.250),
                  child: Text(
                    "For Hiring Only",
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
                    padding:
                        EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                    child: TextFormField(

                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffD9D9D9),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.people),
                        hintText: "Enter your name",
                        labelText: "Username",
                        suffixIconColor: Color(0xff3040A5),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        //hintStyle: TextStyle(fontSize: 30)
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
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

                      controller: authcontroller.emailControllerlogin.value,
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
                        suffixIcon: TextButton(

                          style: TextButton.styleFrom(

                            primary: Color(0xff3040A5)
                          ),
                          child: Text("Send OTP",
                            style: TextStyle(fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),

                          onPressed: (){
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
                  height: height * 0.01,
                ),

                Container(
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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

                          style: TextButton.styleFrom(

                              primary: Color(0xff3040A5)
                          ),
                          child: Text("Verify OTP",
                            style: TextStyle(fontSize: 16,
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


                        labelStyle:
                        TextStyle(color: Colors.black, fontSize: 18),
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
                  height: height * 0.01,
                ),
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
                  height: height * 0.01,
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.1, right: width * 0.1),
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
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        //  hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please re-type your password";
                        } else if (_password.text != _confirm.text) {
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
                  height: height * 0.01,
                ),
                // ElevatedButton(onPressed: (){}, child: Text("login"))
                // SizedBox(
                //   height: 30,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.09),
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text("I have read all Terms and Conditions",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      value: this.showvalue,
                      onChanged: (bool? value) {
                        setState(() {
                          this.showvalue = value!;
                        });
                        // InkWell(
                        //     onTap: () =>
                        //         Navigator.pushReplacement(context, MaterialPageRoute(
                        //             builder: (BuildContext) => page1())),
                        //launch("https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget"),

                        // CheckboxListTile(
                        //   title: Text("I have read all Terms and Condition",
                        //      style: TextStyle(fontWeight: FontWeight.bold)),
                        // );

                        // );
                      }),
                ),
                // InkWell(
                //     onTap: () =>
                //         Navigator.pushReplacement(context, MaterialPageRoute(
                //             builder: (BuildContext) => page1())),
                //     //launch("https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget"),
                //
                //     child: Text("I have read all Terms and Condition",
                //         style: TextStyle(fontWeight: FontWeight.bold))
                //
                //
                // ),
                SizedBox(
                  height: height*0.01,
                ),
                Material(
                  color: Color(0xff3040A5),
                  borderRadius:
                      BorderRadius.circular(changebutton && showvalue ? 50 : 8),
                  child: InkWell(
                    // onTap: () {
                    //   print("sagar");
                    // },
                    onTap: () async => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changebutton && showvalue ? 50 : 150,
                      alignment: Alignment.center,

                      child: changebutton && showvalue
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
                      // decoration: BoxDecoration(
                        color: Color(0xff30405),
                        //shape: changebutton?BoxShape.circle:BoxShape.rectangle,

                      ),
                    ),
                  ),

                SizedBox(
                  height: height*0.020,
                ),
                // RichText(text: TextSpan(
                //   children: [
                //     TextSpan(
                //         text: "learn more"
                //     ),
                //     TextSpan(
                //       text: "click",
                //       recognizer:TapGestureRecognizer()..onTap = () async {
                //         var URL = "https://pub.dev/packages/url_launcher";
                //         if(await  canLaunchUrl(URL))
                //           {
                //             await launchUrl(URL);
                //           }
                //         else
                //           {
                //             throw "can not ";
                //           }
                //       }
                //     )
                //   ]
                // ))
                // Link(uri : Uri.parse("https://www.youtube.com/watch?v=ujlqRTJg48g"),
                //     builder : (contex,followlink)
                //     {
                //       return ElevatedButton(onPressed: followlink, child: Text("goto link"));
                //     }
                //
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendOtp() async{
    Map<String, String> data = {
      "email": authcontroller.emailControllerlogin.value.text,
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
      "email":authcontroller.emailControllerlogin.value.text,
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
    if (authcontroller.emailControllerlogin.value.text.length == 0) {
      setState(() {
        circular = false;
        validate = false;
        errorText = "E-mail cann't be empty";
      });
    } else {
      //
      var response = await http.get(Uri.parse(
          "https://pleasant-trunks-bear.cyclic.app/user/checkmail/${authcontroller.emailControllerlogin.value.text}"));
      // if(response.statusCode == 200 || response.statusCode == 201){
      var data = jsonDecode(response.body);
      print("=============================${data}");
      // _emailControllerlogin.clear();
      if (data["status"] == true) {
        setState(() {
          validate = false;
        });
        print("============================= USER EXISTS");
        Fluttertoast.showToast(
            msg: "User is already exists  ${authcontroller.emailControllerlogin.value.text} with email go to login ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            fontSize: 15);
      } else {
        print("============================= USER NOT EXISTS");
        Fluttertoast.showToast(
            msg: "successfully registered with email ${authcontroller.emailControllerlogin.value.text} ",
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
// Container(
//   child: Padding(
//     padding: const EdgeInsets.only(left: 50.0, right: 50),
//     child: TextFormField(
//       maxLength: 10,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xffD9D9D9),
//         border: OutlineInputBorder(),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         //border: InputBorder.none,
//
//         prefixIcon: Icon(Icons.contact_mail),
//         hintText: "Enter Contact No",
//         labelText: "Contact No",
//         labelStyle: TextStyle(color: Colors.black,
//             fontSize: 18),
//         // hintStyle: TextStyle(color: Colors.black)
//       ),
//       validator: (value) {
//         if (value!.isEmpty)
//         {
//           return "Contact No cannot be empty";
//         }
//         else if (value.length < 10 )
//         {
//           return "Please enter valid contact number";
//         }
//         return null;
//       },
//       onChanged: (value) {
//         name = value;
//         setState(() {});
//       },
//     ),
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
