import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';
import 'package:test_logo/pages/Home_Employee2.dart';
import 'package:http/http.dart' as http;

import '../comtroller/auth/auth_controller.dart';
import 'Profile_Employee.dart';


class Employeee_Join extends StatefulWidget {

  final String? emailind;
  const Employeee_Join({Key? key,required this.emailind}) : super(key: key);

  @override
  State<Employeee_Join> createState() => _Employeee_Join();
}

class _Employeee_Join extends State<Employeee_Join> {



  List growableList = [];

  List _diamonds = [
    "Semi-asort",
    "Full-asort",
    "Galaxy Planner",
    "Manual Marker",
    "Sarin-operator",
    "Rekert",
    "Vajan",
    "Data entery",
    "Boil",
    "Manager",
    "Taliya",
    "Russian",
    "Table",
    "Taliya pel",
    "Blocking-chapka",
    "Mathala",
    "Diy-Fixening",
    "Dori",
  ];

  // final _items = _diamonds
  //     .map((diamond) => MultiSelectItem<Diamond>(diamond, diamond.name))
  //     .toList();
  List selectedDiamonds = [];
  List skills = [];

  // List<Diamond> _item = [];
  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _contact2 = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _currentplace = TextEditingController();
  TextEditingController _skills = TextEditingController();
  TextEditingController _desc = TextEditingController();
  bool showvalue = false;
  bool validate = false;
  NetworkHandler networkHandler = NetworkHandler();
  String name = "";
  bool changebutton = false;

  // String _email = "";
  bool circular = false;

