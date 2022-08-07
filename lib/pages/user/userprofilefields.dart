import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clipboard/clipboard.dart';
import 'package:image_picker/image_picker.dart';

var usersehatidafterlogin;

class UserProfileFields extends StatefulWidget {
  var FieldImage;
  var Fieldsehatid;
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;

  UserProfileFields({
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
  State<UserProfileFields> createState() => _UserProfileFieldsState(
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

class _UserProfileFieldsState extends State<UserProfileFields> {
  var FieldImage;
  var Fieldsehatid;
  var Fieldname;
  var Fieldemail;
  var Fieldpassword;
  var Fielddob;
  var Fieldgender;
  var Fieldbloodgroup;
  var Fieldcontactnumber;

  _UserProfileFieldsState({
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

  List<String> docIDs = [];

  // var username;
  @override
  void initState() {
    // TODO: implement initState
    usersehatidafterlogin = Fieldsehatid;
  }

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
                    if (FieldImage == null)
                      CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 40,
                          )),
                    if (FieldImage != null)
                      CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 40,
                          backgroundImage: NetworkImage('$FieldImage')),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    initialValue: usersehatidafterlogin,
                    enableSuggestions: true,
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.key),
                      ),
                      suffixIcon: TextButton(
                        child: Icon(Icons.copy),
                        onPressed: () {
                          FlutterClipboard.copy(Fieldsehatid);
                        },
                      ),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                    onChanged: (value) {
                      // Email = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
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
                      hintText: 'Name',
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
                      hintText: "Email address",
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
                initialValue: Fieldcontactnumber,
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
                    child: Icon(Icons.date_range),
                  ),
                  hintText: "Date of Birth",
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
                    child: Icon(Icons.male),
                  ),
                  hintText: "Gender",
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
                    child: Icon(Icons.bloodtype),
                  ),
                  hintText: "Blood Group",
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
                    await Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
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
