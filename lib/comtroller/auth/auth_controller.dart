import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final emailController = TextEditingController().obs;
  final emailControllerlogin = TextEditingController().obs;
  final emailControllerforget = TextEditingController().obs;
  // final timefrom = TextEditingControllae
  RxString timefrom = "".obs;
  RxString timeto = "".obs;
  RxString jobType = "".obs;
  RxString searchresult = "".obs;
  RxString tokenforsms = "".obs;

  RxString timefromaddpost = "".obs;
  RxString timetoaddpost = "".obs;

  final profilename = TextEditingController().obs;
  final profileemail = TextEditingController().obs;
  final profilecontact = TextEditingController().obs;
  final profilecontact2 = TextEditingController().obs;
  final profileaddress = TextEditingController().obs;
  final profilecurrentplace = TextEditingController().obs;
  final profileskills = TextEditingController().obs;
  final profiledesc = TextEditingController().obs;
  final profileyear = TextEditingController().obs;
  final profilesalary = TextEditingController().obs;
  // final profilename = TextEditingController().obs;
  //
  //
  // RxString profileemail = "".obs;
  // RxString profilecontact = "".obs;
  // RxString profilecontact2 = "".obs;
  // RxString profileaddress = "".obs;
  // RxString profilecurrentplace = "".obs;
  // RxString profileskills = "".obs;
  // RxString profiledesc = "".obs;
  // RxString profileyear = "".obs;
  // RxString profilesalary = "".obs;


  RxString appliedname = "".obs;
  RxString appliedaddress = "".obs;
  RxString appliedcontact = "".obs;
  RxString appliedreqworker = "".obs;
  RxString appliednoworker = "".obs;
  RxString applieddesc = "".obs;
  RxString appliedjobtype = "".obs;
  RxString appliedsalary = "".obs;
  RxString appliedtimefrom = "".obs;
  RxString appliedtimeto = "".obs;
  RxString appliedemail = "".obs;
  RxString appliedcontactemp= "".obs;
  // RxString appliedname = "".obs;
  // RxString appliedname = "".obs;
  // RxString appliedname = "".obs;
  // RxString appliedname = "".obs;



  RxString timefromeditprofile = "".obs;
  RxString timetoeditprofile = "".obs;

  final employephonenumber = TextEditingController().obs;
}