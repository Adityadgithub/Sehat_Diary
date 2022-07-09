

import 'package:firebasetut/pages/DashBoard/Medicine/getmedicinedata.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:flutter/material.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  var date = DateTime.now();

  final eventitems = ['Before Meal', 'After Meal'];
  var eventselecteditem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Track Medicine",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawerwidgets(drawerusername: universalnamefordrawer),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Track your Medicine here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(height: 25,),
              Expanded(
                  child: getmedicinedata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {

              Navigator.pushNamed(context, 'AddMedicine');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
