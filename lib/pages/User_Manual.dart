import 'package:flutter/material.dart';
// import 'package:test_logo/pages/Help_and_Support_Page.dart';
import 'package:test_logo/pages/User_Manual.dart';

class User_Manual extends StatelessWidget {
  const User_Manual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "User Manual",
            style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF3040a5),
          leading: Padding(
            padding:  EdgeInsets.only(top: height*0.02),
            // child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Help_and_Support_Page()));
            //     },
            //     style: ElevatedButton.styleFrom(
            //         primary: Color(0xff3040A5)
            //       //shadowColor: Colors.transparent
            //     ),
            //     child: Padding(
            //       padding:  EdgeInsets.only(bottom: height*0.02),
            //       child:  Icon(Icons.arrow_back_ios_new,
            //           color: Colors.white, size: 25),
            //     )
            // ),
          ),
        ),
        body:SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """ 
Welcome to the user manual for our application! This guide will provide you with detailed information on how to use the app's features and functionality. Please take a moment to review the following information:
            """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "1. Download and Install the App:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
• Go to the Google Play Store on your Android device.
• Search for our app and click "Install".
• Wait for the app to download and install on your device.
                      """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "2. Sign Up or Sign In:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
• Once the app is installed, open it.
• You have to create an account or sign in if you already have an account.
                      """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "3. Explore the App:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
• After signing in, you will be taken to the app's home screen.
• From the home screen, you can access various features of the app.
• Explore the app's features and functionalities by tapping on each section or part of app.
                      """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "4. Features of App:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
=> Features for Diamond Industries:
                      """,
                      style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.01),
                    child: Text(
                      """
    • You can create your own profile.  
    • You can see your personal information in profile page (click on profile icon located in navigation bar).You can also edit your personal information by clicking on pencil shaped icon located at top-right corner of profile page.
    • You can see some personal information of diamond workers like name,contact number,skills,experience etc., on home page to hire them.
    • You can search diamond workers on basis of their skills in search page (click on search icon located in navigation bar).
    • You can create posts by clicking on (+) icon located in navigation bar to introduce diamond workers about yourself.In case if you want to delete the post, you have to go to profile page by clicking on profile icon located in navigation bar.In profile page, you have to click on field named posts and then the list of posts will appear on screen with delete option.
    • If any diamond worker is interested to join your industry then you will be notified about it in notification page (click on notification icon located in navigation bar). 
    • By clicking on drawer located at top-left corner of home page, you can see fields like Settings,About Us and Contact Us where settings field consists of fields like account settings,language (change app language),logout etc.
                      """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
=> Features for Diamond Workers:
                     """,
                      style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: width * 0.01),
                child: Text(
                  """
    • You can sign up or sign in through Whatsapp.
    • You can create your own profile (by doing this it will help other users to identify yourself easily).
    • You can see your personal information in profile page (click on profile icon located in navigation bar).
      You can also edit your personal information by clicking on pencil shaped icon located at top-right corner of profile page.
    • You can see information about diamond industries like name,address and also information about job they offer such as job title,job type,salary etc., on home page.
    • In people network page (click on people icon located in navigation bar) you can make friends list by adding workers in it.
    • If any industry add new post or you get hired by any industry then you will be notified about it in notification page (click on notification icon located in navigation bar).
    • By clicking on drawer located at top-left corner of home page, you can see fields like Applied Jobs,Settings,About Us and Contact Us where applied jobs field contains industries names in which you have applied for jobs and settings field consists of fields like account settings,language (change app language),logout etc.
                     """,
                  style: TextStyle(fontSize: 18,
                  ),
                ),
              ),
            ),

    Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "4. Help & Support:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
• If you need help using the app or have any questions, you can refer to the app's help section or contact customer support (this feature is present in settings page).
• In the help section, you can find answers to frequently asked questions, troubleshoot problems and get tips on how to use the app effectively.
• If you can't find the answer to your question in the help section, you can contact customer support via email or phone.
                      """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "5. Log out:",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  alignment: Alignment.topLeft,
                  child:Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
• If you want to logout from app then click on field named Logout in settings page.
                      """,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
              ]
          ),
        ),
      ),
    );
  }
}
