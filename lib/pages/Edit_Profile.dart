import 'package:flutter/material.dart';
import 'package:test_logo/pages/Profile_Employee.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

class Edit_Profile extends StatelessWidget {
   Edit_Profile({Key? key}) : super(key: key);

   String name = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder:(context)=> Profile_Employee()
                )
                );
              },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 0.0,
                      shadowColor: Colors.transparent
                  ),
                  child: const Icon(Icons.arrow_back,color: Colors.black,size: 40)),
            ),
            title:const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Edit Profile",style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
              ),
            ),
          ),
          body:SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: _formkey,
            child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xff2030A5),
                        radius: 80.0,
                        child: ClipRRect(
                          child: Image.asset('assets/images/Profile.png',height: 150,),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffD9D9D9),
                            border: const OutlineInputBorder(),//uper jay che aa anathi
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
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50),
                        child: TextFormField(
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
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50),
                        child: TextFormField(
                          maxLength: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffD9D9D9),
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            //border: InputBorder.none,
                            prefixIcon: const Icon(Icons.call),
                            hintText: "Enter Contact No",
                            labelText: "Contact No",
                            labelStyle: const TextStyle(color: Colors.black,
                                fontSize: 18),
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                            {
                              return "Contact No cannot be empty";
                            }
                            else if (value.length < 10 )
                            {
                              return "Please enter valid contact number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50),
                        child: TextFormField(
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
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      // child: Padding(
                      //   padding: const EdgeInsets.only(left: 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Profile_Employee(),
                          )
                           );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff3040A5),
                        ),
                        child: const Text("Update",style: TextStyle(fontSize: 23),),
                      ),
                    )
                    // ),
                    // ),
                  ]
            )
          ),
              )
          )
        )
    );
  }
}

