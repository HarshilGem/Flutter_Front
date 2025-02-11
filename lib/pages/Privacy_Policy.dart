import 'package:flutter/material.dart';
import 'package:test_logo/pages/Employee_settings.dart';

class Privacy_Policy extends StatelessWidget {
  const Privacy_Policy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3040A5),
          title: Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          leading: Padding(
            padding:  EdgeInsets.only(top: height*0.02),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Employee_settings()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff3040A5), shadowColor: Colors.transparent),
                child: Padding(
                  padding:  EdgeInsets.only(bottom: height*0.02),
                  child:  Icon(Icons.arrow_back_ios_new,
                      color: Colors.white, size: 25),
                )
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05, left: width * 0.10, right: width * 0.1),
                    child: Text(
                      "Your Privacy Matters",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )),

              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      "Gemstone's vision is to connect Diamond Workers and Diamond Industries together straightforwardly.\n\nThe concept of the GemStone system is to combine the diamond industry and its workers directly without any third party invlovement.\n\n The concept of the GemStone system is to combine the diamond industry and its workers directly without any third party invlovement.\n\nThis system helps the diamond industry to find workers based on their skills and budget for production costs.It also guides diamond workers to get a job in the industry as per their experience, and the salary they need for work.\n\nThis Privacy Policy applies to you when you use our application.We collect some personal information about you to interact easily with our application.",
                      style: TextStyle(fontSize: 16),
                    ),
                  )),

              // Container(
              //       child: Padding(
              //         padding: EdgeInsets.only(top: width * 0.05),
              //         child: Text(
              //           "Table of Content",
              //           style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       )),
              //
              //       Container(
              //           alignment: Alignment.topLeft,
              //           child: Padding(
              //             padding: EdgeInsets.only(
              //                 top: width * 0.05),
              //             child: Text(
              //     "1.Data We Collect\n2.How We Use Your Data\n3.How We Share Information",
              //     style: TextStyle(fontSize: 16),
              //   ),
              // )),

              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05),
                    child: Text(
                      "1.Information We Collect",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),

              // Container(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //   padding: EdgeInsets.only(
              //       top: width * 0.05),
              //   child: Text(
              //     "Registration",
              //     style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //         ),
              //   ),
              // )),

              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
We may collect the following information about you:

• Personal Information: We may collect personal information such as your name, email address, and phone number when you create an account with us or contact us for support.

• Usage Information: We may collect information about how you use our App, such as the features you use, the pages you visit, and the time and date of your visits.

• Device Information: We may collect information about the device you use to access our App, such as the type of device, operating system, and mobile network information.
                  """,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),

              // Container(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //   padding: EdgeInsets.only(
              //       top: width * 0.05),
              //   child: Text(
              //     "Profile",
              //     style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //         ),
              //   ),
              // )),
              //
              // Container(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //   padding: EdgeInsets.only(top: width * 0.05),
              //   child: Text(
              //     "For creating a profile in our application, you need to give your data such as name, email, contact, Address and few more details about you.",
              //     style: TextStyle(fontSize: 16),
              //   ),
              // )),
              //
              // Container(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //   padding: EdgeInsets.only(
              //       top: width * 0.05),
              //   child: Text(
              //     "Posting",
              //     style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //         ),
              //   ),
              // )),
              //
              // Container(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //   padding: EdgeInsets.only(top: width * 0.05),
              //   child: Text(
              //     "We need your company's personal data for creating a post to acknowledge workers about the company.",
              //     style: TextStyle(fontSize: 16),
              //   ),
              // )),

              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05),
                    child: Text(
                      "2.How We Use Your Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),

              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
We may use your information for the following purposes:

• To provide our App and its features to you.
• To communicate with you about your account or our services.
• To personalize your experience on our App.
• To improve our App and its features.
• To analyze how users use our App.
                  """,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05),
                    child: Text(
                      "3.How We Disclose Your Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
We may disclose your information in the following circumstances:

• With your consent.
• To comply with legal obligations.
• To enforce our policies.
• To protect our rights, property, or safety or the rights, property, or safety of others.
                      """,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05),
                    child: Text(
                      "4.Children's Privacy",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
Our App is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under the age of 13.
                      """,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05),
                    child: Text(
                      "5.Changes to This Privacy Policy",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.
                      """,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: width * 0.05),
                    child: Text(
                      "6.Contact Us",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: width * 0.05),
                    child: Text(
                      """
If you have any questions or concerns about this Privacy Policy, please contact us at .
                      """,
                      style: TextStyle(fontSize: 16),
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
