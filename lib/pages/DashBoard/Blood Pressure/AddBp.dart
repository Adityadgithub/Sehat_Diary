import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/common/signup.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

Future<DocumentReference<Map<String, dynamic>>>? userid;

class AddBp extends StatefulWidget {
  const AddBp({Key? key}) : super(key: key);

  @override
  State<AddBp> createState() => _AddBpState();
}

class _AddBpState extends State<AddBp> {
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;

  var store = FirebaseFirestore.instance;

  DateTime date = DateTime.now();

  late Timer _timer;

  var Diastolic;

  var Systolic;
  var Pulse;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Bp')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Bp');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Bp')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Bp');
  bool validator() {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add Blood Pressure Details",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date"),
                            Text("${date.year}/${date.month}/${date.day}")
                          ],
                        )
                      ],
                    )),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time"),
                            Text("${date.hour}:${date.minute} AM")
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(height: 30),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          }

                          if (value.length > 3) {
                            return "value should be less than or equal to 3 digit";
                          }

                          if (int.parse(value) < 50) {
                            return "value should be under 50 - 150 mmHg, try again";
                          }
                          if (int.parse(value) > 150) {
                            return "value should be under 50 mmHg, try again";
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
                            Systolic = value;
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
                          suffixText: 'mmHg',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(Icons.featured_play_list_rounded),
                          ),
                          hintText: "Systolic Value",
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
                          if (value!.length > 3) {
                            return "value should be less than or equal to 3 digit";
                          }

                          if (int.parse(value) < 50) {
                            return "value should be under 50 - 150 mmHg, try again";
                          }
                          if (int.parse(value) > 150) {
                            return "value should be under 50 - 150 mmHg, try again";
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
                            Diastolic = value;
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
                          suffixText: 'mmHg',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(Icons.featured_play_list_rounded),
                          ),
                          hintText: "Diastolic Value",
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
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            Pulse = value;
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
                          suffixText: 'bpm',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(Icons.monitor_heart_outlined),
                          ),
                          hintText: "Pulse Count",
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

                          if (validator()) {
                            try {
                              final result = familymempressed == true
                                  ? family.add({
                                      'Date':
                                          '${date.year}/${date.month}/${date.day}',
                                      'Time': '${date.hour}:${date.minute}',
                                      'Systolic': Systolic,
                                      'Diastolic': Diastolic,
                                      'Pulse': Pulse,
                                    }).then((value) => Navigator.pushNamed(
                                      context, "BloodPressure"))
                                  : mainboard.add({
                                      'Date':
                                          '${date.year}/${date.month}/${date.day}',
                                      'Time': '${date.hour}:${date.minute}',
                                      'Systolic': Systolic,
                                      'Diastolic': Diastolic,
                                      'Pulse': Pulse,
                                    }).then((value) => Navigator.pushNamed(
                                      context, "BloodPressure"));
                            } on FirebaseAuthException catch (e) {
                              print(e);
                            }
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
