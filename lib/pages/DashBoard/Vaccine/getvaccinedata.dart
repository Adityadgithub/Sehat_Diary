import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/DashBoard/Vaccine/vaccinecard.dart';
import 'package:firebasetut/pages/DashBoard/Weight/weightcard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getvaccinedata extends StatefulWidget {
  const getvaccinedata({Key? key}) : super(key: key);

  @override
  State<getvaccinedata> createState() => _getvaccinedataState();
}

class _getvaccinedataState extends State<getvaccinedata> {
  var nametest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Vaccine')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Vaccine');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Vaccine')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Vaccine');

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
            final _date = (st.data()! as Map<String, dynamic>)['Date'];
            final _time = (st.data()! as Map<String, dynamic>)['Time'];
            final _vaccine_type =
                (st.data()! as Map<String, dynamic>)['Vaccine type'];
            final _vaccine = (st.data()! as Map<String, dynamic>)['Vaccine'];
            final _certificate =
                (st.data()! as Map<String, dynamic>)['Certificate'];

            nametest = _vaccine;
            final datas =
                buildTile(_vaccine_type, _vaccine, _date, _time, _certificate);
            servicesWidget.add(datas);
          }

          double rows = servicesWidget.length / 2;
          if (servicesWidget.length != 0 &&
              servicesWidget.length != 1 &&
              servicesWidget.length % 2 == 0) {
            vaccinewidgetsnum = rows * 100;
          } else if (servicesWidget.length == 1) {
            vaccinewidgetsnum = 100;
          } else if (servicesWidget.length == 0 ||
              servicesWidget.length == null) {
            vaccinewidgetsnum = 1;
          } else {
            vaccinewidgetsnum = (rows + 0.5) * 90;
          }
          if (nametest == null)
            return Center(child: Text("Click Add (+) to enter your Vaccine."));
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

  buildTile(vaccine_type, vaccine, date, time, certificate) {
    if (generaterepo == false) {
      return Vaccinecard(
          date: date,
          time: time,
          vaccine_type: vaccine_type,
          vaccine: vaccine,
          certificate: certificate);
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
                "Catergory : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$vaccine_type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Vaccine : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$vaccine",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }
  }
}
