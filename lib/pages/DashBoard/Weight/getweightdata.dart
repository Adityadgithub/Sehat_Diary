import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/DashBoard/Weight/weightcard.dart';
import 'package:firebasetut/pages/profilecard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getweightdata extends StatefulWidget {
  const getweightdata({Key? key}) : super(key: key);

  @override
  State<getweightdata> createState() => _getweightdataState();
}

var nametest;

class _getweightdataState extends State<getweightdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(loginas!)
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Weight')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            final _weight =
                (st.data()! as Map<String, dynamic>)['Weight'];
            final _date = (st.data()! as Map<String, dynamic>)['Date'];
            final _time = (st.data()! as Map<String, dynamic>)['Time'];


            nametest = _weight;
            final datas = buildTile(_weight, _date, _time, );
            servicesWidget.add(datas);
          }
          if (nametest == null)
            return Center(
                child: Text("Click Add (+) to enter your Weight."));
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

  buildTile(weight,date,time) {
    return Weightcard(date: date,

      time: time,
      weight: weight,
    );
  }
}
