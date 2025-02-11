import 'package:flutter/material.dart';
import 'package:test_logo/pages/Employee_Signup.dart';

class Create_Profile extends StatefulWidget {
  const Create_Profile({Key? key}) : super(key: key);

  @override
  State<Create_Profile> createState() => _Create_ProfileState();
}

class _Create_ProfileState extends State<Create_Profile> {
  String name = "";
  bool changebutton = false;
  String _email = "";


  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      }
      );
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Employee_Signup(),
          )
      );
      setState(() {
        changebutton = false;
      }
      );
    }
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    double height  = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
      child: Form(
      key: _formkey,
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Container(
      margin: const EdgeInsets.only(left: 0),
      child: Image.asset(
          "assets/images/page3.jpg",
          fit: BoxFit.cover, height: height*0.25, width: width*0.5
      ),
    ),
         Padding(
        padding: EdgeInsets.only(top: height*0.030, left: width*0.250,right:width*0.250 ),
        child: const Text(
        "Create Profile",
        style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        //decoration: TextDecoration.underline,
        ),
      )
      ),
             SizedBox(
              height: height*0.01,
            ),
             Padding(
              padding: EdgeInsets.only( left: width*0.25,right:width*0.250 ),
              child: Text(
                "For Hiring Only",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
             SizedBox(
              height: height*0.01,
            ),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.1, right: width*0.1),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter your Name",
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black,
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
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
              ),
            ),
             SizedBox(
              height: height*0.01,
            ),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.1, right: width*0.1),
                child: TextFormField(
                  maxLength: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //border: InputBorder.none,

                    prefixIcon: Icon(Icons.add_call),
                    hintText: "Enter Contact No",
                    labelText: "Contact No",
                    labelStyle: TextStyle(color: Colors.black,
                        fontSize: 18),
                    // hintStyle: TextStyle(color: Colors.black)
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
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
              ),
            ),

             SizedBox(
              height: height*0.01,
            ),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.1, right: width*0.1),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //border: InputBorder.none,

                    prefixIcon: Icon(Icons.location_pin),
                    hintText: "Enter your Address",
                    labelText: "Address",
                    labelStyle: TextStyle(color: Colors.black,
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
              height: height*0.01,
            ),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.1, right: width*0.1),
                child: TextFormField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    prefixIcon: Icon(Icons.email),
                    labelStyle: TextStyle(color: Colors.black,
                        fontSize: 18),
                    //   hintStyle: TextStyle(color: Colors.black),
                    hintText: "Enter your E-mail",
                    labelText: "E-mail",
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
                  onSaved: (String? name) {
                    _email = name!;
                  },
                ),
              ),
            ),
             SizedBox(
              height: height*0.01,
            ),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.1, right: width*0.1),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //border: InputBorder.none,

                    prefixIcon: Icon(Icons.access_time),
                    hintText: "Enter your Company Time",
                    labelText: "Company Time",
                    labelStyle: TextStyle(color: Colors.black,
                        fontSize: 18),
                    // hintStyle: TextStyle(color: Colors.black)
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                    {
                      return "Company Time cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
            ),
             SizedBox(
              height: height*0.01,
            ),
            Container(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.1, right: width*0.1),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD9D9D9),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //border: InputBorder.none,

                    prefixIcon: Icon(Icons.info_outline_rounded),
                    hintText: "Enter more about yourself",
                    labelText: "About",
                    labelStyle: TextStyle(color: Colors.black,
                        fontSize: 18),
                    // hintStyle: TextStyle(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height*0.01*3,
              // height: height/12,
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
                    "Create",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.lightGreen,
                  //   //shape: changebutton?BoxShape.circle:BoxShape.rectangle,
                  //
                  // ),
                ),
              ),
            ),

          ]
    )
      )
    )
    )
    );
  }
}
