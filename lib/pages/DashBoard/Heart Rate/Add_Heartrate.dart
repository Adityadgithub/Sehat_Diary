import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:firebasetut/pages/signup.dart';
import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

Future<DocumentReference<Map<String, dynamic>>>? userid;

class AddHeart extends StatefulWidget {
  const AddHeart({Key? key}) : super(key: key);

  @override
  State<AddHeart> createState() => _AddHeartState();
}

class _AddHeartState extends State<AddHeart> {
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;

  DateTime date = DateTime.now();

  late Timer _timer;

  var heartrpm;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {date = DateTime.now();});
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
              "Add Heart rpm",
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
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      heartrpm = value;
                    });
                  },
                  decoration: InputDecoration(
                    suffixText: 'RPM',
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
                      child: Icon(Icons.monitor_heart),
                    ),
                    hintText: "Heart RPM",
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
                          usercreated = true;

                          try {
                            final result = store
                                .collection(loginas!)
                                .doc(FirebaseAuth.instance.currentUser!.uid
                                    .toString())
                                .collection('MainUser')
                                .doc('Dashboard')
                                .collection('Heart')
                                .add({
                              'Date': '${date.day}/${date.month}/${date.year}',
                              'Time': '${date.hour}:${date.minute}',
                              'Heart Rate': heartrpm,

                              // 'Dob': date,
                              // userid = result;
                            }).then((value) =>
                                    Navigator.pushNamed(context, "HeartRate"));
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