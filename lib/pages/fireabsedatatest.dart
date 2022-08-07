import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
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
          .doc(sehatid)
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
            nametest = _name;

            final datas =
                buildTile(sehatid: _sehatid, image: _image, name: _name);
            servicesWidget.add(datas);
          }
          if (nametest == null)
            return Center(
                child: Text("Click Add (+) to add your family members."));
          return GridView.count(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            clipBehavior: Clip.none,
            crossAxisCount: 2,
            children: servicesWidget,
            shrinkWrap: true,
          );
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  buildTile({name, image, sehatid}) {
    return Profilecard(name: name, image: image, sehatid: sehatid);
  }
}
