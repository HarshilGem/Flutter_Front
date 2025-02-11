import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'dart:convert';

import '../comtroller/auth/auth_controller.dart';
import 'Drawer_Employee.dart';
import 'package:http/http.dart' as http;

class Industry_Homefield_Search extends StatefulWidget {
  const Industry_Homefield_Search({Key? key}) : super(key: key);

  @override
  State<Industry_Homefield_Search> createState() => _Industry_Homefield_Search();
}

class _Industry_Homefield_Search extends State<Industry_Homefield_Search> {
  void initState() {
    //     () async {
    //   await moveToHome();
    // }();

    Future.delayed(Duration(seconds: 1), () async {
      await moveToHome();
    });
    // moveToHome();
    super.initState();
  }

  final authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        title: Text(
          "Your Search",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.only(top: height*0.02),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_Industry2()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3040A5), shadowColor: Colors.transparent),
              child: Padding(
                padding:  EdgeInsets.only(bottom: height*0.02),
                child:  Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 25),
              )
          ),
        ),
      ),
      body: getbody(),

    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: moveToHomeList.length,
        itemBuilder: (context, index) {
          bool isSame = false;
          for (var i = 0; i < moveToHomeList[index]["skills"].length; i++) {
            debugPrint("----${index}> ${moveToHomeList[index]["skills"][i]}");
            if (moveToHomeList[index]["skills"][i] ==
                authcontroller.searchresult.value) {
               isSame = true;
            }
          }
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return isSame ? Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => makeDismissible(
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.8,
                    maxChildSize: 0.86,
                    minChildSize: 0.3,
                    builder: (_, controller) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50))),
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
                                child: Image.asset('assets/images/Profile.png',
                                    height: 100),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.38, top: height * 0.01),
                              child: Text(
                                moveToHomeList[index]["name"],
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: height * 0.04),
                              child: Row(
                                children: [
                                  Text(
                                    "Contact Details:\n",
                                    style: TextStyle(
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold),
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
                                  Text(
                                      moveToHomeList[index]["contact2"]
                                          .toString(),
                                      style: TextStyle(fontSize: 16))
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
                                  Text(
                                      moveToHomeList[index]["email"].toString(),
                                      style: TextStyle(fontSize: 16))
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
                              padding: EdgeInsets.only(top: height * 0.04),
                              child: Row(
                                children: [
                                  Text(
                                    "Personal Information:\n",
                                    style: TextStyle(
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Skills:   ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                      moveToHomeList[index]["skills"]
                                          .toString()
                                          .replaceAll("[", "")
                                          .replaceAll("]", "")
                                          .substring(0, 20),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                      "              " +
                                          moveToHomeList[index]["skills"]
                                              .toString()
                                              .replaceAll("[", "")
                                              .replaceAll("]", "")
                                              .substring(20),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Current Place:              ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                      moveToHomeList[index]["currentplace"]
                                          .toString(),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Experience Year:          ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(moveToHomeList[index]["year"].toString(),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Expected Salary:          ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                      moveToHomeList[index]["salary"]
                                          .toString(),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Address:   ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  moveToHomeList[index]["address"]
                                              .toString()
                                              .length >=
                                          8
                                      ? Text(
                                          moveToHomeList[index]["address"]
                                              .toString()
                                              .substring(0, 8),
                                          style: TextStyle(fontSize: 16))
                                      : Text(
                                          moveToHomeList[index]["address"]
                                              .toString()
                                              .substring(0, 15),
                                          style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                      moveToHomeList[index]["address"]
                                          .toString()
                                          .substring(8),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 10,
                            ),
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
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                      moveToHomeList[index]["desc"]
                                          .toString()
                                          .substring(0, 42),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                      moveToHomeList[index]["desc"]
                                          .toString()
                                          .substring(42, 82),
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                      moveToHomeList[index]["desc"]
                                          .toString()
                                          .substring(82, 100),
                                      style: TextStyle(fontSize: 16))
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.2, right: width * 0.2),
                              child: Material(
                                color: Color(0xff3040A5),
                                borderRadius: BorderRadius.circular(40),
                                child: InkWell(
                                  onTap: () => {},
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Hire",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
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
                        Text(
                            moveToHomeList[index]["name"]
                                .toString()
                                .toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width * 0.01),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Skills:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(moveToHomeList[index]["skills"][0]
                                  .toString()),
                              // Text(moveToHomeList[index]["skills"][1].toString()),
                            ],
                          ),
                          Row(
                            children: [
                              // Text("Skills:",style: TextStyle(fontWeight: FontWeight.bold)),
                              // Text(moveToHomeList[index]["skills"][0].toString()),
                              Text("           " +
                                  moveToHomeList[index]["skills"][1]
                                      .toString()),
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
                              Text("Range:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("₹" +
                                  moveToHomeList[index]["salary"].toString()),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              // Text("Experience:",style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(moveToHomeList[index]["year"].toString() +
                                  " years"),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ):SizedBox();
        });
  }

  List moveToHomeList = [];
  List demoList = [];

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
        Uri.parse("https://3b8b-103-244-121-12.ngrok-free.app/user/empgetdata"));
    var data = jsonDecode(response.body.toString());
    moveToHomeList = data["result"];
// for(var i = 0;i<= moveToHomeList.length;i++){
//   if(authcontroller.searchresult.value.toString() == data["result"]["skills"][0].toString()) {
//     //     demoList = data["result"];
//     {
//       print("hello");
//     }
//     //   print("---------${demoList}");
//     // }
//     // else{
//     //   print("---------fail");
//     // }
//     // print(i);
// // print(["result"]["_id"]);
//
//   }}
//     print(data["result"]["name"].toString());
// print(authcontroller.searchresult.value);
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
}
