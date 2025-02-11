import 'package:flutter/material.dart';
import 'package:test_logo/pages/Help_and_Support_Page.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Help & Support",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Color(0xFF3040a5),
              leading: Padding(
                padding:  EdgeInsets.only(top: height*0.02),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Help_and_Support_Page()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff3040A5),
                      //    shadowColor: Colors.transparent
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: height*0.02),
                      child:  Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 25),
                    )
                ),
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
                        "Welcome to the help and support page of Gemstone application! We're here to provide you with assistance and answer any questions you may have. Please take a moment to review the following information:",
                        style: TextStyle(fontSize: 18),
                      ),),),
                  Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        "Contact Information",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),),
                  Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        "If you have a question or need assistance, please don't hesitate to contact us. Our customer support team is available to help you 24/7 via email at .",
                        style: TextStyle(
                          fontSize: 18,

                        ),
                      ),
                    ),),
                  Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        "FAQs:",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,

                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),),
                  Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        """
We've compiled a list of frequently asked questions below. Please review them to see if your question has already been answered:\n\n
1.How do I create an account?\n
    If you were a Diamond worker simply click on Get a Job and sign in with your phone number or you were Diamond Industry simply click on Hire now and sign up with email and other details.\n
2.How do I reset my password?\n
    If you forget password during login just click on 'forgot password' link on the login page and follow the prompts to change your password or if you want to reset password go to change password in account settings in setting page and follow the prompts to reset your password.\n
3.How do I update my profile information?\n
    To update your profile information, click on the 'edit profile' button on your profile page and make the necessary changes.\n
4.How do I delete my account?\n
    To delete your account, please contact our customer support team and they will assist you with the process.\n
5.How do I report a bug or issue with the app?\n
    If you encounter a bug or issue with the app, please contact our customer support team and provide as much detail as possible about the problem. This will help us to quickly identify and resolve the issue.
                       """,
                        style: TextStyle(
                          fontSize: 18,

                        ),
                      ),
                    ),),
                  Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        "User Manual:",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,

                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),),
                  Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        "We also offer a comprehensive user manual that provides detailed instructions and information on how to use the app. You can access the user manual by clicking on the 'help' button in the app's menu.",
                        style: TextStyle(
                          fontSize: 18,

                        ),
                      ),
                    ),),Container(
                    alignment: Alignment.topLeft,
                    child:Padding(
                      padding: EdgeInsets.only(top: width * 0.05),
                      child: Text(
                        "Thank you for using our app! We hope that this help and support page has been helpful. If you need further assistance, please don't hesitate to contact us.",
                        style: TextStyle(
                          fontSize: 18,

                        ),
                      ),
                    ),),
                ],
              ),
            )
        )


    );
  }
}
