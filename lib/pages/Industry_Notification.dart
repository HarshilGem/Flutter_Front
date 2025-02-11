// Industry_Notification

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Home_Employee2.dart';

import 'package:http/http.dart' as http;

class Industry_Notification extends StatefulWidget {
  const Industry_Notification({Key? key}) : super(key: key);

  @override
  State<Industry_Notification> createState() => _Industry_NotificationState();
}
circular() {
  CircularProgressIndicator(
    backgroundColor: Colors.black,
  );
}
class _Industry_NotificationState extends State<Industry_Notification> {

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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        title: Text("Notification"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Home_Employee2()
            )
            );
          },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3040A5),
                  shadowColor: Colors.transparent
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Icon(
                    Icons.arrow_back_ios_new, color: Colors.white, size: 25),
              )),
        ),
      ),
      body: getbody(),
    );
  }

  // body:SafeArea(
  Widget getbody() {
    return ListView.builder(
        itemCount: moveToHomeList.length,
        itemBuilder: (context, index) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_Employee2(),
                    ));
              },
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

                      ],
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Text("Job Title:",style: TextStyle(fontWeight:FontWeight.bold),),
                              Text("New Worker With Skills:"


                              )

                            ],
                          ),
                          Row(
                            children: [
                              // Text("Job Title:",style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(
                                  moveToHomeList[index]["body"][0]
                                      .toString()
                                      .toUpperCase()+"...",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),


                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              // Text("Job Title:",style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(
                                  moveToHomeList[index]["title"].toString().substring(0,30)



                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Text("Job Title:",style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(
                                  moveToHomeList[index]["title"].toString().substring(30,40)+"..."



                              ),
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
        Uri.parse("https://3b8b-103-244-121-12.ngrok-free.app/emp/indgetnotification"));
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
}

