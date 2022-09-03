import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/common/signup.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

Future<DocumentReference<Map<String, dynamic>>>? userid;

class AddWeight extends StatefulWidget {
  const AddWeight({Key? key}) : super(key: key);

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Weight')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Weight');

  var family = FirebaseFirestore.instance
      .collection('User')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Family member')
      .doc(membername)
      .collection('Dashboard')
      .doc('path')
      .collection('Weight');
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;

  DateTime date = DateTime.now();

  late Timer _timer;

  var weight;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        date = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add Weight",
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
                            Text("${date.hour}:${date.minute}")
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
                SizedBox(height: 15),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (value) {
                    if (value!.contains(',')) {
                      return "Invalid input, please enter numbers only.";
                    }
                    if (value!.contains('-')) {
                      return "Invalid input, please enter numbers only.";
                    }
                    if (value!.contains(' ')) {
                      return "Invalid input, please enter numbers only.";
                    }
                    if (value!.isEmpty) {
                      return "Field can't be empty";
                    }

                    if (int.parse(value) < 50) {
                      return "value should be under 50 - 130 bpm, try again";
                    }
                    if (int.parse(value) > 150) {
                      return "value should be under 50 - 130 bpm, try again";
                    }
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                  decoration: InputDecoration(
                    suffixText: 'kg',
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
                      child: Icon(Icons.ad_units_outlined),
                    ),
                    hintText: "Body Weight",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 111, 111, 111)),
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
                            final result = familymempressed == true
                                ? family.add({
                                    'Date':
                                        '${date.day}/${date.month}/${date.year}',
                                    'Time': '${date.hour}:${date.minute}',
                                    'Weight': weight,
                                  }).then((value) =>
                                    Navigator.pushNamed(context, "Weight"))
                                : mainboard.add({
                                    'Date':
                                        '${date.day}/${date.month}/${date.year}',
                                    'Time': '${date.hour}:${date.minute}',
                                    'Weight': weight,
                                  }).then((value) =>
                                    Navigator.pushNamed(context, "Weight"));
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
