import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_logo/pages/Hire_Or_Job.dart';
class OnLoad extends StatefulWidget {
  const OnLoad({Key? key}) : super(key: key);
  @override
  State<OnLoad> createState() => _OnLoadstate();
}
class _OnLoadstate extends State<OnLoad> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>Hire_Or_Job()))
    );
  }
  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF3040a5),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*0.01),
            child: Image.asset(
              "assets/images/logofinal.png",
              fit: BoxFit.cover,
              height: height*0.8,
              width: 600,
            ),
          ),

          SizedBox(
            height: height*0.1,
          ),

          Text("GEMSTONE",style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          ),
        ],
      ),
    );
  }
}
