import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/bpcard.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getbpdata extends StatefulWidget {
  const getbpdata({Key? key}) : super(key: key);

  @override
  State<getbpdata> createState() => _getbpdataState();
}

class _getbpdataState extends State<getbpdata> {
  var nulltest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Bp')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Bp');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Bp')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Bp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream:
          familymempressed == true ? family.snapshots() : mainboard.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            final _systolic = (st.data()! as Map<String, dynamic>)['Systolic'];
            final _diastolic =
                (st.data()! as Map<String, dynamic>)['Diastolic'];
            final _pulse = (st.data()! as Map<String, dynamic>)['Pulse'];
            final _date = (st.data()! as Map<String, dynamic>)['Date'];
            final _time = (st.data()! as Map<String, dynamic>)['Time'];

            nulltest = _date;

            final datas = buildTile(
              _systolic,
              _diastolic,
              _pulse,
              _date,
              _time,
            );
            servicesWidget.add(datas);
          }

          double rows = servicesWidget.length / 2;
          if (servicesWidget.length != 0 &&
              servicesWidget.length != 1 &&
              servicesWidget.length % 2 == 0) {
            bpwidgetsnum = rows * 120;
          } else if (servicesWidget.length == 1) {
            bpwidgetsnum = 120;
          } else if (servicesWidget.length == 0 ||
              servicesWidget.length == null) {
            bpwidgetsnum = 1;
          } else {
            bpwidgetsnum = (rows + 0.5) * 120;
          }
          if (nulltest == null && generaterepo == false)
            return Center(
                child: Text("Click Add (+) to enter your sugar levels."));
          if (generaterepo == false) {
            return ListView(
              clipBehavior: Clip.antiAlias,
              children: servicesWidget,
              shrinkWrap: true,
            );
          } else {
            return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 0,
              childAspectRatio: 2 / 1.3,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: servicesWidget,
              shrinkWrap: true,
            );
          }
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  buildTile(
    systolic,
    diastolic,
    pulse,
    date,
    time,
  ) {
    // return bpcard(
    //   systolic: systolic,
    //   diastolic: diastolic,
    //   pulse: pulse,
    //   date: date,
    //   time: time,
    // );
    if (generaterepo == false) {
      return bpcard(
        systolic: systolic,
        diastolic: diastolic,
        pulse: pulse,
        date: date,
        time: time,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$date",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "$time",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "Systolic : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$systolic mmHg",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Diastolic : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$diastolic mmHg",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Pulse : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$pulse bpm",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }
  }
}
