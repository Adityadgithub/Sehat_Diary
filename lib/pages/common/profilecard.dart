// Following is a blueprint widget to get respective data.
// This widget will be called by Switch Profile page to generate a
// card widget for users.

import 'package:firebasetut/pages/user/addmember/multipleprofile.dart';
import 'package:flutter/material.dart';

var membername;
var membersehatid;

class Profilecard extends StatefulWidget {
  var image;
  var name;
  var sehatid;

  Profilecard({this.image, this.name, this.sehatid});

  @override
  State<Profilecard> createState() => __ProfilecardState(image, name, sehatid);
}

var familymempressed = false;

class __ProfilecardState extends State<Profilecard> {
  var image;
  var name;
  var sehatid;

  __ProfilecardState(this.image, this.name, this.sehatid);

  @override
  Widget build(BuildContext context) {
    // This is a Button which will open dashboard including
    // respective user's data.
    return TextButton(
        child: Container(
          height: 160,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //Profile image widgets for 2 different situations. No image, Uploading image and after uploading image completely.

            //Situation 1 : No image data
            if (image == null)
              CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.person,
                  size: 25,
                ),
              ),

            //Situation 2 : No image data
            if (image != null)
              CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  backgroundImage: NetworkImage('$image')),
            SizedBox(height: 20),

            // Name of user
            Text('$name'),
          ]),
        ),

        //Actions to perform once pressed
        onPressed: () {
          setState(() {});
          familymempressed = true;
          membername = name;
          membersehatid = sehatid;
          Navigator.pushReplacementNamed(context, "Dashboard");
        });
  }
}
