import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';

import 'package:firebasetut/pages/user/usersignupfields.dart';
import 'package:flutter/material.dart';

class getfamilymemdata extends StatefulWidget {
  const getfamilymemdata({Key? key}) : super(key: key);

  @override
  State<getfamilymemdata> createState() => _getfamilymemdataState();
}

var nametest;

class _getfamilymemdataState extends State<getfamilymemdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            final _sehatid = (st.data()! as Map<String, dynamic>)['SehatId'];
            final _image = (st.data()! as Map<String, dynamic>)['Image'];
            final _name = (st.data()! as Map<String, dynamic>)['Name'];
            final _bloodgrp =
                (st.data()! as Map<String, dynamic>)['Blood Group'];
            final _gender = (st.data()! as Map<String, dynamic>)['Gender'];
            final _relation =
                (st.data()! as Map<String, dynamic>)['Relationship'];
            nametest = _name;

            final datas = buildTile(
                sehatid: _sehatid,
                image: _image,
                name: _name,
                bloodgrp: _bloodgrp,
                gender: _gender,
                relation: _relation);
            servicesWidget.add(datas);
          }
          double rows = servicesWidget.length / 2;
          if (servicesWidget.length != 0 &&
              servicesWidget.length != 1 &&
              servicesWidget.length % 2 == 0) {
            familywidgetsnum = rows * 130;
          } else if (servicesWidget.length == 1) {
            familywidgetsnum = 130;
          } else if (servicesWidget.length == 0 ||
              servicesWidget.length == null) {
            familywidgetsnum = 1;
          } else {
            familywidgetsnum = (rows + 0.5) * 130;
          }
          if (nametest == null)
            return Center(
                child: Text("Click Add (+) to add your family members."));
          if (generaterepo == false)
            return GridView.count(
              crossAxisSpacing: 0,
              mainAxisSpacing: 15,
              clipBehavior: Clip.none,
              crossAxisCount: 2,
              children: servicesWidget,
              shrinkWrap: true,
            );

          if (generaterepo == true)
            return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 0,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 1,
              crossAxisCount: 2,
              children: servicesWidget,
              shrinkWrap: true,
            );
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  buildTile({name, image, sehatid, bloodgrp, gender, relation}) {
    if (generaterepo == false) {
      return Profilecard(name: name, image: image, sehatid: sehatid);
    } else if (generaterepo == true) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                "Name : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Sehat-id : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$sehatid",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Genre : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$relation",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          if (bloodgrp != null)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Text(
                    "Blood group : ",
                    style: TextStyle(color: Colors.cyan[900], fontSize: 14),
                  ),
                  Text(
                    "$bloodgrp",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Gender : ",
                style: TextStyle(color: Colors.cyan[900], fontSize: 14),
              ),
              Text(
                "$gender",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }
  }
}
