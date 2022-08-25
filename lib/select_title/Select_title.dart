// Following code is a parent widget to call User Button and Doctor Button Widgets

import '/select_title/doctor_button.dart';
import '/select_title/user_button.dart';
import 'package:flutter/material.dart';

//Global variable for Login As to customise the app accordingly
String? loginas;

//common widget for user and doctor buttons
class Selecttitle extends StatefulWidget {
  const Selecttitle({Key? key}) : super(key: key);
  @override
  State<Selecttitle> createState() => _SelecttitleState();
}

class _SelecttitleState extends State<Selecttitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          userbutton(),
          SizedBox(height: 50),
          doctorbutton(),
        ]),
      ),
    );
  }
}
