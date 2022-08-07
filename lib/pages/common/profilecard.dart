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
            if (image == null)
              CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.person,
                  size: 25,
                ),
              ),
            if (image != null)
              CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  backgroundImage: NetworkImage('$image')),
            SizedBox(height: 20),
            Text('$name'),
          ]),
        ),
        onPressed: () {
          setState(() {});
          familymempressed = true;
          membername = name;
          membersehatid = sehatid;
          Navigator.pushReplacementNamed(context, "Dashboard");
        });
  }
}
