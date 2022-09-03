import 'package:firebasetut/pages/DashBoard/Allergies/Add_Allergies.dart';
import 'package:firebasetut/pages/DashBoard/Allergies/getallergiesdata.dart';
import 'package:flutter/material.dart';

class Allergy extends StatefulWidget {
  const Allergy({Key? key}) : super(key: key);

  @override
  _AllergyState createState() => _AllergyState();
}

class _AllergyState extends State<Allergy> {
  var date = DateTime.now();

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
            "Track Allergies",
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
                  child: Text("Track your Allergies here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(child: getallergydata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AddAllergy');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
