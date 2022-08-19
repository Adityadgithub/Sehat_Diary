import 'package:firebasetut/pages/DashBoard/Vaccine/getVaccinedata.dart';

import 'package:flutter/material.dart';

class Vaccine extends StatefulWidget {
  const Vaccine({Key? key}) : super(key: key);

  @override
  _VaccineState createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  var date = DateTime.now();

  final eventitems = ['Before Meal', 'After Meal'];
  var eventselecteditem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Dashboard');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Track Vaccine",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Track your Vaccine here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(child: getvaccinedata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AddVaccine');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
