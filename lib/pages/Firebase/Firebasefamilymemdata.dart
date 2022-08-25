// Following code is responsible to Fetch data of family members.

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

        //Widget to - Connect to firebase with assigned location and fetch the respected data.
        body: StreamBuilder<QuerySnapshot>(
      //Data locations
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .snapshots(),
      builder: (context, snapshot) {
        //check connection
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            //Sehat-id
            final _sehatid = (st.data()! as Map<String, dynamic>)['SehatId'];

            //check connection
            final _image = (st.data()! as Map<String, dynamic>)['Image'];

            //name
            final _name = (st.data()! as Map<String, dynamic>)['Name'];

            //BloodGroup
            final _bloodgrp =
                (st.data()! as Map<String, dynamic>)['Blood Group'];

            //Gender
            final _gender = (st.data()! as Map<String, dynamic>)['Gender'];

            //Relation with Main User.
            final _relation =
                (st.data()! as Map<String, dynamic>)['Relationship'];
            nametest = _name;

            // assigning function call with all data as arguments.
            final datas = buildTile(
                sehatid: _sehatid,
                image: _image,
                name: _name,
                bloodgrp: _bloodgrp,
                gender: _gender,
                relation: _relation);
            servicesWidget.add(datas);
          }

          // Assigning Height for the BoxContraint to be
          // used in Generate Report page

          // Calculating the number of rows that the
          // fetched data will produce.
          double rows = servicesWidget.length / 2;

          // If there is data of 2 or more family member but in even series
          // then height will be simply multiplied by number of
          // rows.
          if (servicesWidget.length != 0 &&
              servicesWidget.length != 1 &&
              servicesWidget.length % 2 == 0) {
            familywidgetsnum = rows * 130;
          }
          //  If there's data of only 1 famility member then
          //  height for 1 row will assign (130).
          else if (servicesWidget.length == 1) {
            familywidgetsnum = 130;
          }
          // If theres's no data available, height will set to 1.
          else if (servicesWidget.length == 0 ||
              servicesWidget.length == null) {
            familywidgetsnum = 1;
          }

          // If there is data of 2 or more family member but in even series
          // then height will be simply multiplied by number of
          // rows.
          else {
            familywidgetsnum = (rows + 0.5) * 130;
          }

          // If there's no data added then this Text will be displayed
          if (nametest == null)
            return Center(
                child: Text("Click Add (+) to add your family members."));

          // If this classed is not called by Generate Report
          // and is called by switch profile page,
          // then it will create gridview with respective values
          if (generaterepo == false)
            return GridView.count(
              crossAxisSpacing: 0,
              mainAxisSpacing: 15,
              clipBehavior: Clip.none,
              crossAxisCount: 2,
              children: servicesWidget,
              shrinkWrap: true,
            );

          // If this classed is called by Generate Report
          // then it will create gridview with respective values
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

        // If connection is not established with firebase
        // a progress indicator will be displayed
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  //Function to - either call Profilecard and pass data as arguments.
  // or Build a Widget with all data to be displayed in generate report.
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
