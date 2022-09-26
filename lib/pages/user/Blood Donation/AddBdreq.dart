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

class AddBd extends StatefulWidget {
  const AddBd({Key? key}) : super(key: key);

  @override
  State<AddBd> createState() => _AddBdState();
}

class _AddBdState extends State<AddBd> {
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;

  var store = FirebaseFirestore.instance;

  DateTime date = DateTime.now();

  late Timer _timer;

  var patientcontact;

  var patientname;

  var ReqDate = 'Start Date';

  bool ReqDateselected = false;

  var address;
  final blooditems = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  var bloodselecteditem = 'A+';
  final locationtypeitems = ['Hospital', 'Blood Bank'];
  var locationtypeselecteditem = 'Hospital';

  var liter;

  var patientage;

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
              "Add Donation request details",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
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

                            if (value.length < 5) {
                              return "name should have at least 5 character";
                            }

                            if (value.contains('-')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('@')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('#')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('<')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('>')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('?')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains(';')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains(':')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('/')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('=')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('(')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains(')')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('!')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              patientname = value;
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
                            hintText: "Patient Name",
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 111, 111, 111)),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          validator: (value) {
                            if (value!.contains(',')) {
                              return "Invalid input.";
                            }
                            if (value!.contains('-')) {
                              return "Invalid input.";
                            }
                            if (value!.contains(' ')) {
                              return "Invalid input.";
                            }
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }

                            if (int.parse(value) < 0) {
                              return "value can't be 0";
                            }
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            patientcontact = value;
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
                              child: Icon(Icons.phone),
                            ),
                            hintText: "Patient's contact",
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 111, 111, 111)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                          ],
                          validator: (value) {
                            if (value!.contains(',')) {
                              return "Invalid input.";
                            }
                            if (value!.contains('-')) {
                              return "Invalid input.";
                            }
                            if (value!.contains(' ')) {
                              return "Invalid input.";
                            }
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }

                            if (int.parse(value) < 0) {
                              return "value can't be 0";
                            }
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            patientage = value;
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
                              child: Icon(Icons.person_outline_rounded),
                            ),
                            hintText: "Patient's Age (DOB)",
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 111, 111, 111)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 216, 230, 255),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0,
                                        ),
                                      ),
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Icon(Icons.bloodtype),
                                      ),
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 111, 111, 111)),
                                    ),
                                    onChanged: (blooditem) {
                                      setState(() {
                                        bloodselecteditem = blooditem as String;
                                      });
                                    },
                                    value: bloodselecteditem,
                                    items: blooditems
                                        .map((blooditem) => DropdownMenuItem(
                                            value: blooditem,
                                            child: Text(blooditem)))
                                        .toList()),
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                ],
                                validator: (value) {
                                  if (value!.contains(',')) {
                                    return "Invalid input.";
                                  }
                                  if (value!.contains('-')) {
                                    return "Invalid input.";
                                  }
                                  if (value!.contains(' ')) {
                                    return "Invalid input.";
                                  }
                                  if (value!.isEmpty) {
                                    return "Field can't be empty";
                                  }

                                  if (int.parse(value) < 0) {
                                    return "value can't be 0";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    liter = value;
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
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Icon(Icons.water_drop)),
                                  hintText: "ltr.",
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 111, 111, 111)),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),
                        //Required Date
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 216, 230, 255),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    )),
                                child: TextButton(
                                    onPressed: () async {
                                      DateTime? newdate = await showDatePicker(
                                          context: context,
                                          initialDate: date,
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2030));
                                      if (newdate == null) return;
                                      setState(() {
                                        ReqDate =
                                            '${newdate.day}-${newdate.month}-${newdate.year}';
                                        ReqDateselected = true;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          color: Colors.black45,
                                        ),
                                        SizedBox(width: 15),
                                        ReqDateselected == true
                                            ? Text(
                                                '$ReqDate',
                                                style: TextStyle(fontSize: 15),
                                              )
                                            : Text(
                                                'Required Date',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 15),
                                              )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),
                        SizedBox(
                          child: DropdownButtonFormField<String>(
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
                                  child: Icon(Icons.share_location_sharp),
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 111, 111, 111)),
                              ),
                              onChanged: (locationtypeitem) {
                                setState(() {
                                  locationtypeselecteditem =
                                      locationtypeitem as String;
                                });
                              },
                              value: locationtypeselecteditem,
                              items: locationtypeitems
                                  .map((locationtypeitem) => DropdownMenuItem(
                                      value: locationtypeitem,
                                      child: Text(locationtypeitem)))
                                  .toList()),
                        ),

                        SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }
                            if (value.length < 5) {
                              return "address should have at least 5 character";
                            }

                            if (value.contains('-')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('@')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('#')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('<')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('>')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('?')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains(';')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains(':')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('/')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('=')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('(')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains(')')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                            if (value.contains('!')) {
                              return "Invalid input, value can't contain {@#(),-;:=<>?!}";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              address = value;
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
                              child: Icon(Icons.location_pin),
                            ),
                            hintText: "Address",
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 111, 111, 111)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                                final result = FirebaseFirestore.instance
                                    .collection('Blood Donation')
                                    .add({
                                  'Date':
                                      '${date.year}/${date.month}/${date.day}',
                                  'Time': '${date.hour}:${date.minute}',
                                  'Patient Name': patientname,
                                  'Patient contact': patientcontact,
                                  'Patient Age': patientage,
                                  'Blood Group': bloodselecteditem,
                                  'Liter': liter,
                                  'Required Date': ReqDate,
                                  'Location Type': locationtypeselecteditem,
                                  'Address': address,
                                }).then((value) => Navigator.pushNamed(
                                        context, "BloodDonation"));
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
            ),
          )),
    );
  }
}
