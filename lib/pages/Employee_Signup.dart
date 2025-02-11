import 'dart:convert';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_logo/pages/Create_Profile_Employee.dart';
import 'package:test_logo/pages/Handler/NetworkHandlerForEmpSignup.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:http/http.dart' as http;
import 'package:test_logo/pages/Test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class Employee_Signup extends StatefulWidget {
  const Employee_Signup({Key? key}) : super(key: key);

  @override

  State<Employee_Signup> createState() => _Employee_SignupState();
}

class _Employee_SignupState extends State<Employee_Signup> {
  NetworkHandlerForEmpSignup networkHandlerForEmpSignup =
      NetworkHandlerForEmpSignup();
  final _otplessFlutterPlugin = Otpless();
  @override


  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.01, left: width * 0.10),
                child: Image.asset("assets/images/page4.1.jpg",
                    fit: BoxFit.cover,
                    height: height * 0.3,
                    width: width * 0.8),
              ),

              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Text(
                  "Create an account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: width * 0.1, top: 6),
                child: Text(
                  "For getting job only",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.08,
                width: width * 0.8,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.1),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.phone,
                        size: 30, color: Colors.black),
                    // onPressed: () {Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Create_Profile_Employee()),
                    // );},

                    onPressed: ()  async{

                    await   Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Test()),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      primary:  Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                    label: Padding(
                      padding: EdgeInsets.only(left: width * 0.0),
                      child: Text(
                        "Sign-Up With Phone-No",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
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
                              builder: (context) => CreateProfileEmployee()));

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
                      primary: const Color(0xff25D366),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                    label: Padding(
                      padding: EdgeInsets.only(left: width * 0.001),
                      child: Text(
                        "Sign Up With Whatsapp",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.15,
              ),

              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Text(
                  " By continuing you agree Gemstone’s",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: InkWell(
                  onTap: () {},
                  child: Text(" Terms of Service,Primary Policy.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),
              // Container(
              //
              // )
            ],
          ),
        ));
  }
}
