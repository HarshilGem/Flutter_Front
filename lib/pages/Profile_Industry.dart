import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/Industry_Post_Collection.dart';
import '../comtroller/auth/auth_controller.dart';
import 'Handler/NetworkHandler.dart';
import 'package:test_logo/pages/Edit_Profile_Industry.dart';
class Profile_Industry extends StatefulWidget {
  const   Profile_Industry({Key? key}) : super(key: key);

  @override
  State<Profile_Industry> createState() => _Profile_IndustryState();
}
final authcontroller = Get.put(AuthController());
NetworkHandler networkHandler = NetworkHandler();
String  contact = "";
String about = "";
String address = "";
String  post = "";
String email = "";
String companytime = "";
String companyfrom = "";
String companyto = "";
String name = "";

class _Profile_IndustryState extends State<Profile_Industry> {
  void initState() {
    //     () async {
    //   await moveToHome();
    // }();
   Future.delayed(Duration(seconds: 1),(){moveToHome();});

    super.initState();
  }
  var res = "";
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
                          decoration:  BoxDecoration(
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
                                builder: (context) => Edit_Profile_Industry(),
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
                        fontSize: 30,
                        fontWeight: FontWeight.bold,


                    ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left:  width*0.08, right:  width*0.08),
                      child: TextFormField(
                        controller: TextEditingController(text: email),
                        readOnly: true,
                        decoration: InputDecoration(

                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.email),

                          labelText: "E-Mail",


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
                        controller: TextEditingController(text: contact),
                        readOnly: true,
                        decoration: InputDecoration(

                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.add_call),

                          labelText: "Contact",


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
                      padding:  EdgeInsets.only(left:  width*0.08, right:  width*0.08),
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


                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndustryPostCollection(),
                          ));
                    },
                    child: Container(
                      child: Padding(
                        padding:  EdgeInsets.only(left:  width*0.08, right: width*0.08),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home_Industry2(),
                                ));
                          },
                          child: TextFormField(
                            // controller: TextEditingController(text: address.capitalize),
                            readOnly: true,
                            decoration: InputDecoration(

                              //border: UnderlineInputBorder(),
                              //border: InputBorder.none,

                                prefixIcon: Icon(Icons.post_add),

                                hintText: "Posts",
                                hintStyle: TextStyle(fontSize: 20.0, color: Colors.black,)


                              // hintStyle: TextStyle(color: Colors.black)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.08, right:  width*0.08),
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
                  SizedBox(
                    height: height*0.02,
                  ),
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left:  width*0.08, right:  width*0.08),
                      child: TextFormField(
                        controller: TextEditingController(text: companytime.toString().replaceAll("TimeOfDay(", "").replaceAll(")", "")),
                        readOnly: true,
                          // skills.toString().replaceAll("[","").replaceAll("]", " "))
                        decoration: InputDecoration(

                          //border: UnderlineInputBorder(),
                          //border: InputBorder.none,

                          prefixIcon: Icon(Icons.timer),

                          labelText: "CompanyTime",


                          // hintStyle: TextStyle(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                ],

              ),
            )

        )
    );
  }
  moveToHome() async{
    print("start");
    // var response =  await networkHandler.get("/user/profilegetind/jetani@gmail.com");
    // // if(response.statusCode == 200 || response.statusCode == 201){
    // var data = jsonDecode(response.body);
    // print("=============================${data}");
    // print("end");
    var response = await http.get(Uri.parse(
        "https://74b1-2402-3a80-1b97-fff-c582-1ee5-60a3-7b17.ngrok-free.app/user/profilegetind/${authcontroller.emailControllerlogin.value.text}"));
    var re = jsonDecode(response.body);
    print(re);
    print(re["result"]["contact"]);
    contact= re["result"]["contact"].toString();
    about= re["result"]["desc"];
    print(about);
    print("----------------------------------------------------");
    name= re["result"]["name"];
    email= re["result"]["email"];
    address= re["result"]["address"];
    companyfrom= re["result"]["timefrom"].toString();
    companyto= re["result"]["timeto"].toString();
    // print(companytime);
    companytime = companyfrom +" AM"+  "           "     +  companyto+" PM" ;
    print(companytime);
    setState((){});

  }
}
