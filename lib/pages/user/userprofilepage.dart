//Following code is responsible to fetch and display user's credentilas respectively.

import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/common/drawerwidgets.dart';

import 'package:firebasetut/pages/user/userprofilefields.dart';

import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  var FieldImage;
  var Fieldsehatid;
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;
  UserProfilePage({
    this.FieldImage,
    this.Fieldsehatid,
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
      Fieldsehatid: Fieldsehatid,
      Fieldname: Fieldname,
      Fieldemail: Fieldemail,
      Fieldpassword: Fieldpassword,
      Fieldcontactnumber: Fieldcontactnumber,
      Fieldbloodgroup: Fieldbloodgroup,
      Fielddob: Fielddob,
      Fieldgender: Fieldgender);
}

class _UserProfilePageState extends State<UserProfilePage> {
  var FieldImage;
  var Fieldsehatid;
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;
  _UserProfilePageState({
    this.FieldImage,
    this.Fieldsehatid,
    this.Fieldname,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fielddob,
    this.Fieldgender,
    this.Fieldbloodgroup,
    this.Fieldcontactnumber,
  });

  var MyName;

  //Function to - Ensure Connection with Firebase, and support FutureBuilder.
  getData() async {
    final firebaseuser = await FirebaseAuth.instance.currentUser;
    if (firebaseuser != null) {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
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
        drawer:
            Drawerwidgets(drawerusername: Fieldname, drawerimage: FieldImage),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("My Profile",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //This will Call the mentioned widget while sending all the values as Arguments.
              return UserProfileFields(
                  FieldImage: FieldImage,
                  Fieldsehatid: Fieldsehatid,
                  Fieldname: Fieldname,
                  Fieldemail: Fieldemail,
                  Fieldpassword: Fieldpassword,
                  Fieldcontactnumber: Fieldcontactnumber,
                  Fieldbloodgroup: Fieldbloodgroup,
                  Fielddob: Fielddob,
                  Fieldgender: Fieldgender);
            }

            //If the connection is not yet made then a progress indicator will be shown.
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
