import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:test_logo/pages/Login_Industry.dart';

class Login_Employee extends StatefulWidget {
  const Login_Employee({Key? key}) : super(key: key);

  @override
  State<Login_Employee> createState() => _Login_EmployeeState();
}

class _Login_EmployeeState extends State<Login_Employee> {
  bool onChange = false;
  bool changebutton = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff3040A5),),
          backgroundColor:Colors.white,
          body:SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:height*0.05),
                  child: Center(child: Image.asset("assets/images/page5.1.png", height:height*0.15,width: width*0.7)),
                ),
                // SizedBox(
                //   height: 30,
                //   width: 20,
                // ),
                SizedBox(
                  height: height*0,
                ),

                Padding(
                  padding:  EdgeInsets.only(right: width*0.09),
                  child: SizedBox(
                      height: height*0.08,
                      width: width*0.08,
                      child: Padding(
                        padding:  EdgeInsets.only(left: width*0.1),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.telegram,size: 30,color:Colors.black),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>Home_Employee2()
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff25D366),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          ),
                          label:  Padding(
                            padding: EdgeInsets.only(left: width*0.01),
                            child:  Text("Login With Whatsapp",style: TextStyle(
                              color: Colors.black,
                              fontSize:17.6,
                            ),
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
// Divider(
//   color: Colors.black,
//   indent: 3,
//   endIndent: 3,
//   thickness: 2,
// ),