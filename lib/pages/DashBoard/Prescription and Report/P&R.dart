import 'package:firebasetut/pages/DashBoard/Prescription%20and%20Report/getp&rdata.dart';
import 'package:firebasetut/pages/DashBoard/Weight/getweightdata.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:flutter/material.dart';

class PNR extends StatefulWidget {
  const PNR({Key? key}) : super(key: key);

  @override
  _PNRState createState() => _PNRState();
}

class _PNRState extends State<PNR> {
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
            "Track Documents",
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
                  child: Text("Track your Prescription and Report here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(child: getpnrdata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AddPnR');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
