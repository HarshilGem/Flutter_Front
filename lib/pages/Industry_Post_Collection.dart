import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/List_Class.dart';
import 'package:test_logo/pages/Profile_Industry.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../comtroller/auth/auth_controller.dart';
import 'Drawer_Employee.dart';
import 'package:http/http.dart' as http;

class IndustryPostCollection extends StatefulWidget {
  const IndustryPostCollection({Key? key}) : super(key: key);

  @override
  State<IndustryPostCollection> createState() => _IndustryPostCollection();
}

class _IndustryPostCollection extends State<IndustryPostCollection> {
  // List<List_Class>? data;
  final authcontroller = Get.put(AuthController());
  String? name = "";
  String address = "";
  String contact = "";
  String reqworker = "";
  String noworker = "";
  String desc = "";
  String jobtype = "";
  String salary = "";
  String timefrom = "";
  String timeto = "";
  String companytime = "";
  String email = "";
  NetworkHandler networkHandler = NetworkHandler();

  circular() {
    CircularProgressIndicator(
      backgroundColor: Colors.black,
    );
  }

  void initState() {
    //     () async {
    //   await moveToHome();
    // }();
    circular();

    Future.delayed(Duration(seconds: 1), () async {
      await moveToHome();
    });
    // moveToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        centerTitle: true,
        title: Text(
          'Your Posts',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: getbody(),

    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: moveToHomeList.length,
        itemBuilder: (context, index) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () => showModalBottomSheet(
                context: context, builder: (context) => makeDismissible(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.8,
                  maxChildSize: 0.86,
                  minChildSize: 0.3,
                  builder: (_, controller) => Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ListView(
                        controller: controller,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xff2030A5),
                            radius: 60.0,
                            child: ClipRRect(
                              child:
                              Image.asset('assets/images/Profile.png', height: 100),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width*0.38, top: height*0.01),
                            child: Text(
                              moveToHomeList[index]["name"],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),


                          Padding(
                            padding:  EdgeInsets.only(top: height*0.04),
                            child: Row(
                              children: [
                                Text(
                                  "Contact Details:\n",
                                  style: TextStyle(fontSize: 18,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),

                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Contact:  ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["contact"].toString(),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Email:      ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["email"].toString(),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          // Divider(
                          //   height: 10,
                          //   thickness: 1,
                          //   color: Colors.black,
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.04),
                            child: Row(
                              children: [
                                Text(
                                  "Requirement:\n",
                                  style: TextStyle(fontSize: 18,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),

                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Required Worker:   ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["reqworker"].toString(),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "No. of Worker:        ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["noworker"].toString(),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Job Type:                ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["jobtype"].toString(),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Salary:                     ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["salary"].toString(),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.04),
                            child: Row(
                              children: [
                                Text(
                                  "Company Information:\n",
                                  style: TextStyle(fontSize: 18,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),

                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Address:   ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                moveToHomeList[index]["address"].toString().length >= 8?
                                Text(moveToHomeList[index]["address"].toString().substring(0,8),style: TextStyle(fontSize: 16)):
                                Text(moveToHomeList[index]["address"].toString().substring(0,15),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [

                                Text(moveToHomeList[index]["address"].toString().substring(8),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [


                                Text(
                                  "Time:                   ",
                                  style: TextStyle(fontSize: 16),

                                ),
                                Text(moveToHomeList[index]["timefrom"].toString().replaceAll("TimeOfDay(", "").replaceAll(")", "")+"   To   "+moveToHomeList[index]["timeto"].toString().replaceAll("TimeOfDay(", "").replaceAll(")", ""),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "Description:",
                                  style: TextStyle(fontSize: 16),

                                ),


                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [

                                Text(moveToHomeList[index]["desc"].toString().substring(0,42),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [

                                Text(moveToHomeList[index]["desc"].toString().substring(42,82),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [

                                Text(moveToHomeList[index]["desc"].toString().substring(82,100),style: TextStyle(fontSize: 16))

                              ],
                            ),
                          ),


                          // Divider(
                          //   height: 10,
                          //   thickness: 1,
                          //   color: Colors.black,
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                // enableDrag: false,
                // isDismissible: false
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
              ),
              child: Card(
                child: ListTile(
                    isThreeLine: true,
                    subtitle: Text(""),
                    leading: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff2030A5),
                          radius: 20.0,
                          child: ClipRRect(
                            child: Image.asset('assets/images/Profile.png',
                                height: 100),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Text(moveToHomeList[index]["name"].toString()),
                      ],
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Text("Job Title:",style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(
                                moveToHomeList[index]["reqworker"]
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(moveToHomeList[index]["desc"]
                              .toString()
                              .substring(0, 50) +
                              "..."),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Text("₹" +
                                  moveToHomeList[index]["salary"].toString()),
                              // Text("50000"),
                              SizedBox(
                                width: 20,
                              ),
                              Text(moveToHomeList[index]["jobtype"].toString()+"                 "),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home_Industry2(),
                                      ));
                                },
                                child: InkWell(
                                  onTap: (){
                                    Map<String,String> id = {
                                      "_id":moveToHomeList[index]["_id"].toString(),
                                    };
                                    networkHandler.post("/user/deletepost/",id);
                                    Fluttertoast.showToast(
                                        msg: "post deleted successfuly",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.black,
                                        fontSize: 15);

                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 20.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),
                              ),
                              // Text("Full-time"),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        });
  }

  List moveToHomeList = [];

  moveToHome() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    print("start");
    // var response =  await networkHandler.get("/user/profilegetind/jetani@gmail.com");
    // // if(response.statusCode == 200 || response.statusCode == 201){
    // var data = jsonDecode(response.body);
    // print("=============================${data}");
    // print("end");
    var response = await http.get(
        Uri.parse("https://3b8b-103-244-121-12.ngrok-free.app/user/getindustrypostcollection/${authcontroller.emailControllerlogin.value.text}"));
    var data = jsonDecode(response.body.toString());
    moveToHomeList = data["result"];


    // .map((item) => List_Class.fromJson(item))
    // .toList()
    // .cast<List_Class>();

    print(data);
    Navigator.of(context).pop();

    setState(() {});
    //print(re);
    // print("hgdmyit.u === ${re["result"]}");
    // name = re["result"]["name"].toString();
    // print(name);

    // address = re["result"]["address"];
    // contact = re["result"]["contact"].toString();
    // reqworker = re["result"]["reqworker"].toString();
    //
    // noworker = re["result"]["noworker"].toString();
// desc = re["result"]["desc"];
//     jobtype = re["result"]["jobtype"];
//      salary = re["result"]["salary"].toString();
//    timefrom = re["result"]["timefrom"];
//      timeto = re["result"]["timeto"];
//     companytime = timefrom +" AM"+  "           "     +  timeto+" PM" ;
//      email = re["result"]["email"];

    // Future getemplyeedata({isLoader = true, required String name, String? address, int? contact, String? reqworker, int? noworker,String? desc,String? jobtype,int? salary,String? timefrom,String? timeto,String? email}) async {
    //   //try {
    //
    //     // var response = await http.get(Uri.parse(
    //     //     "https://pleasant-trunks-bear.cyclic.app/emp/indgetdata"));
    //     // var re = jsonDecode(response.body);
    //     //if (re['error'] == null) {
    //       for (var i = 0; i < re['result'].length; i++) {
    //         if (re['result'][i] != null) {
    //           data.add(re['result'][i]);
    //         }
    //       }
    //     //}
    //   //} catch (e) {
    //    // if (isLoader == true) {
    //       setState(() {});
    //     }

    //   }
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(
      onTap: () {},
      child: child,
    ),
  );

// Widget buildSheet() => makeDismissible(
//       child: DraggableScrollableSheet(
//         initialChildSize: 0.5,
//         maxChildSize: 0.86,
//         minChildSize: 0.3,
//         builder: (_, controller) => Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: ListView(
//               controller: controller,
//               // mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Color(0xff2030A5),
//                   radius: 60.0,
//                   child: ClipRRect(
//                     child:
//                         Image.asset('assets/images/Profile.png', height: 100),
//                     borderRadius: BorderRadius.circular(100.0),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 100, top: 15),
//                   child: Text(
//                     "Employee Name",
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Name:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Contact no.:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Gender:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Age:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "City:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Skills:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Experience:",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   color: Colors.black,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 90, right: 90),
//                   child: Material(
//                     color: Color(0xff3040A5),
//                     borderRadius: BorderRadius.circular(40),
//                     child: InkWell(
//                       onTap: () => {},
//                       child: AnimatedContainer(
//                         duration: Duration(seconds: 1),
//                         height: 50,
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Hire",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
}
