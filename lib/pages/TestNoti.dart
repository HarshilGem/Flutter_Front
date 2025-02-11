import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;

class Employee_Network extends StatefulWidget {
  const Employee_Network({Key? key}) : super(key: key);

  @override
  State<Employee_Network> createState() => _Employee_NetworkState();
}

class _Employee_NetworkState extends State<Employee_Network> {
  List<Contact>? _contacts;
  List<Contact>? contacts;
  List finallist = [];
  List<Contact>? finalnum;


  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
    Future.delayed(Duration(seconds: 1), () async {
      await moveToHome();
    });

    getbody();


  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);


    }
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  // method(){
  //   if (_permissionDenied) return Center(child: Text('Permission denied'));
  //   if (_contacts == null) return Center(child: CircularProgressIndicator());
  //   return ListView.builder(
  //       itemCount: _contacts!.length,
  //       itemBuilder: (context, i) => ListTile(
  //         title: Text(_contacts![i].displayName),
  //       ));
  // }
  // moveToHome(BuildContext context) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => Home_Employee2(),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: width * 0.04),
            child: IconButton(
              icon: Icon(
                Icons.person_search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // do something
              },
            ),
          )
        ], // trailing: Icon(Icons.arrow_forward_ios,
        //     color: Colors.black, size: 25),
        backgroundColor: Color(0xff3040A5),
        title: Text("People Network"),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(top: height * 0.02),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home_Employee2()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff3040A5),
                  shadowColor: Colors.transparent),
              child: Padding(
                padding: EdgeInsets.only(bottom: width * 0.02),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 25),
              )),
        ),
      ),
      body:Column(
        children: [
          getbody(),

        ],
      ),
    );
  }

  Widget getbody() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height*0.30,
        child: ListView.builder(

            scrollDirection: Axis.vertical,
            itemCount: _contacts!.length,
            itemBuilder: (context, index) {

              String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number):"--";



              return Padding(

                padding:  EdgeInsets.only(left: width*0.07,top: height*0.03),
                child: Column(

                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                  color: Color(0xff3040A5),
                                  width: 4,
                                )),
                            shadowColor: Color(0xff3040A5),
                            elevation: 10,
                            child: Column(children: [
                              ListTile(

                                title: Padding(
                                  padding:  EdgeInsets.only(left:width*0.08),
                                  child: Text(contacts![index].phones.first.number),
                                ),

                                subtitle: Padding(
                                  padding:  EdgeInsets.only(left:width*0.09),
                                  child: Text(_contacts![index].displayName),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: height*0.07),
                                child: Material(
                                  color: Color(0xff3040A5),
                                  borderRadius: BorderRadius.circular(40),
                                  child: InkWell(
                                    onTap: () => moveToHome(),
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      height: 30,
                                      width: 70,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Invite",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ])),
                      ),
                    ]
                ),
              );
            }
        ) );
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
        Uri.parse("https://pleasant-trunks-bear.cyclic.app/user/empgetdata"));
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

}