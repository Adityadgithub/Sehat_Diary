import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/bpcard.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/getbpdata.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:flutter/material.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
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
            "Blood Pressure",
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
                  child: Text("Track your BloodPressure here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(height: 25,),
              Expanded(child: getbpdata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {

              Navigator.pushNamed(context, 'AddBp');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
