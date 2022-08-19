import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/DashBoard/Weight/weightcard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getweightdata extends StatefulWidget {
  const getweightdata({Key? key}) : super(key: key);

  @override
  State<getweightdata> createState() => _getweightdataState();
}

class _getweightdataState extends State<getweightdata> {
  var nulltest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Weight')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Weight');
  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Weight')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Weight');

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
            final _weight = (st.data()! as Map<String, dynamic>)['Weight'];
            final _date = (st.data()! as Map<String, dynamic>)['Date'];
            final _time = (st.data()! as Map<String, dynamic>)['Time'];

            nulltest = _date;
            final datas = buildTile(
              _weight,
              _date,
              _time,
            );
            servicesWidget.add(datas);
          }
          double rows = servicesWidget.length / 2;
          if (servicesWidget.length != 0 &&
              servicesWidget.length != 1 &&
              servicesWidget.length % 2 == 0) {
            weightwidgetsnum = rows * 80;
          } else if (servicesWidget.length == 1) {
            weightwidgetsnum = 80;
          } else if (servicesWidget.length == 0 ||
              servicesWidget.length == null) {
            weightwidgetsnum = 1;
          } else {
            weightwidgetsnum = (rows + 0.5) * 80;
          }
          if (nulltest == null) {
            return Center(child: Text("Click Add (+) to enter your Weight."));
          }
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
              childAspectRatio: 2 / 0.7,
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

  buildTile(weight, date, time) {
    if (generaterepo == false) {
      return Weightcard(
        date: date,
        time: time,
        weight: weight,
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
                "Weight : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$weight Kg",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }
  }
}
