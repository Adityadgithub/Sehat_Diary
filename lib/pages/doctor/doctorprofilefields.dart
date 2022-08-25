import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

//These are all the Field Widget to show the user credentilas from firebase.

class DoctorProfileFields extends StatefulWidget {
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

  DoctorProfileFields({
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
  State<DoctorProfileFields> createState() => _DoctorProfileFieldsState(
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

class _DoctorProfileFieldsState extends State<DoctorProfileFields> {
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

  _DoctorProfileFieldsState({
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
  List<String> docIDs = [];

  var username;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            //Widegt to - Show user's profile pic.

            Container(
              child: Column(children: [
                Stack(
                  children: [
                    //Scenario 1 : Photo not uploaded
                    if (FieldImage == null)
                      CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 40,
                          )),

                    //Scenario 2 : Photo uploaded
                    if (FieldImage != null)
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 40,
                        backgroundImage: NetworkImage('$FieldImage'),
                      ),
                  ],
                ),
                SizedBox(height: 15),

                // Field Widget to display Name
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    initialValue: FieldName,
                    enableSuggestions: true,
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 230, 255),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.person),
                      ),
                      hintText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Field Widget to display Email Address
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    initialValue: Fieldemail,
                    enableSuggestions: true,
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 230, 255),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.mail),
                      ),
                      hintText: "Email address",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                    onChanged: (value) {
                      // Email = value;
                    },
                  ),
                ),
                SizedBox(height: 15),
              ]),
            ),

            // Field Widget to display Hospital name
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldhospitalname,
                enableSuggestions: true,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 230, 255),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.local_hospital),
                  ),
                  hintText: "Hospital Name",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),

            // Field Widget to display Speciality
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldspeciality,
                enableSuggestions: true,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 230, 255),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.stars_rounded),
                  ),
                  hintText: "Speciality",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),

            // Field Widget to display Degree
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fielddegree,
                enableSuggestions: true,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 230, 255),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.school),
                  ),
                  hintText: "Degree",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),

            // Field Widget to display Address
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldaddress,
                enableSuggestions: true,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 230, 255),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.home),
                  ),
                  hintText: "Address",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),

            // Field Widget to display Contact Number
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldcontactnumber.toString(),
                enableSuggestions: true,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 230, 255),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.call),
                  ),
                  hintText: "Contact Number",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),

            // Field Widget to display License Num.
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldlicensenum,
                enableSuggestions: true,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 230, 255),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.shield),
                  ),
                  hintText: "License Number",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Widget to - Signout from current user and navigate to login screen.
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextButton(
                  onPressed: () async {
                    _signOut();
                    await Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                  child: Text(
                    "Signout",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ]),
        ),
      ),
    );
  }

  // Function to - call firebase Signout function
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Function to - pick photo from galary
  Future getgalaryimage() async {
    try {
      var images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images == null) return;
      var ImageTemp = File(images.path as String);

      setState(() {
        images = ImageTemp as XFile;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // Function to - pick photo from camera
  Future getcamimage() async {
    try {
      var images = await ImagePicker().pickImage(source: ImageSource.camera);
      if (images == null) return;
      var ImageTemp = File(images.path as String);

      setState(() {
        images = ImageTemp as XFile;
      });
    } on PlatformAdaptiveIcons catch (e) {
      print(e);
    }
  }
}