  final authcontroller = Get.put(AuthController());
  moveToHome(BuildContext context) async {
    Text("done");
    if (_formkey.currentState!.validate()) {
      Map<String, String> data = {
        "name": authcontroller.profilename.value.text,
        "email": authcontroller.profileemail.value.text,
        "emailind": widget.emailind.toString(),
        "contact": authcontroller.employephonenumber.value.text,
        "contact2": authcontroller.profilecontact2.value.text,
        "address":authcontroller.profileaddress.value.text,
        "currentplace":authcontroller.profileaddress.value.text,
        "skills":jsonEncode(selectedDiamonds),
        "desc":authcontroller.profiledesc.value.text,
        "year":authcontroller.profileyear.value.text,
        "salary":authcontroller.profilesalary.value.text
      };

      Map<String, String> data2 = {
        "name": authcontroller.appliedname.value,
        "address": authcontroller.appliedaddress.value,
        "contact": authcontroller.appliedcontact.value,
        "reqworker": authcontroller.appliedreqworker.value,
        "noworker": authcontroller.appliednoworker.value,
        "desc": authcontroller.applieddesc.value,
        "jobtype": authcontroller.appliedjobtype.value,
        "salary":authcontroller.appliedsalary.value,
        "timefrom": authcontroller.appliedtimefrom.value,
        "timeto": authcontroller.appliedtimeto.value,
        "email": authcontroller.appliedemail.value,
        "contactemp":authcontroller.employephonenumber.value.text
      };
      print("/*-------------$data");
      print("/*-------------$data2");
//
     var out = await networkHandler.post("/emp/createjoindata", data);

print(out);
if(out=="ok")
  {
    await networkHandler.post("/user/applied", data2);
// print("hi");
  }

      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home_Employee2()));
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    selectedDiamonds.clear();
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      await moveToHomedata();
    });
    print(widget.emailind);
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            //imageProfile(),
            Center(
              child: Stack(children: <Widget>[
                CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                    // _imageFile == null?
                    AssetImage("assets/images/Profile.png")
                  // : FileImage(File(_imageFile.path)),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: ((builder) => bottomSheet()),
                      // );
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.teal,
                      size: 28.0,
                    ),
                  ),
                ),
              ]),),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: authcontroller.profilename.value,
                decoration: InputDecoration(

                  filled: true,
                  fillColor: Color(0xffD9D9D9),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                  hintText:authcontroller.profilename.value.text,
                  labelText:  "Username",
                  labelStyle:
                  TextStyle(color: Colors.black, fontSize: 18),
                  //hintStyle: TextStyle(fontSize: 30)
                  // hintStyle: TextStyle(color: Colors.black)
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                }
            ),
            //nameTextField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller:  authcontroller.profileaddress.value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffD9D9D9),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //border: UnderlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                  hintText:authcontroller.profileaddress.value.text,
                  labelText: "Address",
                  labelStyle:
                  TextStyle(color: Colors.black, fontSize: 18),
                  //hintStyle: TextStyle(fontSize: 30)
                  // hintStyle: TextStyle(color: Colors.black)
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Address cannot be empty";
                  }
                  return null;
                }
            ),
            //professionTextField(),

            //dobField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // obscureText: true,
              controller:  authcontroller.profileemail.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //border: UnderlineInputBorder(),

                prefixIcon: Icon(Icons.email),
                labelStyle:
                TextStyle(color: Colors.black, fontSize: 18),
                //   hintStyle: TextStyle(color: Colors.black),
                hintText: authcontroller.profileemail.value.text,
                labelText:  "E-mail",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email cannot be empty";
                }

                if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return "Please enter valid email address";
                }
                return null;
              },
              // onSaved: (String? name) {
              //   _email = name!;
              // },
            ),
            SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   // obscureText: true,
            //   enabled: false,
            //   controller: authcontroller.employephonenumber.value,
            //     keyboardType: TextInputType.number,
            //     maxLength: 10,
            //     //controller: authcontroller.employephonenumber.value,
            //     decoration: InputDecoration(
            //
            //       filled: true,
            //       fillColor: Color(0xffD9D9D9),
            //       border: OutlineInputBorder(),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       //border: UnderlineInputBorder(),
            //       prefixIcon: Icon(Icons.phone),
            //       hintText:authcontroller.profilecontact.value.text,
            //       labelText: "Enter your contact no",
            //       labelStyle:
            //       TextStyle(color: Colors.black, fontSize: 18),
            //       //hintStyle: TextStyle(fontSize: 30)
            //       // hintStyle: TextStyle(color: Colors.black)
            //     ),
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return "Contact No cannot be empty";
            //       }
            //       else if (value.length < 10) {
            //         return "Please enter valid contact number";
            //       }
            //       return null;
            //     }
            //   // onChanged: (value) {
            //   //   name = value;
            //   //   setState(() {});
            //   // },
            // ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: authcontroller.profilecontact2.value,
              keyboardType: TextInputType.number,
              maxLength: 10,
              //controller: authcontroller.employephonenumber.value,
              decoration: InputDecoration(

                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //border: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                // hintText:authcontroller.profilecontact2.value.text,
                hintText: authcontroller.profilecontact2.value.text,
                labelText:"Enter your contact no 2",
                labelStyle:
                TextStyle(color: Colors.black, fontSize: 18),
                //hintStyle: TextStyle(fontSize: 30)
                // hintStyle: TextStyle(color: Colors.black)
              ),


              // onChanged: (value) {
              //   name = value;
              //   setState(() {});
              // },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: authcontroller.profilesalary.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                //border: UnderlineInputBorder(),
                //border: InputBorder.none,

                prefixIcon: Icon(Icons.location_pin),
                hintText: authcontroller.profilesalary.value.text,
                labelText:"Enter your salary Range",
                labelStyle: TextStyle(color: Colors.black,
                    fontSize: 18),
                // hintStyle: TextStyle(color: Colors.black)
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Salary range cann't be empty";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: authcontroller.profileyear.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                //border: UnderlineInputBorder(),
                //border: InputBorder.none,

                prefixIcon: Icon(Icons.location_pin),
                hintText: authcontroller.profileyear.value.text,
                labelText: "Enter Year Of Experience",
                labelStyle: TextStyle(color: Colors.black,
                    fontSize: 18),
                // hintStyle: TextStyle(color: Colors.black)
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Year of experience cannot be empty";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Row(children: [
                Icon(Icons.workspaces_sharp),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  "Select your skills:",
                  style: TextStyle(fontSize: 17),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Row(children: [
                Icon(Icons.workspaces_sharp),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text("Your Current Skills Are:",
                  style: TextStyle(fontSize: 17),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.01),
              child: Row(children: [

                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                    authcontroller.profileskills.value.text.toString()
                        .replaceAll("[", "")
                        .replaceAll("]", ""),
                  style: TextStyle(fontSize: 17),
                ),
              ]),
            ),

            SizedBox(
              height: 20,
            ),

            Wrap(
              children: [
                for (var i = 0; i < _diamonds.length; i++)
                  InkWell(
                    onTap: () {
                      if (selectedDiamonds
                          .contains(_diamonds[i].toString())) {
                        setState(() {
                          selectedDiamonds
                              .remove(_diamonds[i].toString());
                        });
                        print(
                            "-----------------------------------> ${selectedDiamonds}");
                      } else {
                        setState(() {
                          selectedDiamonds
                              .add("${_diamonds[i].toString()}");
                          print(
                              "-----------------------------------> ${selectedDiamonds}");
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.05,
                          bottom: height * 0.01,
                          right: width * 0.001),
                      child: Text(
                        _diamonds[i].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: selectedDiamonds
                                .contains(_diamonds[i].toString())
                                ? Colors.blue
                                : Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
            //titleTextField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: authcontroller.profiledesc.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9D9D9),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                //border: UnderlineInputBorder(),
                //border: InputBorder.none,
                prefixIcon: Icon(Icons.info_outline_rounded),
                hintText: authcontroller.profiledesc.value.text,
                labelText: "Enter more about your self",
                labelStyle:
                TextStyle(color: Colors.black, fontSize: 18),
                // hintStyle: TextStyle(color: Colors.black)
              ),
            ),
            //aboutTextField(),
            SizedBox(
              height: 20,
            ),
            Material(
              color: Color(0xff3040A5),
              borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
              child: InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: changebutton ? 50 : 150,
                  alignment: Alignment.center,

                  child: changebutton
                      ? Icon(
                    Icons.done,
                    color: Colors.white,
                    //color: Color(0xff3040A5)
                  )
                      : Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.lightGreen,
                  //   //shape: changebutton?BoxShape.circle:BoxShape.rectangle,
                  //
                  // ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       circular = true;
            //     });
            // if (_globalkey.currentState.validate()) {
            //   Map<String, String> data = {
            //     "name": _name.text,
            //     "profession": _profession.text,
            //     "DOB": _dob.text,
            //     "titleline": _title.text,
            //     "about": _about.text,
            //   };
            //   var response =
            //   await networkHandler.post("/profile/add", data);
            //   if (response.statusCode == 200 ||
            //       response.statusCode == 201) {
            //     if (_imageFile.path != null) {
            //       var imageResponse = await networkHandler.patchImage(
            //           "/profile/add/image", _imageFile.path);
            //       if (imageResponse.statusCode == 200) {
            //         setState(() {
            //           circular = false;
            //         });
            //           Navigator.of(context).pushAndRemoveUntil(
            //               MaterialPageRoute(builder: (context) => HomePage()),
            //                   (route) => false);
            //         }
            //       } else {
            //         setState(() {
            //           circular = false;
            //         });
            //         Navigator.of(context).pushAndRemoveUntil(
            //             MaterialPageRoute(builder: (context) => HomePage()),
            //                 (route) => false);
            //       }
            //     }
            //   }
            // },

            // }
            //),
          ],
        ),

      ),
    );
  }


  // Widget imageProfile() {
  //   return Center(
  // child: Stack(children: <Widget>[
  //   CircleAvatar(
  //     radius: 60.0,
  //     backgroundImage:
  // // _imageFile == null?
  // AssetImage("assets/images/Profile.png")
  //         // : FileImage(File(_imageFile.path)),
  //   ),
  //   Positioned(
  //     bottom: 20.0,
  //     right: 20.0,
  //     child: InkWell(
  //       onTap: () {
  //         showModalBottomSheet(
  //           context: context,
  //           builder: ((builder) => bottomSheet()),
  //         );
  //       },
  //       child: Icon(
  //         Icons.camera_alt,
  //         color: Colors.teal,
  //         size: 28.0,
  //       ),
  //     ),
  //   ),
  // ]),
  //   );
  // }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          //   FlatButton.icon(
          //     icon: Icon(Icons.camera),
          //     onPressed: () {
          //       takePhoto(ImageSource.camera);
          //     },
          //     label: Text("Camera"),
          //   ),
          //   FlatButton.icon(
          //     icon: Icon(Icons.image),
          //     onPressed: () {
          //       takePhoto(ImageSource.gallery);
          //     },
          //     label: Text("Gallery"),
          //   ),
          // ])
        ],
      ),
    );
  }

