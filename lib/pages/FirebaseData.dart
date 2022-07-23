import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

var universalimagefordrawer;
var universalnamefordrawer;

class _FirebasecardState extends State<Firebasecard> {
  var datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(loginas!)
              .doc(uname)
              .collection('MainUser')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final services = snapshot.data!.docs;
              List<Widget> servicesWidget = [];
              if (loginas == 'Doctor') {
                for (var st in services) {
                  final _image = (st.data()! as Map<String, dynamic>)['Image'];
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
                  universalimagefordrawer = _image;
                  print(_name);
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
              } else if (loginas == 'User') {
                for (var st in services) {
                  final _image = (st.data()! as Map<String, dynamic>)['Image'];
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
                  universalimagefordrawer = _image;
                  datas = builduserpage(
                    _image,
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

  builduserpage(
      image,
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
        Fieldname: name,
        Fieldemail: email,
        Fieldpassword: password,
        Fieldcontactnumber: contactnumber,
        Fieldbloodgroup: bloodgroup,
        Fielddob: dob,
        Fieldgender: gender);
  }
}
