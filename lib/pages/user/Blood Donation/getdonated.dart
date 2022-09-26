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
import 'package:firebasetut/pages/user/Blood%20Donation/bdcard.dart';
import 'package:firebasetut/pages/user/Blood%20Donation/donatedcard.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getdonated extends StatefulWidget {
  const getdonated({Key? key}) : super(key: key);

  @override
  State<getdonated> createState() => _getdonatedState();
}

class _getdonatedState extends State<getdonated> {
  var nulltest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance.collection('Blood Donation')
      : FirebaseFirestore.instance.collection('Blood Donation');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance.collection('Blood Donation')
      : FirebaseFirestore.instance.collection('Blood Donation');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Blood Donation')
          .doc('path')
          .collection('donation')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            final _date = (st.data()! as Map<String, dynamic>)['Date'];
            final _time = (st.data()! as Map<String, dynamic>)['Time'];
            final _patientname =
                (st.data()! as Map<String, dynamic>)['Patient Name'];
            final _patientcontact =
                (st.data()! as Map<String, dynamic>)['Patient contact'];
            final _patientage =
                (st.data()! as Map<String, dynamic>)['Patient Age'];
            final _bloodgrp =
                (st.data()! as Map<String, dynamic>)['Blood Group'];
            // final _liter = (st.data()! as Map<String, dynamic>)['Liter'];
            // final _requireddate =
            //     (st.data()! as Map<String, dynamic>)['Required Date'];

            final _address = (st.data()! as Map<String, dynamic>)['Address'];

            nulltest = _date;

            final datas = buildTile(
              patientname: _patientname,
              patientcontact: _patientcontact,
              patientage: _patientage,
              bloodgrp: _bloodgrp,

              address: _address,
              // requireddate: _requireddate,
              // locationtype: _locationtype,
              date: _date,
              time: _time,
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
                child: SizedBox(
              width: 200,
              child: Text(
                "No Requests for Donation yet, Click Add (+) to post your donation request.",
                style: TextStyle(color: Colors.grey),
              ),
            ));
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

  buildTile({
    patientname,
    patientcontact,
    patientage,
    bloodgrp,
    address,
    date,
    time,
  }) {
    // return bpcard(
    //   systolic: systolic,
    //   diastolic: diastolic,
    //   pulse: pulse,
    //   date: date,
    //   time: time,
    // );
    if (generaterepo == false) {
      return donatedcard(
        address: address,
        bloodgrp: bloodgrp,
        patientage: patientage,
        patientcontact: patientcontact,
        patientname: patientname,
        time: time,
        date: date,
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
              // Text(
              //   "$systolic mmHg",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              // ),
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
              // Text(
              //   "$diastolic mmHg",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              // ),
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
              // Text(
              //   "$pulse bpm",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              // ),
            ],
          ),
        ],
      );
    }
  }
}
