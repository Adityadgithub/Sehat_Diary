import 'package:flutter/material.dart';

class Insurancecard extends StatefulWidget {
  var name;
  var logo;
  num logosize;
  Insurancecard({this.logo, this.name, required this.logosize});

  @override
  State<Insurancecard> createState() =>
      _InsurancecardState(logo: logo, name: name, logosize: logosize);
}

class _InsurancecardState extends State<Insurancecard> {
  var name;
  var logo;
  num logosize;

  _InsurancecardState({this.logo, this.name, required this.logosize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 175,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("${name}insurance");
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(children: [
            CircleAvatar(
              radius: 31,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Container(
                    width: logosize.toDouble(),
                    child: Image(image: AssetImage("$logo"))),
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
                width: 80,
                child: Expanded(
                    child: Text(
                  "$name Insurance",
                  style: TextStyle(color: Colors.black),
                )))
          ]),
        ),
      ),
    );
  }
}
