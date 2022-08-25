//Following code is resposible to Fetch all the data which was stored while signup.

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/common/login.dart';
import 'package:firebasetut/pages/doctor/doctorprofilepage.dart';

import 'package:firebasetut/pages/user/userprofilefields.dart';
import 'package:firebasetut/pages/user/userprofilepage.dart';
import 'package:firebasetut/pages/user/usersignupfields.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';

class Firebasecard extends StatefulWidget {
  const Firebasecard({Key? key}) : super(key: key);

  @override
  State<Firebasecard> createState() => _FirebasecardState();
}

//These variables conatain the same data but will be used in different global widgets,
//this makes it easier to get data without calling the class again.
var universalimagefordrawer;
var universalnamefordrawer;
var universalsehatid;
var universalcontactnumber;
var universaldob;
var universalemail;
var universalbloodgrp;
var universalgender;

class _FirebasecardState extends State<Firebasecard> {
  var datas;

  //Data locations
  //for doctor
  var doctordata = FirebaseFirestore.instance
      .collection(loginas!)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('MainUser');
  //for user
  var userdata = loginpressed == false
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(sehatid)
          .collection('MainUser')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('MainUser');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //Widget to - Connect to firebase with assigned location and fetch the respected data.
        body: StreamBuilder<QuerySnapshot>(
      //assign location according to loginas condition
      stream: loginas == 'User' ? userdata.snapshots() : doctordata.snapshots(),

      builder: (context, snapshot) {
        //check connection
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];

          //fetch data for doctor
          if (loginas == 'Doctor') {
            for (var st in services) {
              //profile photo
              final _image = (st.data()! as Map<String, dynamic>)['Image'];

              //name
              final _name = (st.data()! as Map<String, dynamic>)['Name'];

              //Email address
              final _email = (st.data()! as Map<String, dynamic>)['Email'];

              //Password
              final _password =
                  (st.data()! as Map<String, dynamic>)['password'];

              //Hospital Name
              final _hospitalname =
                  (st.data()! as Map<String, dynamic>)['Hospital Name'];

              //Speciality
              final _speciality =
                  (st.data()! as Map<String, dynamic>)['Speciality'];

              //Degree
              final _degree = (st.data()! as Map<String, dynamic>)['Degree'];

              //Address
              final _address = (st.data()! as Map<String, dynamic>)['Address'];

              //Contact Number
              final _contactnumber =
                  (st.data()! as Map<String, dynamic>)['Contact Number'];

              //License number
              final _licensenum =
                  (st.data()! as Map<String, dynamic>)['License Number'];

              //assign values
              universalnamefordrawer = _name;
              universalimagefordrawer = _image;
              print(_name);

              // assigning function call with all data as arguments.
              datas = builddoctorpage(
                image: _image,
                name: _name,
                email: _email,
                password: _password,
                hospitalname: _hospitalname,
                speciality: _speciality,
                degree: _degree,
                address: _address,
                contactnumber: _contactnumber,
                licensenum: _licensenum,
              );
            }
            servicesWidget.add(datas);
          }

          //Fetch data for User
          else if (loginas == 'User') {
            for (var st in services) {
              //profile photo
              final _image = (st.data()! as Map<String, dynamic>)['Image'];
              final _sehatid = (st.data()! as Map<String, dynamic>)['SehatId'];

              //name
              final _name = (st.data()! as Map<String, dynamic>)['Name'];

              //Email address
              final _email = (st.data()! as Map<String, dynamic>)['Email'];

              //Password
              final _password =
                  (st.data()! as Map<String, dynamic>)['Password'];

              //Contact number
              final _contactnumber =
                  (st.data()! as Map<String, dynamic>)['Contact Number'];

              //date of birth
              final _dob = (st.data()! as Map<String, dynamic>)['Dob'];

              //Gender
              final _gender = (st.data()! as Map<String, dynamic>)['Gender'];

              //BloodGroup
              final _bloodgroup =
                  (st.data()! as Map<String, dynamic>)['Blood Group'];
              universalnamefordrawer = _name;
              universalimagefordrawer = _image;
              universalsehatid = _sehatid;
              universalcontactnumber = _contactnumber;
              universalemail = _email;
              universaldob = _dob;
              universalgender = _gender;
              universalbloodgrp = _bloodgroup;

              // assigning function call with all data as arguments.
              datas = builduserpage(
                _image,
                _sehatid,
                _name,
                _email,
                _password,
                _contactnumber,
                _dob,
                _gender,
                _bloodgroup,
              );
            }
            servicesWidget.add(datas);
          }
          return datas;
        }
        return Center(child: CircularProgressIndicator.adaptive());
      },
    ));
  }

  //Function to - call doctorprofilepage and pass data as arguments.
  builddoctorpage({
    image,
    name,
    email,
    password,
    contactnumber,
    hospitalname,
    speciality,
    degree,
    address,
    licensenum,
  }) {
    return doctorprofilepage(
      FieldImage: image,
      FieldName: name,
      Fieldemail: email,
      Fieldpassword: password,
      Fieldhospitalname: hospitalname,
      Fieldspeciality: speciality,
      Fielddegree: degree,
      Fieldaddress: address,
      Fieldcontactnumber: contactnumber,
      Fieldlicensenum: licensenum,
    );
  }

  //Function to - call UserProfilePage and pass data as arguments.
  builduserpage(
    image,
    sehatid,
    name,
    email,
    password,
    contactnumber,
    dob,
    gender,
    bloodgroup,
  ) {
    return UserProfilePage(
        FieldImage: image,
        Fieldsehatid: sehatid,
        Fieldname: name,
        Fieldemail: email,
        Fieldpassword: password,
        Fieldcontactnumber: contactnumber,
        Fieldbloodgroup: bloodgroup,
        Fielddob: dob,
        Fieldgender: gender);
  }
}
