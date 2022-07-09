import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/doctor/doctorprofilepage.dart';
import 'package:firebasetut/pages/user/userprofilefields.dart';
import 'package:firebasetut/pages/user/userprofilepage.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';

class Firebasecard extends StatefulWidget {
  const Firebasecard({Key? key}) : super(key: key);
  @override
  State<Firebasecard> createState() => _FirebasecardState();
}
var universalnamefordrawer;
class _FirebasecardState extends State<Firebasecard> {
  var datas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(loginas!).doc(FirebaseAuth.instance.currentUser!.uid.toString()).collection('MainUser').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final services = snapshot.data!.docs;
          List<Widget> servicesWidget = [];
          if (loginas == 'Doctor') {
            for (var st in services) {
              final _name = (st.data()! as Map<String, dynamic>)['Name'];
              final _email = (st.data()! as Map<String, dynamic>)['Email'];
              final _password =
                  (st.data()! as Map<String, dynamic>)['password'];
              final _hospitalname =
                  (st.data()! as Map<String, dynamic>)['Hospital Name'];
              final _speciality =
                  (st.data()! as Map<String, dynamic>)['Speciality'];
              final _degree = (st.data()! as Map<String, dynamic>)['Degree'];
              final _address = (st.data()! as Map<String, dynamic>)['Address'];
              final _contactnumber =
                  (st.data()! as Map<String, dynamic>)['Contact Number'];
              final _licensenum =
                  (st.data()! as Map<String, dynamic>)['License Number'];
              universalnamefordrawer = _name;
              datas = builddoctorpage(
                _name,
                _email,
                _password,
                _hospitalname,
                _speciality,
                _degree,
                _address,
                _contactnumber,
                _licensenum,
              );
            }
            servicesWidget.add(datas);
          } else if (loginas == 'User') {
            for (var st in services) {
              final _name = (st.data()! as Map<String, dynamic>)['Name'];
              final _email = (st.data()! as Map<String, dynamic>)['Email'];
              final _password =
                  (st.data()! as Map<String, dynamic>)['Password'];
              final _contactnumber =
                  (st.data()! as Map<String, dynamic>)['Contact Number'];
              final _dob = (st.data()! as Map<String, dynamic>)['Dob'];
              final _gender = (st.data()! as Map<String, dynamic>)['Gender'];
              final _bloodgroup =
                  (st.data()! as Map<String, dynamic>)['Blood Group'];
              universalnamefordrawer = _name;
              datas = builduserpage(
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

  builddoctorpage(
    name,
    email,
    password,
    contactnumber,
    hospitalname,
    speciality,
    degree,
    address,
    licensenum,
  ) {
    return doctorprofilepage(
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

  builduserpage(
    name,
    email,
    password,
    contactnumber,
    dob,
    gender,
    bloodgroup,
  ) {
    return UserProfilePage(
        Fieldname: name,
        Fieldemail: email,
        Fieldpassword: password,
        Fieldcontactnumber: contactnumber,
        Fieldbloodgroup: bloodgroup,
        Fielddob: dob,
        Fieldgender: gender);
  }
}
