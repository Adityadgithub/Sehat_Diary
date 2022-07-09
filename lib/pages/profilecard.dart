import 'package:flutter/material.dart';

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

class __ProfilecardState extends State<Profilecard> {
  var image;
  var name;

  __ProfilecardState(
    this.image,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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


    );
  }
}
