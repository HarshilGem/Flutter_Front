import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:test_logo/pages/Login_Employee2.dart';
import 'package:test_logo/pages/Login_Industry.dart';
import 'package:test_logo/pages/Login_Employee.dart';

class Login_Option extends StatefulWidget {
  const Login_Option({Key? key}) : super(key: key);

  @override
  State<Login_Option> createState() => _Login_OptionState();
}

class _Login_OptionState extends State<Login_Option> {
  int? onChange;
  String name = "";
  bool showvalue = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool changebutton = false;
  bool ishidden = true;
  String _email = "";
  bool emp = false;
  bool ind = false;

  // TextEditingController _password = TextEditingController();
  TextEditingController _confirm = TextEditingController();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double pass_strength = 0;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login_Industry(),
          ));
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Image.asset("assets/images/page5.1.png",
                      height: height * 0.15, width: width * 0.7),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.03
                          , top: height * 0.01),
                  child: Container(
                    //padding: MediaQuery.of(context).padding,
                    child: ButtonBar(
                      children: [
                        SizedBox(
                          height: height * 0.065,
                          width: width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Future.delayed(Duration(seconds: 1));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login_Employee2(),
                                  ));
                              setState(() {
                                emp = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff3040A5),
                            ),
                            child: Text(
                              "Employee",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),

                        // Divider(
                        //   color: Colors.black,
                        //   indent: 3,
                        //   endIndent: 3,
                        //   thickness: 2,
                        // ),
                        SizedBox(
                            height: height * 0.065,
                            width: width * 0.45,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Future.delayed(Duration(seconds: 1));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login_Industry(),
                                      ));
                                  setState(() {
                                    emp = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff3040A5),
                                ),
                                child: Text(
                                  "Industry",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
