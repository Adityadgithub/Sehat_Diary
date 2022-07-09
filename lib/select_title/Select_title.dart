
import '/select_title/doctor_button.dart';
import '/select_title/user_button.dart';
import 'package:flutter/material.dart';


  String? loginas;

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
