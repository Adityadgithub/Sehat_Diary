import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/medicinecard.dart';
import 'package:firebasetut/pages/profilecard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getmedicinedata extends StatefulWidget {
  const getmedicinedata({Key? key}) : super(key: key);

  @override
  State<getmedicinedata> createState() => _getmedicinedataState();
}

var nametest;

class _getmedicinedataState extends State<getmedicinedata> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(loginas!)
            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .collection('MainUser')
            .doc('Dashboard')
            .collection('Medicine')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final services = snapshot.data!.docs;
            List<Widget> servicesWidget = [];
            for (var st in services) {

              final _date = (st.data()! as Map<String, dynamic>)['Date'];
              final _time = (st.data()! as Map<String, dynamic>)['Time'];
              final _medname = (st.data()! as Map<String, dynamic>)['Medname'];
              final _medtype = (st.data()! as Map<String, dynamic>)['MedType'];
              final _quantity = (st.data()! as Map<String, dynamic>)['Quantity'];
              final _nooftimes =
                  (st.data()! as Map<String, dynamic>)['No. of times'];
              final _freq = (st.data()! as Map<String, dynamic>)['Frequncy'];
              final _startdate =
                  (st.data()! as Map<String, dynamic>)['Start Date'];
              final _enddate = (st.data()! as Map<String, dynamic>)['End Date'];

              nametest = _medname;
              final datas = buildTile(
                  date: _date,
                  time: _time,
                  medname: _medname,
                  medtype: _medtype,
                  quantity: _quantity,
                  nooftimes: _nooftimes,
                  freq: _freq,
                  startdate: _startdate,
                  enddate: _enddate);
              servicesWidget.add(datas);
            }
            if (nametest == null)
              return Center(
                  child: Text("Click Add (+) to enter your medicines."));
            return ListView(
              clipBehavior: Clip.none,
              children: servicesWidget,
              shrinkWrap: true,
            );
          }
          return Center(child: CircularProgressIndicator.adaptive());
        },
      )),
    );
  }

  buildTile({
    medname,
    medtype,
    quantity,
    nooftimes,
    freq,
    startdate,
    enddate,
    date,
    time,
  }) {
    return Medicinecard(
        date: date,
        time: time,
        medname: medname,
        medtype: medtype,
        quantity: quantity,
        nooftimes: nooftimes,
        freq: freq,
        startdate: startdate,
        enddate: enddate);
  }
}
