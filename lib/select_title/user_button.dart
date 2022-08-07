import '/select_title/Select_title.dart';
import 'package:flutter/material.dart';

//user button widget
class userbutton extends StatefulWidget {
  const userbutton({Key? key}) : super(key: key);
  @override
  State<userbutton> createState() => _userbuttonState();
}

class _userbuttonState extends State<userbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          loginas = "User";
          await Navigator.pushReplacementNamed(context, "login");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/user3.png")),
            SizedBox(height: 5),
            Text(
              "User",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ));
  }
}
