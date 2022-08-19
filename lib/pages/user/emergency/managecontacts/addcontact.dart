import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/user/userprofilefields.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class addcontacts extends StatefulWidget {
  const addcontacts({Key? key}) : super(key: key);

  @override
  State<addcontacts> createState() => _addcontactsState();
}

List numlist = [];

class _addcontactsState extends State<addcontacts> {
  DateTime date = DateTime.now();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var contactname;
  var contactnum;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add SOS contact",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Enter following details",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          }
                          if (value!.length > 3) {
                            return "value should be less than or equal to 3 digit";
                          }

                          if (int.parse(value) < 50) {
                            return "value should be under 50 - 130 bpm, try again";
                          }
                          if (int.parse(value) > 150) {
                            return "value should be under 50 - 130 bpm, try again";
                          }
                          if (value.contains(',')) {
                            return "Invalid input, please enter numbers only.";
                          }
                          if (value.contains('-')) {
                            return "Invalid input, please enter numbers only.";
                          }
                          if (value.contains(' ')) {
                            return "Invalid input, please enter numbers only.";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            contactname = value;
                          });
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
                          hintText: "Name",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 111, 111, 111)),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          }
                          if (value.length > 3) {
                            return "value should be less than or equal to 3 digit";
                          }

                          if (int.parse(value) < 50) {
                            return "value should be under 50 - 130 bpm, try again";
                          }
                          if (int.parse(value) > 150) {
                            return "value should be under 50 - 130 bpm, try again";
                          }
                          if (value.contains(',')) {
                            return "Invalid input, please enter numbers only.";
                          }
                          if (value.contains('-')) {
                            return "Invalid input, please enter numbers only.";
                          }
                          if (value.contains(' ')) {
                            return "Invalid input, please enter numbers only.";
                          }
                        },
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            contactnum = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixText: '+91 ',
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
                              fontSize: 20,
                              color: Color.fromARGB(255, 111, 111, 111)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () async {
                          setState(() {});

                          try {
                            FirebaseFirestore.instance
                                .collection('User')
                                .doc(universalsehatid)
                                .collection('MainUser')
                                .doc('emergency')
                                .collection('contacts')
                                .add({
                              'contactname': contactname,
                              'contactnum': '+91 $contactnum',
                            }).then((value) {
                              numlist.add(contactnum);

                              Navigator.pushNamed(context, "Contact");
                            });
                          } on FirebaseAuthException catch (e) {
                            print(e);
                          }
                          setState(() {});
                        },
                        child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Text("SUBMIT",
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
