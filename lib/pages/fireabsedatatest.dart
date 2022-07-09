import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/profilecard.dart';
import 'package:flutter/material.dart';

class Firebasecardtest extends StatefulWidget {
  const Firebasecardtest({Key? key}) : super(key: key);
  @override
  State<Firebasecardtest> createState() => _FirebasecardtestState();
}
var nametest;
class _FirebasecardtestState extends State<Firebasecardtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid.toString()).collection('FamilyMember').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          for (var st in services) {
            final _name = (st.data()! as Map<String, dynamic>)['Name'];
            nametest = _name;
            final datas = buildTile(_name, context);
            servicesWidget.add(datas);
          }
          if(nametest == null)
            return Text("peter");
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

  buildTile(name, BuildContext context) {
    return Profilecard(
      name: name,
    );
  }
}
