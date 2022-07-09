import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';



class DoctorProfileFields extends StatefulWidget {
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

  var _nameformKey = GlobalKey<FormState>();
  var _emailformKey = GlobalKey<FormState>();
  var _passwordformKey = GlobalKey<FormState>();
  var _hospitalformKey = GlobalKey<FormState>();
  var _specialityformKey = GlobalKey<FormState>();
  var _degreeformKey = GlobalKey<FormState>();
  var _addressformKey = GlobalKey<FormState>();
  var _contactformKey = GlobalKey<FormState>();
  var _licenseformKey = GlobalKey<FormState>();



  // Future getDocId() async {
  //   try {
  //     var ds = FirebaseFirestore.instance.collection(loginas!).doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) => username );
  //   } catch (e) {
  //     print(e);
  //   }
  //   // .then((snapshot) => snapshot.docs.forEach((element) {
  //   //       print(element.reference);
  //   //       docIDs.add(element.reference.id);
  //   //     }));
  // }

  // Futureup
  // Stream<QuerySnapshot> get users {
  //   return usercollec
  // }

  @override
  Widget build(BuildContext context) {

    
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Container(
              child: Column(children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      // backgroundImage: AssetImage(
                      //   "assets/images/profilepic.jpg",
                      // )\
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Container(
                            height: 50,
                            child: AlertDialog(
                                title: Text(
                                  '''Select an option
        to pick your image''',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        width: MediaQuery.of(context)
                                            .size
                                            .longestSide,
                                        child: TextButton(
                                          onPressed: () {
                                            getgalaryimage();
                                          },
                                          child: Text("Gallary"),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        width: MediaQuery.of(context)
                                            .size
                                            .longestSide,
                                        child: TextButton(
                                          onPressed: () {
                                            getcamimage();
                                          },
                                          child: Text("Camera"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                      icon: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.add,
                            size: 20,
                          )),
                      padding: EdgeInsetsDirectional.only(top: 60, start: 50),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    key: _nameformKey,
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
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    key: _emailformKey,
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
                      labelText: "Email address",
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                key: _hospitalformKey,
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
                  labelText: "Hospital Name",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                key: _specialityformKey,
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
                  labelText: "Speciality",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                key: _degreeformKey,
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
                  labelText: "Degree",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                key: _addressformKey,
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
                  labelText: "Address",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                key: _contactformKey,
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
                  labelText: "Contact Number",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  // Email = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                key: _licenseformKey,
                // controller: Licensenumcontroller,
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
                  labelText: "License Number",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  _signOut();
                  await Navigator.pushNamed(context, "login");
                },
                child: Text("Signout"))
          ]),
        ),
      ),
    );
  }

// Stream<List<User>> readUsers() => FirebaseFirestore.instance.instance.collection('Doctor').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())));

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

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
