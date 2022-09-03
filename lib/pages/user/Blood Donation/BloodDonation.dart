import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/bpcard.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/getbpdata.dart';
import 'package:firebasetut/pages/user/Blood%20Donation/getbdreqdata.dart';

import 'package:flutter/material.dart';

class BloodDonation extends StatefulWidget {
  const BloodDonation({Key? key}) : super(key: key);

  @override
  _BloodDonationState createState() => _BloodDonationState();
}

class _BloodDonationState extends State<BloodDonation> {
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Firebasecard');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Blood Donation",
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
                  child: Text("Requests for Donation",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(child: getbddata()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AddBd');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
