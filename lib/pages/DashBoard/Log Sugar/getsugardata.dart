import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Add_Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';

import 'package:firebase_auth/firebase_auth.dart';
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

  var family = doctoraccessgetusersehatid == null?
  FirebaseFirestore.instance
      .collection('User')
      .doc(universalsehatid)
      .collection('Family member')
      .doc(membername)
      .collection('Dashboard')
      .doc('path')
      .collection('Sugar'):
  FirebaseFirestore.instance
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
          if (nametest == null)
            return Center(
                child: Text("Click Add (+) to enter your sugar levels."));
          return ListView(
            clipBehavior: Clip.none,
            children: servicesWidget,
            shrinkWrap: true,
          );
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  buildTile(_sugarlvl, _date, _time, _event, BuildContext context) {
    return Sugarcard(
      date: _date,
      event: _event,
      time: _time,
      sugarlvl: _sugarlvl,
    );
  }
}
