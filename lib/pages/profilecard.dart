import 'package:firebasetut/pages/user/addmember/multipleprofile.dart';
import 'package:flutter/material.dart';
var membername;
class Profilecard extends StatefulWidget {
  var image;
  var name;

  Profilecard({
    this.image,
    this.name,
  });

  @override
  State<Profilecard> createState() => __ProfilecardState(
        image,
        name,
      );
}
var familymempressed = false;
class __ProfilecardState extends State<Profilecard> {
  var image;
  var name;

  __ProfilecardState(
    this.image,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.person,
              size: 25,
            ),
          ),
          SizedBox(height: 20),
          Text('$name')
        ]),


      ),
      onPressed: (){
        familymempressed = true;
        membername = name;
      }
    );
  }
}
