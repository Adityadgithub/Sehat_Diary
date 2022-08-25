// Following is the code for Splash Screen that will
// display for 2000 milli second while starting the application.

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //this function will run as the app starts
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  //with a delay of 2000 millisec, the title and logo will appear on the screen.
  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Selecttitle(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(image: AssetImage("assets/images/splashlogo.jpg"))),
    );
  }
}
