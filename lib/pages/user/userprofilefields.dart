import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

class UserProfileFields extends StatefulWidget {
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;

  UserProfileFields({
    this.Fieldname,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fielddob,
    this.Fieldgender,
    this.Fieldbloodgroup,
    this.Fieldcontactnumber,
  });
  @override
  State<UserProfileFields> createState() => _UserProfileFieldsState(
      Fieldname: Fieldname,
      Fieldemail: Fieldemail,
      Fieldpassword: Fieldpassword,
      Fieldcontactnumber: Fieldcontactnumber,
      Fieldbloodgroup: Fieldbloodgroup,
      Fielddob: Fielddob,
      Fieldgender: Fieldgender);
}

class _UserProfileFieldsState extends State<UserProfileFields> {
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;

  _UserProfileFieldsState({
    this.Fieldname,
    this.Fieldemail,
    this.Fieldpassword,
    this.Fielddob,
    this.Fieldgender,
    this.Fieldbloodgroup,
    this.Fieldcontactnumber,
  });
  List<String> docIDs = [];

  // var username;

  var _formKey = GlobalKey<FormState>();

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
                        child: Icon(Icons.person, size: 40)),
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
                    key: _formKey,
                    initialValue: Fieldname,
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
                    onChanged: (value) {
                      // Email = value;
                    },
                  ),
                ),
                SizedBox(height: 15),
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
                      labelText: "Email address",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 15),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // initialValue: Fieldcontactnumber,
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
                  labelText: "Contact Number",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fielddob,
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
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldgender,
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
                  labelText: "Gender",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                initialValue: Fieldbloodgroup,
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
                  labelText: "Blood Group",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextButton(
                  onPressed: () async {
                    _signOut();
                    await Navigator.pushNamed(context, "login");
                  },
                  child: Center(
                      child: Text(
                    "Signout",
                    style: TextStyle(color: Colors.white),
                  ))),
            )
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