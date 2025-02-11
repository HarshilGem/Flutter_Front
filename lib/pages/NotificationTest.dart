import 'package:flutter/material.dart';
 class NotificationTest extends StatefulWidget {
   const NotificationTest({Key? key}) : super(key: key);
 
   @override
   State<NotificationTest> createState() => _NotificationTestState();
 }

 String msg = "";


 class _NotificationTestState extends State<NotificationTest> {
   @override
   void changeDependencies(){
     super.didChangeDependencies();
     final argumants = ModalRoute.of(context)!.settings.arguments;
     if(argumants!=null){
       Map? pushArgumants = argumants as Map;
       setState((){
         msg = pushArgumants["msg"];
       });
     }
   }
   @override
   Widget build(BuildContext context) {
     return SafeArea(child: Scaffold(
       body: Center(
         child: Container(
           child: Text("push msg: $msg" )
         ),
       ),

     ));
   }
 }
 