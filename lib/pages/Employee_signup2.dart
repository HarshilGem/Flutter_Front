import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_logo/pages/Create_Profile_Employee.dart';
import 'package:test_logo/pages/Create_Profile_Industry.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_auth/email_auth.dart';
import 'package:test_logo/pages/Profile_Employee.dart';

class Employee_signup2 extends StatefulWidget {
  const Employee_signup2({Key? key}) : super(key: key);
  @override
  State<Employee_signup2> createState() => _Employee_signup2state();
}

class _Employee_signup2state extends State<Employee_signup2> {
  NetworkHandler networkHandler = NetworkHandler();
  String name = "";
  bool showvalue = false;
  bool changebutton = false;
  bool ishidden = true;
  String _email = "";
  bool isLoading = false;
  // TextEditingController _password = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _confirm = TextEditingController();
  // TextEditingController _otpcon = TextEditingController();


  String errorText = "";
  bool validate = false;
  bool circular = false;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double pass_strength = 0;
  moveToHome(BuildContext context) async {
    await checkUser();
    if (_formkey.currentState!.validate() && validate == true) {
      Map<String, String> data = {
        "mobile":authcontroller.employephonenumber.value.text,
        "name":_usernameController.text
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

  // void sendOtp()async{
  //    EmailAuth.sessionName = "Test Session";
  //    var res = await EmailAuth.sendOtp(recipientMail: _emailController.text );
  //    if(res){}
  // }
  //
  // void verifyOtp()async{
  //   var res = EmailAuth.validate(receiverMail: _emailController.text,userOtp: _otpcon.text);
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
      // backgroundColor: Colors.lightGreen,
// appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: width * 0),
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
                    "For Getting Job Only",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01 * 4,
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
                  height: height * 0.02,
                ),
                Container(
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
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
                        hintText: "Enter your contact no.",
                        labelText: "Contact no.",
                        labelStyle:
                        TextStyle(color: Colors.black, fontSize: 18),
                        //hintStyle: TextStyle(fontSize: 30)
                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                        {
                          return "Contact No cannot be empty";
                        }
                        else if (value.length < 10 )
                        {
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
                SizedBox(
                  height: height * 0.02,
                ),
                Material(
                  color: Color(0xff3040A5),
                  borderRadius:
                      BorderRadius.circular(changebutton && showvalue ? 50 : 8),
                  child: InkWell(
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
                  height: height * 0.01,
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
        Fluttertoast.showToast(
            msg:
                "successfully registered  ${authcontroller.employephonenumber.value.text} with mobile ",
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
