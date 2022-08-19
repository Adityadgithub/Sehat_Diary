import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/medicinecard.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getmedicinedata extends StatefulWidget {
  const getmedicinedata({Key? key}) : super(key: key);

  @override
  State<getmedicinedata> createState() => _getmedicinedataState();
}



class _getmedicinedataState extends State<getmedicinedata> {
  var nametest;
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Medicine')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Medicine');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Medicine')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Medicine');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: familymempressed == true
            ? family.snapshots()
            : mainboard.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final services = snapshot.data!.docs;
            List<Widget> servicesWidget = [];
            for (var st in services) {
              final _date = (st.data()! as Map<String, dynamic>)['Date'];
              final _time = (st.data()! as Map<String, dynamic>)['Time'];
              final _medname = (st.data()! as Map<String, dynamic>)['Medname'];
              final _medtype = (st.data()! as Map<String, dynamic>)['MedType'];
              final _quantity =
                  (st.data()! as Map<String, dynamic>)['Quantity'];
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

            double rows = servicesWidget.length / 2;
            if (servicesWidget.length != 0 &&
                servicesWidget.length != 1 &&
                servicesWidget.length % 2 == 0) {
              medwidgetsnum = rows * 180;
            } else if (servicesWidget.length == 1) {
              medwidgetsnum = 180;
            } else if (servicesWidget.length == 0 ||
                servicesWidget.length == null) {
              medwidgetsnum = 1;
            } else {
              medwidgetsnum = (rows + 0.5) * 120;
            }
            if (nametest == null && generaterepo == false)
              return Center(
                  child: Text("Click Add (+) to enter your medicines."));
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
                childAspectRatio: 2 / 1.9,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: servicesWidget,
                shrinkWrap: true,
              );
            }
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
    if (generaterepo == false) {
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
                "Medicine : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$medname",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Type : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$medtype",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Quantity : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$quantity",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "No. of times : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$nooftimes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Frequency : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$freq",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Start Date : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$startdate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "End Date : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$enddate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }
  }
}
