import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/bpcard.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/profilecard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getbpdata extends StatefulWidget {
  const getbpdata({Key? key}) : super(key: key);

  @override
  State<getbpdata> createState() => _getbpdataState();
}

class _getbpdataState extends State<getbpdata> {
  var nulltest;
  var mainboard = FirebaseFirestore.instance
      .collection(loginas!)
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .collection('MainUser')
      .doc('Dashboard')
      .collection('Bp');

  var family = FirebaseFirestore.instance
      .collection('User')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Family member')
      .doc(membername)
      .collection('Dashboard').doc('path').collection('Bp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: familymempressed == true? family.snapshots():mainboard.snapshots(),
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

            nulltest = _systolic;
            final datas = buildTile(
              _systolic,
              _diastolic,
              _pulse,
              _date,
              _time,
            );
            servicesWidget.add(datas);
          }
          if (nulltest == null)
            return Center(
                child: Text("Click Add (+) to enter your sugar levels."));
          return
            ListView(
            clipBehavior: Clip.none,
            children: servicesWidget,
            shrinkWrap: true,
          );
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
    return bpcard(
      systolic: systolic,
      diastolic: diastolic,
      pulse: pulse,
      date: date,
      time: time,
    );
  }
}
