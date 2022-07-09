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

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;
  DateTime date = DateTime.now();


  late Timer _timer;

  var Medicinename;

  final medtypeitems = ['Capsule', 'ML', 'Tablet',];
  var medtypeselecteditem;

  var quantity;

  var nooftimes;
  var freq;

  var StartDate = 'Start Date';

  bool startdateselected = false;

  var EndDate = 'Start Date';

  bool  enddateselected = false;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add sugar Details",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
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
                    SizedBox(height: 15),
                    SizedBox(height: 15),


                    TextFormField(

                      onChanged: (value) {
                        setState(() {
                          Medicinename = value;
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
                          child: Icon(Icons.local_hospital),
                        ),
                        labelText: "Medicine Name",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 155,
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
                                    child: Icon(Icons.event_note_outlined),
                                  ),
                                  labelText: "Type",
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 111, 111, 111)),
                                ),
                                onChanged: (medtypeitem) {
                                  setState(() {
                                    medtypeselecteditem = medtypeitem as String;
                                  });
                                },
                                value: medtypeselecteditem,
                                items: medtypeitems
                                    .map((medtypeitem) =>
                                    DropdownMenuItem(
                                        value: medtypeitem,
                                        child: Text(medtypeitem)))
                                    .toList()),
                          ),
                        ),
                      ],
                    ),SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(width: 155,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                quantity = value;
                              });
                            },
                            decoration: InputDecoration(
                              suffixText: medtypeselecteditem != null
                                  ? '$medtypeselecteditem'
                                  : '',
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

                              labelText: "Quantity",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(width: 125,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  nooftimes = value;
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

                                labelText: "No. of times",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 111, 111, 111)),
                              ),
                            ),
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(value: 'Daily', groupValue: freq, onChanged: (value) {
                                    setState(() {
                                      freq = value;

                                    });
                                  }),
                                  Text('Daily')
                                ],
                              ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Radio(value: 'Weekly', groupValue: freq, onChanged: (value) {
                              setState(() {
                                freq = value;

                              });
                            }),
                            Text('Weekly')
                          ],
                        )
                      ],
                    )
                  ],
                  ), SizedBox(height: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
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
                                  StartDate = '${newdate.day}-${newdate.month}-${newdate.year}';
                                  startdateselected = true;
                                  });

                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.black45,
                                    ),
                                    SizedBox(width: 15),

                                       startdateselected == true? Text(
                                         '$StartDate',
                                         style: TextStyle(
                                              fontSize: 15),
                                       ) :Text(
                                      'Start Date',
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 15),
                                    )

                                  ],
                                )),
                          ),
                        ),

                        Flexible(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 150,
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
                                    EndDate = '${newdate.day}-${newdate.month}-${newdate.year}';
                                    enddateselected = true;
                                  });

                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.black45,
                                    ),
                                    SizedBox(width: 15),

                                    enddateselected == true? Text(
                                      '$EndDate',
                                      style: TextStyle(
                                          fontSize: 15),
                                    ) :Text(
                                      'End Date',
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 15),
                                    )

                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
SizedBox(height: 15,),
                  Container(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            setState(() {});
                            usercreated = true;

                            try {
                              final result = store.collection(loginas!).doc(
                                  FirebaseAuth.instance.currentUser!.uid
                                      .toString()).collection('MainUser').doc(
                                  'Dashboard').collection('Medicine').add({
                                'Date': '${date.day}/${date.month}/${date.year}',
                                'Time': '${date.hour}:${date.minute}',
                                'Medname': Medicinename,
                                'MedType': medtypeselecteditem,
                                'Quantity':quantity,
                                'No. of times': nooftimes,
                                'Frequncy':freq,
                                'Start Date':StartDate,
                                'End Date':EndDate

                              })

                                  .then((value) =>
                                  Navigator.pushNamed(context, "Medicine"));
                            } on FirebaseAuthException catch (e) {
                              print(e);
                            }
                            setState(() {});
                          },
                          child: Container(
                              height: 40,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.4,
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
          )
    ),);
  }
}
