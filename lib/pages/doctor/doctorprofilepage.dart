import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/doctor/doctorprofilefields.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:flutter/material.dart';

class doctorprofilepage extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerScrimColor: Colors.black,
        drawer: Drawerwidgets(drawerusername: FieldName),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("My Profile",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),

        ),
        body: FutureBuilder(

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return DoctorProfileFields(
                  FieldName: FieldName,
                  Fieldaddress: Fieldaddress,
                  Fieldcontactnumber: Fieldcontactnumber,
                  Fielddegree: Fielddegree,
                  Fieldemail: Fieldemail,
                  Fieldhospitalname: Fieldhospitalname,
                  Fieldlicensenum: Fieldlicensenum,
                  Fieldpassword: Fieldpassword,
                  Fieldspeciality: Fieldspeciality);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
