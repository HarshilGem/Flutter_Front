import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
import 'package:test_logo/pages/Profile_Employee.dart';
import 'package:test_logo/pages/Profile_Industry.dart';

// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_logo/comtroller/auth/auth_controller.dart';
import 'package:test_logo/pages/Handler/NetworkHandler.dart';

class Edit_Profile_Industry extends StatefulWidget {
  Edit_Profile_Industry({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Industry> createState() => _Edit_Profile_IndustryState();
}

class _Edit_Profile_IndustryState extends State<Edit_Profile_Industry> {
  TimeOfDay time = TimeOfDay(hour: 09, minute: 00);
  TimeOfDay time2 = TimeOfDay(hour: 07, minute: 00);
  final authcontroller = Get.put(AuthController());
  NetworkHandler networkHandler = NetworkHandler();
   String name = "";
   TextEditingController _name = new TextEditingController();
   TextEditingController _contact = new TextEditingController();
   TextEditingController _address = new TextEditingController();
   TextEditingController _about = new TextEditingController();


   bool changebutton = false;
   moveToHome(BuildContext context) async {


     if (_formkey.currentState!.validate()) {
       Map<String, String> data = {
         "email":authcontroller.emailControllerlogin.value.text,
         "name":_name.text,
         "contact":_contact.text,
         "desc":_about.text,
         "address":_address.text,
         "timefrom":authcontroller.timefromeditprofile.value,
         "timeto":authcontroller.timetoeditprofile.value

       };
       print("/*-------------$data");
       await networkHandler.post("/user/updateindprofile", data);
       setState(() {
         changebutton = true;
       });
       print("done");
       await Future.delayed(Duration(seconds: 1));
       await Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => Home_Industry2(),
           ));
       setState(() {
         changebutton = false;
       });
     }
   }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
                      shadowColor: Colors.transparent
                  ),
                  child: const Icon(Icons.arrow_back,color: Colors.black,size: 40)),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: height*0.001),
              child: Text("Edit Profile",style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
                key: _formkey,
                  child: Column(
                        children:[
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.03),
                            child: CircleAvatar(
                              backgroundColor:  Color(0xff2030A5),
                              radius: 80.0,
                              child: ClipRRect(
                                child: Image.asset('assets/images/Profile.png',height: 150,),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  height*0.03,
                          ),
                           Container(
                              child: Padding(
                                padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                                child: TextFormField(
                                  controller: _name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xffD9D9D9),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),

                                    prefixIcon: const Icon(Icons.person),
                                    hintText: "Enter your name",
                                    labelText: "Name",
                                    labelStyle: const TextStyle(color: Colors.black,
                                        fontSize: 18),
                                    //hintStyle: TextStyle(fontSize: 30)
                                    // hintStyle: TextStyle(color: Colors.black)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          SizedBox(
                            height:  height*0.01,
                          ),
                          // Container(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 50.0, right: 50),
                          //     child: TextFormField(
                          //       maxLength: 10,
                          //       decoration: InputDecoration(
                          //         filled: true,
                          //         fillColor: const Color(0xffD9D9D9),
                          //         border: const OutlineInputBorder(),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(30),
                          //         ),
                          //         //border: InputBorder.none,
                          //         prefixIcon: const Icon(Icons.call),
                          //         hintText: "Enter Contact No ",
                          //         labelText: "Contact No ",
                          //         labelStyle: const TextStyle(color: Colors.black,
                          //             fontSize: 18),
                          //       ),
                          //       validator: (value) {
                          //         if (value!.isEmpty)
                          //         {
                          //           return "Contact No cannot be empty";
                          //         }
                          //         else if (value.length < 10 )
                          //         {
                          //           return "Please enter valid contact number";
                          //         }
                          //         return null;
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Container(
                            child: Padding(
                              padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                              child: TextFormField(
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                controller: _contact,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xffD9D9D9),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  //border: InputBorder.none,

                                  prefixIcon: const Icon(Icons.phone),
                                  hintText: "Enter your contact.No",
                                  labelText: "Contact No.",
                                  labelStyle: const TextStyle(color: Colors.black,
                                      fontSize: 18),
                                  // hintStyle: TextStyle(color: Colors.black)
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                  {
                                    return "E-mail cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  height*0.01,
                          ),
                          Container(
                            child: Padding(
                              padding:  EdgeInsets.only(left: width*0.12, right: width*0.12),
                              child: TextFormField(
                                controller: _address,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xffD9D9D9),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  //border: InputBorder.none,

                                  prefixIcon: const Icon(Icons.location_pin),
                                  hintText: "Enter your Address",
                                  labelText: "Address",
                                  labelStyle: const TextStyle(color: Colors.black,
                                      fontSize: 18),
                                  // hintStyle: TextStyle(color: Colors.black)
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                  {
                                    return "Address cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  height*0.02,
                          ),

                          // Container(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 50.0, right: 50),
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //         filled: true,
                          //         fillColor: const Color(0xffD9D9D9),
                          //         border: const OutlineInputBorder(),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(30),
                          //         ),
                          //         //border: InputBorder.none,
                          //
                          //         prefixIcon: const Icon(Icons.access_time_filled),
                          //         hintText: "Enter your Company Time",
                          //         labelText: "Company Time",
                          //         labelStyle: const TextStyle(color: Colors.black,
                          //             fontSize: 18),
                          //         // hintStyle: TextStyle(color: Colors.black)
                          //       ),
                          //       validator: (value) {
                          //         if (value!.isEmpty)
                          //         {
                          //           return "Company Time cannot be empty";
                          //         }
                          //         return null;
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [


                              Expanded(child:Text(
                                '${time.hour}:${time.minute}',
                                style: TextStyle(fontSize:25),
                              ),

                              ),
                              SizedBox(height: 10),
                              Expanded(child: ElevatedButton(onPressed: ()async {



                                TimeOfDay? newTime = await
                                showTimePicker(context: context, initialTime: time,);
                                if(newTime == null) return;
                                setState(()=>time = newTime);

                                authcontroller.timefromeditprofile.value = time.toString();



                              },
                                child: Text("Select Time"),

                              ),
                              )

                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [


                              Expanded(child:Text(
                                '${time2.hour}:${time2.minute}',
                                style: TextStyle(fontSize:25),
                              ),
                              ),

                              SizedBox(height: 10),
                              Expanded(child: ElevatedButton(onPressed: ()async {
                                TimeOfDay? newTime = await
                                showTimePicker(context: context, initialTime: time2,);
                                if(newTime == null) return;
                                setState(()=>time2 = newTime);
                                authcontroller.timetoeditprofile.value = time2.toString();
                              },
                                child: Text("Select Time"),

                              ),
                              )

                            ],
                          ),
                          SizedBox(
                            height:  height*0.02,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50.0, right: 50),
                              child: TextFormField(
                                controller: _about,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xffD9D9D9),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  //border: InputBorder.none,

                                  prefixIcon: const Icon(Icons.info_outline_rounded),
                                  hintText: "Enter more about yourself",
                                  labelText: "About",
                                  labelStyle: const TextStyle(color: Colors.black,
                                      fontSize: 18),
                                  // hintStyle: TextStyle(color: Colors.black)
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height:  height*0.03,
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
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  height*0.05,
                          ),
                          // ),
                          // ),
                        ]
                  ),
              ),
          )
    );
  }
}

