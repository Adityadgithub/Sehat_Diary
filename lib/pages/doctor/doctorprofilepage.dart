//Following code is responsible to fetch and display doctor's credentilas respectively.

import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/common/drawerwidgets.dart';
import 'package:firebasetut/pages/doctor/doctorprofilefields.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class doctorprofilepage extends StatefulWidget {
  var FieldImage;
  var FieldName;
  var Fieldemail;
  var Fieldpassword;
  var Fieldhospitalname;
  var Fieldspeciality;
  var Fielddegree;
  var Fieldaddress;
  var Fieldcontactnumber;
  var Fieldlicensenum;

  doctorprofilepage({
    this.FieldImage,
    this.FieldName,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fieldhospitalname,
    this.Fieldspeciality,
    this.Fielddegree,
    this.Fieldaddress,
    this.Fieldcontactnumber,
    this.Fieldlicensenum,
  });

  @override
  State<doctorprofilepage> createState() => _doctorprofilepageState(
      FieldImage: FieldImage,
      FieldName: FieldName,
      Fieldaddress: Fieldaddress,
      Fieldcontactnumber: Fieldcontactnumber,
      Fielddegree: Fielddegree,
      Fieldemail: Fieldemail,
      Fieldhospitalname: Fieldhospitalname,
      Fieldlicensenum: Fieldlicensenum,
      Fieldpassword: Fieldpassword,
      Fieldspeciality: Fieldspeciality);
}

class _doctorprofilepageState extends State<doctorprofilepage> {
  var FieldImage;
  var FieldName;
  var Fieldemail;
  var Fieldpassword;
  var Fieldhospitalname;
  var Fieldspeciality;
  var Fielddegree;
  var Fieldaddress;
  var Fieldcontactnumber;
  var Fieldlicensenum;

  _doctorprofilepageState({
    this.FieldImage,
    this.FieldName,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fieldhospitalname,
    this.Fieldspeciality,
    this.Fielddegree,
    this.Fieldaddress,
    this.Fieldcontactnumber,
    this.Fieldlicensenum,
  });

  var MyName;
  //Function to - Ensure Connection with Firebase, and support FutureBuilder.
  getData() async {
    final firebaseuser = await FirebaseAuth.instance.currentUser;
    if (firebaseuser != null) {
      await FirebaseFirestore.instance
          .collection(loginas!)
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
            Drawerwidgets(drawerusername: FieldName, drawerimage: FieldImage),
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
              return DoctorProfileFields(
                  FieldImage: FieldImage,
                  FieldName: FieldName,
                  Fieldaddress: Fieldaddress,
                  Fieldcontactnumber: Fieldcontactnumber,
                  Fielddegree: Fielddegree,
                  Fieldemail: Fieldemail,
                  Fieldhospitalname: Fieldhospitalname,
                  Fieldlicensenum: Fieldlicensenum,
                  Fieldpassword: Fieldpassword,
                  Fieldspeciality: Fieldspeciality);
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
