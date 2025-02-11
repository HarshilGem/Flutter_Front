import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../comtroller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:test_logo/pages/TestVerify.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'Create_Profile_Employee.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
static String verify = "";
static String mo = "";
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  TextEditingController countryController = TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();
  String name = "";
  bool showvalue = false;
  bool changebutton = false;
  bool ishidden = true;
  String _email = "";
  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();
  var code= "";
  // TextEditingController _password = TextEditingController();

  TextEditingController _mobile = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _confirm = TextEditingController();
  // TextEditingController _otpcon = TextEditingController();


  String errorText = "";
  bool validate = false;
  bool circular = false;
  var phone="";
  final authcontroller = Get.put(AuthController());
  @override
  void initState(){

    countryController.text = "+91";
    super.initState();
  }
  Widget build(BuildContext context) {
    moveToHome(BuildContext context) async {
      await checkUser();
      if (_formkey.currentState!.validate() && validate == true) {
        Map<String, String> data = {
          "mobile":authcontroller.employephonenumber.value.text,
        };
        print("/*-------------$data");
        await networkHandler.post("/emp/regist", data);
        if (showvalue == true) {
          await Future.delayed(Duration(seconds: 1));
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateProfileEmployee(),
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: width*0.07, right: width*0.07),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ll.jpg',
                width: width*0.9,
                height: height*0.2,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height*0.04,
              ),
              Form(
                key: _formkey,
                child: Container(
                  height: height*0.08,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width*0.06,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(

                          child: TextField(
                            controller: authcontroller.employephonenumber.value,
                            onChanged: (value){
                              phone=value;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone",

                            ),

                          )

                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height*0.04,
              ),
              SizedBox(
                width: double.infinity,
                height: height*0.06,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:  Color(0xFF3040a5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      int resendToken=0;
                      await moveToHome(context);
                      if(validate==true)
                        {

                           FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '${countryController.text + phone}',
                            verificationCompleted: (PhoneAuthCredential credential) async {
                             await FirebaseAuth.instance
                             . signInWithCredential(credential).then(( result){

                              }).catchError((e){
                                print(e);
                              });
                            },
                             timeout: Duration(seconds: 25),
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) {
                              print("Verification ID============${verificationId}");

                              Test.verify= verificationId;
                              resendToken=resendToken;
                              print("After Verification ig=======${Test.verify}");
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>TestVerify()));
                            },
                             forceResendingToken: resendToken,
                            codeAutoRetrievalTimeout: (String verificationId) {},
                          );
                        }


                      // Navigator.pushNamed(context, 'verify');
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
  checkUser() async {
    if (authcontroller.employephonenumber.value.text.length == 0) {
      setState() {
        circular = false;
        validate = false;
        errorText = "contact cann't be empty";
      };
    } else {
      //
      var response = await http.get(Uri.parse(
          "https://pleasant-trunks-bear.cyclic.app/emp/checkmobile/${authcontroller.employephonenumber.value.text}"));
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
            msg: "User is already exists  ${authcontroller.employephonenumber.value.text} with mobile ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black,
            fontSize: 15);
      } else {
        print("============================= USER NOT EXISTS");
        // Fluttertoast.showToast(
        //     msg:
        //     "successfully registered  ${_mobile.text} with mobile ",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 2,
        //     backgroundColor: Colors.black,
        //     fontSize: 15);
        setState(() {
          validate = true;
        });
      }
      // }
    }
  }
  }

