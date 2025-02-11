
import 'dart:async';



// import 'dart:html';
import 'dart:convert';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_logo/pages/Create_Profile_Employee.dart';
import 'package:test_logo/pages/Test.dart';

class TestVerify extends StatefulWidget {
  const TestVerify({Key? key}) : super(key: key);

  @override
  State<TestVerify> createState() => _TestVerifyState();
}

class _TestVerifyState extends State<TestVerify> {
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  TextEditingController _mobile = new TextEditingController();
  TextEditingController otp = new TextEditingController(text: "123456");
int start = 25;
  NetworkHandler networkHandler = NetworkHandler();
  bool circular = false;
  bool validate = false;
  String errorText = "";
  bool showvalue = false;
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  // void startTimer()
  // {
  //   const onsec = Duration(seconds: 1);
  //   Timer _timer = Timer.periodic(onsec, (timer) {
  //   if(start==0)
  //     {
  //       setState((){
  //         timer.cancel();
  //       });
  //     }
  //   else
  //     {
  //       setState((){
  //         start;
  //       });
  //     }
  // });
  //
  // }

  moveToHome(BuildContext context) async {
    await checkUser();
    if (_formkey.currentState!.validate() && validate == true) {
      Map<String, String> data = {
        "mobile": "9925975431",
      };
      print("/*-------userregistered------$data");
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


  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = "";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/test.jpg',
                width: width * 0.9,
                height: height * 0.2,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Form(
                key: _formkey,
                child: Pinput(
                  length: 6,
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
                  controller: _mobile,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                  // onTap: () async => moveToHome(context),
                  onCompleted: (pin) => print(pin),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text("Otp expires in",style: TextStyle(
                fontSize: 15,
              ),),
              Text(" 00:${start}",style: TextStyle(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: height * 0.025,
              ),
              SizedBox(
                // 00:${start}
                width: double.infinity,
                height: height * 0.08,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF3040a5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      await moveToHome(context);
                      if (validate == true) {
                        print("=======12345========> ${Test.verify}=======");
                        print("trfgf${_mobile.text}");
                        try {
                          print("=======333========");
                          var credential =
                              PhoneAuthProvider.credential(
                                  verificationId: Test.verify.toString(), smsCode: _mobile.text);
                          // Sign the user in (or link) with the credential
                          // await auth.signInWithCredential(credential).then(
                          //     (result) => print("$result=================="));
                          UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
                          print("User Credential================$userCredential");
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>CreateProfileEmployee()));
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: "Invalid Otp Please Enter Valid Otp",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.black,
                              fontSize: 15);
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>Create_Profile_Employee()));
                          print('Error ?????????????$e');
                        }
                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  checkUser() async {
    // if (_mobile.text.length == 0) {
    //   setState() {
    //     circular = false;
    //     validate = false;
    //     errorText = "contact cann't be empty";
    //   };
    // } else {
    setState(() {
      validate = true;
    });
    //
    // var response = await http.get(Uri.parse(
    //     "https://test-app-3362.herokuapp.com/emp/checkmobile/${_mobile.text}"));
    // // if(response.statusCode == 200 || response.statusCode == 201){
    // var data = jsonDecode(response.body);
    // print("=============================${data}");
    // // _emailController.clear();
    // if (data["status"] == true) {
    //   setState(() {
    //     validate = false;
    //   });
    //   print("============================= USER EXISTS");
    //   Fluttertoast.showToast(
    //       msg: "User is already exists 8159824178 with mobile ",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: Colors.black,
    //       fontSize: 15);
    // } else {
    //   print("============================= USER NOT EXISTS");
    //   Fluttertoast.showToast(
    //       msg:
    //       "successfully registered  8153824178 with mobile ",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: Colors.black,
    //       fontSize: 15);
    //   setState(() {
    //     validate = true;
    //   });
    // }
    // }
  }
}
