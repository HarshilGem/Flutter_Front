import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
    fetchContacts();
    Future.delayed(Duration(seconds: 3), () async {
      await moveToHome();
    });

    Future.delayed(Duration(seconds: 3), () async {
      await getData();
    });

    // getbody();


  }


  Future fetchContacts() async {
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
    // List<String> a = contacts!.map((e) => e.phones.first.number).toList();
    //
    // print(a);


  }

  getData() {

    // List<String> a = contacts!.map((e) => e.phones.first.number).toList();
    // List<dynamic> b = moveToHomeList.map((e) => e["contacts"]).toList();
    // List<String> a = contacts?.map((e) => e.phones.first.number)?.toList() ?? [];

    // // List<String> b = ["+91 "+moveToHomeList[index]["contact"].toString()];
    // List<String> b = ["+91 99259 75431"];
    //
    // // List<String> a = [contacts!.toString()];
    // // List<String> b = [moveToHomeList.toString()];
    //
    //
    // print(a);
    // print(b);
    // print(b);
    // List<dynamic> commonElements = a.where((element) => b.contains(element)).toList();
    print("--------------------------------------------");
    // print(commonElements);
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 23) / 3;
    final double itemWidth = size.width / 2;
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

      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),

        // Generate 100 widgets that display their index in the List.
        children: List.generate(_contacts!.length, (index) {
          String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number):"--";
          return Container(

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
                  SizedBox(height: 10,),
                  CircleAvatar(
                    backgroundColor: Color(0xff2030A5),
                    radius: 30.0,
                    child: ClipRRect(
                      child: Image.asset('assets/images/Profile.png',height: height*0.7,),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),

                  ListTile(

                    title: Padding(
                      padding:  EdgeInsets.only(left:width*0.08),
                      child: Text(num.removeAllWhitespace.replaceAll("+91", "")),
                    ),

                    subtitle: Padding(
                      padding:  EdgeInsets.only(left:width*0.09),
                      child: Text(contacts![index].displayName),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: height*0.01),
                    child: Material(
                      color: Color(0xff3040A5),
                      borderRadius: BorderRadius.circular(40),
                      child: InkWell(
                        onTap: () async =>  launchWhatsapp(number: num, message: "You are invited to use gemstone \n https://gemstonefinal.page.link/start"),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 40,
                          width: 80,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(Icons.person_add,
                              color: Colors.white,),
                              Text(
                                "  Invite",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],

                          ),
                        ),
                      ),
                    ),
                  )
                ])),
          );
        }),
      )
      // Column(
      //   children: [
      //     getbody(),
      //
      //   ],
      // ),
    );
  }

  Widget? getbody() {

  //   if (_permissionDenied) return Center(child: Text('Permission denied'));
  //   if (_contacts == null) return Center(child: CircularProgressIndicator());
  //
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;
  //   return SizedBox(
  //       height: height*0.30,
  //       child: ListView.builder(
  //
  //           scrollDirection: Axis.vertical,
  //           itemCount: _contacts!.length,
  //           itemBuilder: (context, index) {
  //
  //             String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number):"--";
  //             // print(num);
  //             // List<String> a = contacts!.map((e) => e.phones.first.number).toList();
  //             // print(a);
  //
  //             return Padding(
  //
  //               padding:  EdgeInsets.only(left: width*0.07,top: height*0.03),
  //               child: Column(
  //
  //                   children: [
  //                     Container(
  //                       height: 200,
  //                       width: 150,
  //                       child: Card(
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(15.0),
  //                               side: BorderSide(
  //                                 color: Color(0xff3040A5),
  //                                 width: 4,
  //                               )),
  //                           shadowColor: Color(0xff3040A5),
  //                           elevation: 10,
  //                           child: Column(children: [
  //                             ListTile(
  //
  //                               title: Padding(
  //                                 padding:  EdgeInsets.only(left:width*0.08),
  //                                 child: Text(num),
  //                               ),
  //
  //                               subtitle: Padding(
  //                                 padding:  EdgeInsets.only(left:width*0.09),
  //                                 child: Text(_contacts![index].displayName),
  //                               ),
  //                             ),
  //                             Padding(
  //                               padding:  EdgeInsets.only(top: height*0.07),
  //                               child: Material(
  //                                 color: Color(0xff3040A5),
  //                                 borderRadius: BorderRadius.circular(40),
  //                                 child: InkWell(
  //                                   onTap: () => moveToHome(),
  //                                   child: AnimatedContainer(
  //                                     duration: Duration(seconds: 1),
  //                                     height: 30,
  //                                     width: 70,
  //                                     alignment: Alignment.center,
  //                                     child: Text(
  //                                       "Invite",
  //                                       style: TextStyle(
  //                                           fontSize: 15,
  //                                           fontWeight: FontWeight.bold,
  //                                           color: Colors.white),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             )
  //                           ])),
  //                     ),
  //                   ]
  //               ),
  //             );
  //           }
  //       ) );
  }

  List moveToHomeList = [];
  moveToHome() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    print("start");
    var response = await http.get(
        Uri.parse("https://pleasant-trunks-bear.cyclic.app/user/empgetdata"));
    var data = jsonDecode(response.body.toString());
    moveToHomeList = data["result"];




    print(data);
    Navigator.of(context).pop();

    setState(() {});

  }
  void launchWhatsapp({@required number,@required message}) async{
    var whatsappUrl =
        "whatsapp://send?phone=${number}" +
            "&text=${Uri.encodeComponent(message)}";
    try{
      launch(whatsappUrl);
    }
    catch(Exception){
      print("not open");
    }
  }

}