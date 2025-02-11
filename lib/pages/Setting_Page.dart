import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Industry.dart';
import 'package:test_logo/pages/Home_Industry2.dart';

class Setting_Page extends StatefulWidget {
  const Setting_Page({Key? key}) : super(key: key);

  @override
  State<Setting_Page> createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(
          color: Colors.black

        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.001),
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder:(context)=> Home_Industry2()
            )
            );
          },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,

              ),
              child: const Icon(Icons.arrow_back,color: Colors.black,size: 40)),
        ),
      ),
    );
  }
}
