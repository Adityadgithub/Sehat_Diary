import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Add_Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/pages/user/addmember/multipleprofile.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getsugardata extends StatefulWidget {
  const getsugardata({Key? key}) : super(key: key);

  @override
  State<getsugardata> createState() => _getsugardataState();
}

class _getsugardataState extends State<getsugardata> {
  var nametest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Sugar')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Sugar');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Sugar')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Sugar');

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
            final _sugarlvl =
                (st.data()! as Map<String, dynamic>)['Sugar Level'];
            final _date = (st.data()! as Map<String, dynamic>)['Date'];
            final _time = (st.data()! as Map<String, dynamic>)['Time'];
            final _event = (st.data()! as Map<String, dynamic>)['Event'];

            nametest = _sugarlvl;
            final datas = buildTile(_sugarlvl, _date, _time, _event, context);
            servicesWidget.add(datas);
          }
          double rows = servicesWidget.length / 2;
          if (servicesWidget.length != 0 &&
              servicesWidget.length != 1 &&
              servicesWidget.length % 2 == 0) {
            sugarwidgetsnum = rows * 100;
          } else if (servicesWidget.length == 1) {
            sugarwidgetsnum = 100;
          } else if (servicesWidget.length == 0 ||
              servicesWidget.length == null) {
            sugarwidgetsnum = 1;
          } else {
            sugarwidgetsnum = (rows + 0.5) * 90;
          }
          if (nametest == null)
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
              childAspectRatio: 2 / 0.9,
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

  buildTile(_sugarlvl, date, time, event, BuildContext context) {
    if (generaterepo == false) {
      return Sugarcard(
        date: date,
        event: event,
        time: time,
        sugarlvl: _sugarlvl,
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
                "Event : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$event",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Sugar : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$_sugarlvl mg/dL",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }
  }
}
