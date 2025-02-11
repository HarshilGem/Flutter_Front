import 'package:flutter/material.dart';
import 'package:test_logo/pages/Employee_Signup.dart';
import 'package:test_logo/pages/Industry_Signup.dart';
import 'Login_Option.dart';
class Hire_Or_Job extends StatefulWidget {
  const Hire_Or_Job({Key? key}) : super(key: key);
  @override
  State<Hire_Or_Job> createState() => _Hire_Or_Jobstate();
}
class _Hire_Or_Jobstate extends State<Hire_Or_Job>{
String msg = "";


  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top:height*0.15, left: width*0.045),
              child: Image.asset(
                "assets/images/Page2.jpg",
                fit: BoxFit.cover,
                // height: 200,
                // width: 250,
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(right: width*0.05, top: height*0.1),
              child: Container(
                child: ButtonBar(
                  children: [
                    SizedBox(
                        height: height*0.065,
                        width: width*0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Industry_Signup()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3040A5),
                          ),
                          child: Text("Hire Now"),
                        )
                    ),

                    SizedBox(
                        height: height*0.065,
                        width: width*0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Employee_Signup()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3040A5),
                          ),
                          child: Text("Get a Job"),
                        )
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40.0,right:10),
              child: SizedBox(
                  height:  height*0.065,
                  width: width*0.65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login_Option()),
                      );
                        },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff3040A5),
                      ),
                      child: Text("Already have an account"),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}
