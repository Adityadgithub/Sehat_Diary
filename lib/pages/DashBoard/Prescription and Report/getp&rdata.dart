import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/DashBoard/Prescription%20and%20Report/p&rcard.dart';
import 'package:firebasetut/pages/DashBoard/Weight/weightcard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getpnrdata extends StatefulWidget {
  const getpnrdata({Key? key}) : super(key: key);

  @override
  State<getpnrdata> createState() => _getpnrdataState();
}

class _getpnrdataState extends State<getpnrdata> {
  var nametest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('PnR')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('PnR');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('PnR')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('PnR');

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
            final _docname =
                (st.data()! as Map<String, dynamic>)["Doctor's Name"];
            final _docmobile =
                (st.data()! as Map<String, dynamic>)["Doctor's Mobile"];
            final _pres = (st.data()! as Map<String, dynamic>)['Prescription'];
            final _report = (st.data()! as Map<String, dynamic>)['Report'];

            nametest = _docname;
            final datas = buildTile(
              docname: _docname,
              docmobile: _docmobile,
              pres: _pres,
              report: _report,
              date: _date,
              time: _time,
            );
            servicesWidget.add(datas);
          }
          if (nametest == null)
            return Center(child: Text("Click Add (+) to upload documents."));
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

  buildTile({
    docname,
    docmobile,
    pres,
    report,
    date,
    time,
  }) {
    return PnRcard(
      date: date,
      time: time,
      report: report,
      pres: pres,
      docmobile: docmobile,
      docname: docname,
      // weight: weight,
    );
  }
}
