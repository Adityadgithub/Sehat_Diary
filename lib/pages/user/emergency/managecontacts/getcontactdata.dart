import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Add_Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/sugarcard.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebasetut/pages/user/addmember/multipleprofile.dart';
import 'package:firebasetut/pages/user/emergency/emergency.dart';
import 'package:firebasetut/pages/user/emergency/managecontacts/contactcard.dart';
import 'package:firebasetut/pages/user/userprofilefields.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class getcontactdata extends StatefulWidget {
  const getcontactdata({Key? key}) : super(key: key);

  @override
  State<getcontactdata> createState() => getcontactdataState();
}

class getcontactdataState extends State<getcontactdata> {
  var contacttest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(usersehatidafterlogin)
          .collection('MainUser')
          .doc('emergency')
          .collection('contacts')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          recipents = [];
          contacttest = recipents;
          for (var st in services) {
            final _contactname =
                (st.data()! as Map<String, dynamic>)['contactname'];
            final _contactnum =
                (st.data()! as Map<String, dynamic>)['contactnum'];

            contacttest = _contactname;
            final datas = buildTile(_contactname, _contactnum);
            servicesWidget.add(datas);
            recipents.add(_contactnum);
          }
          if (contacttest == null)
            return Center(child: Text("Click Add (+) to add SOS contacts."));
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

  buildTile(_contactname, _contactnum) {
    return contactcard(contactname: _contactname, contactnum: _contactnum);
  }
}
