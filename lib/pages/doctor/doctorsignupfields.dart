import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/signup.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

Future<DocumentReference<Map<String, dynamic>>>? userid;

class DoctorSignupFields extends StatefulWidget {
  const DoctorSignupFields({Key? key}) : super(key: key);
  @override
  State<DoctorSignupFields> createState() => _DoctorSignupFieldsState();
}

class _DoctorSignupFieldsState extends State<DoctorSignupFields> {
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;

  var store = FirebaseFirestore.instance;

  var name;
  var newEmail;
  var newPassword;
  var hospitalname;
  var speciality;
  var degree;
  var address;
  int? number;
  var license_num;

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
                      // ),
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
                      labelText: "Full Name",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
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
                      newEmail = value;
                    },
                  ),
                ),
                SizedBox(height: 15),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                obscureText: true,
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
                    child: Icon(Icons.lock),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
                ),
                onChanged: (value) {
                  newPassword = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
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
                  hospitalname = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
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
                  speciality = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
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
                  degree = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
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
                  address = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                keyboardType: TextInputType.number,
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
                  number = int.parse(value);
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: Licensenumcontroller,
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
                onChanged: (value) {
                  license_num = value;
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      setState(() {});
                      usercreated = true;

                      try {
                        final user = await auth
                            .createUserWithEmailAndPassword(
                                email: newEmail, password: newPassword)
                            .then((value) {
                          final result = store.collection(loginas!).doc(FirebaseAuth.instance.currentUser!.uid.toString()).collection('MainUser').add({
                            'Name': name,
                            'Email': newEmail,
                            'password': newPassword,
                            'Hospital Name': hospitalname,
                            'Speciality': speciality,
                            'Degree': degree,
                            'Address': address,
                            'Contact Number': number,
                            'License Number': license_num
                          });
                          userid = result;
                        }).then((value) =>

                                Navigator.pushNamed(context, "Firebasecard"));
                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Text("SIGNUP",
                              style: TextStyle(color: Colors.white)),
                        )),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ALREADY HAVE AN ACCOUNT",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(),
                      TextButton(
                        onPressed: () async {
                          usercreated = true;
                          await Navigator.pushNamed(context, "login");
                        },
                        child: Text("LOGIN",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 3,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
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
