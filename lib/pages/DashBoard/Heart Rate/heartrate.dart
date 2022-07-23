
import 'package:firebasetut/pages/DashBoard/Heart%20Rate/getheartdata.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:flutter/material.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  _HeartRateState createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  var date = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( leading: IconButton(
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
            "Track Heart Rate",
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
                  child: Text("Track your Heart Rate here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(height: 25,),
              Expanded(
                  child: getheartdata(),
              ),]
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {

              Navigator.pushNamed(context, 'AddHeart');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
