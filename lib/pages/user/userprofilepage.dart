import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:firebasetut/pages/user/userprofilefields.dart';

import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  var FieldImage;
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;
  UserProfilePage({
    this.FieldImage,
    this.Fieldname,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fielddob,
    this.Fieldgender,
    this.Fieldbloodgroup,
    this.Fieldcontactnumber,

  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState(
      FieldImage: FieldImage,
      Fieldname: Fieldname,
      Fieldemail: Fieldemail,
      Fieldpassword: Fieldpassword,
      Fieldcontactnumber: Fieldcontactnumber,
      Fieldbloodgroup:Fieldbloodgroup,
      Fielddob:Fielddob,
      Fieldgender: Fieldgender  );
}

class _UserProfilePageState extends State<UserProfilePage> {
  var FieldImage;
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;
  _UserProfilePageState({
    this.FieldImage,
    this.Fieldname,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fielddob,
    this.Fieldgender,
    this.Fieldbloodgroup,
    this.Fieldcontactnumber,
  });

  // var firestorename;

  var MyName;

  // _fetch() async {

  // }

  getData() async {
    final firebaseuser = await FirebaseAuth.instance.currentUser;
    if (firebaseuser != null) {
      await FirebaseFirestore.instance
          .collection('User').
      doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get()
          .then((ds) =>
      {MyName = (ds.data()!)['Name'], print("Your name : $MyName")})
          .catchError((e) {
        print(e);
      });
    } else {
      return print("Your Name : did not work");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerScrimColor: Colors.black,
        drawer: Drawerwidgets(drawerusername: Fieldname,drawerimage: FieldImage),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("My Profile",
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          // title: FutureBuilder(
          //   future: getData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return Text("My Profile",
          //           style: TextStyle(
          //               color: Colors.blue, fontWeight: FontWeight.bold));
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return UserProfileFields(
                  FieldImage: FieldImage,
                  Fieldname: Fieldname,
                  Fieldemail: Fieldemail,
                  Fieldpassword: Fieldpassword,
                  Fieldcontactnumber: Fieldcontactnumber,
                  Fieldbloodgroup:Fieldbloodgroup,
                  Fielddob:Fielddob,
                  Fieldgender: Fieldgender  );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
