import 'dart:io';
import 'dart:async';
import 'package:firebasetut/pages/doctor/doctorsignupfields.dart';
import 'package:firebasetut/pages/user/addmember/addmemsignupfields.dart';
import 'package:firebasetut/pages/user/usersignupfields.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

bool usercreated = false;


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Sign up",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          body:
          loginas == 'Doctor' ? DoctorSignupFields() : UserSignupFields()),
    );
  }
}
