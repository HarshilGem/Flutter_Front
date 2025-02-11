import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_logo/pages/Edit_Profile_Employee.dart';
import 'dart:async';

import '../comtroller/auth/auth_controller.dart';
import 'Handler/NetworkHandler.dart';

class Profile_Employee extends StatefulWidget {
  const Profile_Employee({Key? key}) : super(key: key);

  @override
  State<Profile_Employee> createState() => _Profile_EmployeeState();
}
final authcontroller = Get.put(AuthController());
NetworkHandler networkHandler = NetworkHandler();
var arr = [];
String  contact = "";
String  contact2 = "";
String about = "";
String address = "";
String  currentplace = "";
String email = "";
List skills = [];
String name = "";

class _Profile_EmployeeState extends State<Profile_Employee> {

  void initState() {
    //     () async {
    //   await moveToHome();
    // }();

    Future.delayed(Duration(seconds: 1),(){moveToHome();});
    // moveToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Scaffold(

        body: SafeArea(
        child:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  //height: MediaQuery.of(context).size.width / 2 + 145,
                  child: Stack(
                    children: [
                      Container(
                        height: 170,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xff3040A5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: width*0.75,top: height*0.02),
                        child: SizedBox(
                          height: height*0.05,
                          width: width*0.19,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Edit_Profile_Employee(),
                            ));
                          },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                              child:Icon(Icons.mode_edit_sharp,color: Color(0xff3040A5),)),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.099),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff2030A5),
                              radius: 80.0,
                              child: ClipRRect(
                                child: Image.asset('assets/images/Profile.png',height: height*0.7,),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height*0.04,bottom: height*0.02),
                  child: Text(name.toUpperCase(),style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),


                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right: width*0.08),
                    child: TextFormField(

                      controller: TextEditingController(text:email),

                      // obscureText: true,
                  readOnly: true,
                      autofocus: true,
                      decoration: InputDecoration(


                        fillColor: Color(0xffD9D9D9),


                        //border: UnderlineInputBorder(),

                        prefixIcon: Icon(Icons.email),


                        //   hintStyle: TextStyle(color: Colors.black),

                        labelText: "Email",

                      ),

                      // onSaved: (String? name) {
                      //   _email = name!;
                      // },
                    ),
                  ),
                ),
                 SizedBox(
                  height: height*0.02,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right: width*0.08),
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: contact.capitalize),

                      decoration: InputDecoration(




                        //border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.add_call),

                        labelText: "Contact"


                        // hintStyle: TextStyle(color: Colors.black)
                      ),


                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right: width*0.08),
                    child: TextFormField(
                    readOnly: true,
                      controller: TextEditingController(text: contact2.capitalize),

                      decoration: InputDecoration(



                        //border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.add_call),


                          labelText: "Contact2"

                        // hintStyle: TextStyle(color: Colors.black)
                      ),


                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right: width*0.08),
                    child: TextFormField(
                      controller: TextEditingController(text: address.capitalize),
                   readOnly: true,
                      decoration: InputDecoration(

                        //border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.location_pin),

                        labelText: "Address",


                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right: width*0.08),
                    child: TextFormField(
                      controller: TextEditingController(text: skills.toString().replaceAll("[","").replaceAll("]", " ")),
                      readOnly: true,
                      decoration: InputDecoration(

                        //border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.workspaces_sharp),

                        labelText: "Skills",


                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right:width*0.08),
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: currentplace.capitalize),
                      decoration: InputDecoration(

                        //border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.location_pin),

                        labelText: "Currentplace",


                        // hintStyle: TextStyle(color: Colors.black)
                      ),

                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),


                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.08, right: width*0.08),
                    child: TextFormField(
                      controller: TextEditingController(text: about.capitalize),
                     readOnly: true,
                      decoration: InputDecoration(

                        //border: UnderlineInputBorder(),
                        //border: InputBorder.none,

                        prefixIcon: Icon(Icons.info_outline_rounded),

                        labelText: "About",


                        // hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                ),
              ],

            ),
          ),
        )

    );

  }moveToHome() async{
    print("start");
    // var response =  await networkHandler.get("/user/profilegetind/jetani@gmail.com");
    // // if(response.statusCode == 200 || response.statusCode == 201){
    // var data = jsonDecode(response.body);
    // print("=============================${data}");
    // print("end");
    var response = await http.get(Uri.parse("https://74b1-2402-3a80-1b97-fff-c582-1ee5-60a3-7b17.ngrok-free.app/emp/profilegetemp/${authcontroller.employephonenumber.value.text}"));
    var re = jsonDecode(response.body);
    print(re);
    print(re);
    print(re["result"]["contact"]);
    contact= re["result"]["contact"].toString();
    skills= re["result"]["skills"];
    contact2= re["result"]["contact2"].toString();
    about= re["result"]["desc"];
    name= re["result"]["name"];
    email= re["result"]["email"];
    address= re["result"]["address"];
    currentplace = re["result"]["currentplace"];

    //
    //
    // String  contact = "";
    // String  contact2 = "";
    // String about = "";
    // String address = "";
    // String  post = "";
    // String email = "";
    // List skills = [];
    // String name = "";

    // about= re["result"]["desc"];
    // print(about);
    // name= re["result"]["name"];
    // email= re["result"]["email"];
    // address= re["result"]["address"];
    // companyfrom= re["result"]["timefrom"].toString();
    // companyto= re["result"]["timeto"].toString();
    // // print(companytime);
    // companytime = companyfrom +"   to   "+ companyto;
    // print(companytime);

    setState((){});
  }

}