// void takePhoto(ImageSource source) async {
//   final pickedFile = await _picker.getImage(
//     source: source,
//   );
//   setState(() {
//     _imageFile = pickedFile;
//   });
// }

  moveToHomedata() async{
    print("start");
    // var response =  await networkHandler.get("/user/profilegetind/jetani@gmail.com");
    // // if(response.statusCode == 200 || response.statusCode == 201){
    // var data = jsonDecode(response.body);
    // print("=============================${data}");
    // print("end");
    var response = await http.get(Uri.parse(
        "https://ce20-2409-40c1-e-fd0d-2137-9737-2b1b-7487.ngrok-free.app/emp/profilegetemp/${authcontroller.employephonenumber.value.text}"));
    var re = jsonDecode(response.body);
    print(re);
    print(re);
    print(re["result"]["contact"]);
    authcontroller.employephonenumber.value.text= re["result"]["contact"].toString();
    authcontroller.profileskills.value.text= re["result"]["skills"].toString();
    authcontroller.profilecontact2.value.text= re["result"]["contact2"].toString();
    authcontroller.profiledesc.value.text= re["result"]["desc"].toString();
    authcontroller.profilename.value.text= re["result"]["name"].toString();
    authcontroller.profileemail.value.text= re["result"]["email"].toString();
    authcontroller.profileaddress.value.text= re["result"]["address"].toString();
    authcontroller.profilecurrentplace.value.text = re["result"]["currentplace"].toString();
    authcontroller.profilesalary.value.text = re["result"]["salary"].toString();
    authcontroller.profileyear.value.text = re["result"]["year"].toString();
print("----------------------------------------------------hhhhhhhhhhhhhhhh------------");
var o = widget.emailind.toString();print(o);
    var response2 = await http.get(Uri.parse(
        "9033753288/emp/getaddddddd/${o}"));
    var re2 = jsonDecode(response2.body);
    print(re2);

//
//
//
  print(authcontroller.appliedname.value = re2["result"]["name"])  ;
    authcontroller.appliedaddress.value = re2["result"]["address"];
    authcontroller.appliedcontact.value = re2["result"]["contact"].toString();
    authcontroller.appliedreqworker.value = re2["result"]["reqworker"].toString();
    authcontroller.appliednoworker.value = re2["result"]["noworker"].toString();
    authcontroller.applieddesc.value = re2["result"]["desc"];
    authcontroller.appliedjobtype.value = re2["result"]["jobtype"];
    print(re2["result"]["jobtype"]);
    authcontroller.appliedsalary.value = re2["result"]["salary"].toString();
    authcontroller.appliedtimefrom.value = re2["result"]["timefrom"].toString();
    authcontroller.appliedtimeto.value = re2["result"]["timeto"].toString();
    authcontroller.appliedemail.value = re2["result"]["email"];






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

