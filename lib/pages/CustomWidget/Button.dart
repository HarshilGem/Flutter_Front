import 'package:flutter/material.dart';
import 'package:test_logo/pages/Home_Industry2.dart';
class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  bool isLoading = false;
  moveToHome(BuildContext context) async{
    setState(() {
      isLoading = true;
    }
    );
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isLoading = false;
    }
    );
    (isLoading)
        ? Center(
        child: CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 1.5,
        ))
        :await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_Industry2(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async => moveToHome(context),
        child: Center(
              child: Padding(
              padding: const EdgeInsets.only(top: 500.0),
              child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff00A868)
              ),
              child: Center(
                child: Text("Sign Up", style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

