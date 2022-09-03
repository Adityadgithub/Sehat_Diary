// Following is a common code to call Signup fields of either
// user or doctor.

import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:firebasetut/pages/doctor/doctorsignupfields.dart';
import 'package:firebasetut/pages/user/addmember/addmemsignupfields.dart';
import 'package:firebasetut/pages/user/usersignupfields.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

//Sign up page Widget
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:
              //signup fields will show accroding to the value of 'loginas' defined in Select title page.
              loginas == 'Doctor' ? DoctorSignupFields() : UserSignupFields()),
    );
  }
}
