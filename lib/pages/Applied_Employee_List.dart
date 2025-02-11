import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../comtroller/auth/auth_controller.dart';
import 'Drawer_Employee.dart';
import 'package:http/http.dart' as http;

class Applied_Employee_List extends StatefulWidget {
  const Applied_Employee_List({Key? key}) : super(key: key);

  @override
  State<Applied_Employee_List> createState() => _Applied_Employee_List();
}

class _Applied_Employee_List extends State<Applied_Employee_List> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3040A5),
        centerTitle: true,
        title: Text(
          'New-Joinings',
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
                                    "Current Place:           ",
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
                                    child: InkWell(
                                      onTap: (){
                                        Fluttertoast.showToast(
                                            msg: "This Functionality will be available soon",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: Colors.black,
                                            fontSize: 15);
                                      },
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
        Uri.parse("https://3b8b-103-244-121-12.ngrok-free.app/user/getjoindata/harshilcbatch2@gmail.com"));
    var data = jsonDecode(response.body.toString());
    print(data);
    moveToHomeList = data["result"];


    // print(data);
    // .map((item) => List_Class.fromJson(item))
    // .toList()
    // .cast<List_Class>();

    // print(data);
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
