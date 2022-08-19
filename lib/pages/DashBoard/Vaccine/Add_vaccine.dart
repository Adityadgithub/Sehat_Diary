import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';

import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

Future<DocumentReference<Map<String, dynamic>>>? userid;

class AddVaccine extends StatefulWidget {
  const AddVaccine({Key? key}) : super(key: key);

  @override
  State<AddVaccine> createState() => _AddVaccineState();
}

class _AddVaccineState extends State<AddVaccine> {
  File? certicameraimages;
  PlatformFile? certigallaryimages;

  UploadTask? certiuploadtask;

  var certiurlDownlad;

  var certiimagedone;

  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Vaccine')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Vaccine');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Vaccine')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Vaccine');
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;
//
  final typeitems = [
    'Inactivated',
    'Live-attenuated',
    'SRPC',
    'Toxoid',
    'COVID-19'
  ];
  var typeselecteditem = 'Inactivated';
//
  final inactivateditems = [
    'Hepatitis A',
    'Flu',
    'Polio',
    'Rabies',
  ];
  var inactivatedselecteditem = 'Hepatitis A';

  final liveattenuateditems = [
    'MMR',
    'Rotavirus',
    'Smallpox',
    'Chickenpox',
    'Yellow fever',
  ];
  var liveattenuatedselecteditem = 'MMR';

  final srpcitems = [
    'Hib',
    'Hepatitis B',
    'HPV',
    'Whooping cough',
    'Pneumococcal',
    'Meningococcal',
    'Shingles'
  ];
  var srpcselecteditem = 'Hib';

  final toxoiditems = ['Diphtheria', 'Tetanus'];
  var toxoidselecteditem = 'Diphtheria';

  final coviditems = ['Covaxin', 'Covishield', 'Sputnik'];
  var covidselecteditem = 'Covaxin';

  DateTime date = DateTime.now();

  late Timer _timer;

  var weight;

  var vaccinename = 'Hepatitis A';
  var _error;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        date = DateTime.now();
      });
    });
    super.initState();
  }

  bool validator() {
    if (certiurlDownlad != null) {
      return true;
    } else {
      setState(() {
        _error = true;
      });
      return false;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget showAlert() {
    if (_error == true) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline_outlined),
            ),
            Text("Please upload document"),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add Vaccine",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  showAlert(),
                  Padding(
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
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
                            ),
                            onChanged: (typeitem) {
                              setState(() {
                                typeselecteditem = typeitem as String;
                              });
                            },
                            value: typeselecteditem,
                            items: typeitems
                                .map((typeitem) => DropdownMenuItem(
                                    value: typeitem, child: Text(typeitem)))
                                .toList()),
                      ),
                      if (typeselecteditem == 'Inactivated')
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                                ),
                                onChanged: (inactivateditem) {
                                  setState(() {
                                    inactivatedselecteditem =
                                        inactivateditem as String;
                                    vaccinename = inactivatedselecteditem;
                                  });
                                },
                                value: inactivatedselecteditem,
                                items: inactivateditems
                                    .map((inactivateditem) => DropdownMenuItem(
                                        value: inactivateditem,
                                        child: Text(inactivateditem)))
                                    .toList()),
                          ),
                        ),
                      if (typeselecteditem == 'Live-attenuated')
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                                ),
                                onChanged: (liveattenuateditem) {
                                  setState(() {
                                    liveattenuatedselecteditem =
                                        liveattenuateditem as String;
                                    vaccinename = liveattenuatedselecteditem;
                                  });
                                },
                                value: liveattenuatedselecteditem,
                                items: liveattenuateditems
                                    .map((liveattenuateditem) =>
                                        DropdownMenuItem(
                                            value: liveattenuateditem,
                                            child: Text(liveattenuateditem)))
                                    .toList()),
                          ),
                        ),
                      if (typeselecteditem == 'SRPC')
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                                ),
                                onChanged: (srpcitem) {
                                  setState(() {
                                    srpcselecteditem = srpcitem as String;
                                    vaccinename = srpcselecteditem;
                                  });
                                },
                                value: srpcselecteditem,
                                items: srpcitems
                                    .map((srpcitem) => DropdownMenuItem(
                                        value: srpcitem, child: Text(srpcitem)))
                                    .toList()),
                          ),
                        ),
                      if (typeselecteditem == 'Toxoid')
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                                ),
                                onChanged: (toxoiditem) {
                                  setState(() {
                                    toxoidselecteditem = toxoiditem as String;
                                    vaccinename = toxoidselecteditem;
                                  });
                                },
                                value: toxoidselecteditem,
                                items: toxoiditems
                                    .map((toxoiditem) => DropdownMenuItem(
                                        value: toxoiditem,
                                        child: Text(toxoiditem)))
                                    .toList()),
                          ),
                        ),
                      if (typeselecteditem == 'COVID-19')
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                                ),
                                onChanged: (coviditem) {
                                  setState(() {
                                    covidselecteditem = coviditem as String;
                                    vaccinename = covidselecteditem;
                                  });
                                },
                                value: covidselecteditem,
                                items: coviditems
                                    .map((coviditem) => DropdownMenuItem(
                                        value: coviditem,
                                        child: Text(coviditem)))
                                    .toList()),
                          ),
                        ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            "Add your documents here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            "Certificate",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color.fromARGB(255, 216, 230, 255),
                                ),
                                child: TextButton(
                                  child: Row(children: [
                                    Icon(Icons.add),
                                    Text('Add Certificate')
                                  ]),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Container(
                                        height: 50,
                                        child: AlertDialog(
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select an option",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  "to pick your image",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            content: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.17,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .longestSide,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        setState(() async {
                                                          certiimagedone = 0;
                                                          Navigator.of(context)
                                                              .pop();
                                                          await certigallaryselectFile();
                                                          certiimagedone = 1;
                                                        });
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
                                                            BorderRadius
                                                                .circular(15)),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .longestSide,
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        certiimagedone = 0;
                                                        Navigator.of(context)
                                                            .pop();
                                                        await certicameraselectFile();
                                                        certiimagedone = 1;
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
                                )),

                            if (certiimagedone == 0)
                              Row(
                                children: [
                                  SizedBox(width: 23),
                                  Text('Uploading, please wait...')
                                ],
                              ),

                            if (certiimagedone == 1)
                              Row(
                                children: [
                                  SizedBox(width: 23),
                                  Icon(Icons.cloud_done),
                                  SizedBox(width: 5),
                                  Text('Done')
                                ],
                              ),
                            // buildprogress(),
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
                                                '${date.day}/${date.month}/${date.year}',
                                            'Time':
                                                '${date.hour}:${date.minute}',
                                            'Vaccine type': typeselecteditem,
                                            'Vaccine': vaccinename,
                                            'Certificate': certiurlDownlad,
                                          }).then((value) =>
                                            Navigator.pushNamed(
                                                context, "Vaccine"))
                                        : mainboard.add({
                                            'Date':
                                                '${date.day}/${date.month}/${date.year}',
                                            'Time':
                                                '${date.hour}:${date.minute}',
                                            'Vaccine type': typeselecteditem,
                                            'Vaccine': vaccinename,
                                            'Certificate': certiurlDownlad,
                                          }).then((value) =>
                                            Navigator.pushNamed(
                                                context, "Vaccine"));
                                  } on FirebaseAuthException catch (e) {
                                    print(e);
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
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
                ],
              ),
            ),
          )),
    );
  }

  Future certigallaryselectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      certigallaryimages = result.files.first;
    });

    await certigallaryuploadfile();
  }

  Future certigallaryuploadfile() async {
    try {
      final path = 'files/${certigallaryimages}';
      final file = File(certigallaryimages!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      certiuploadtask = ref.putFile(file);

      final snapshot = await certiuploadtask!.whenComplete(() {});
      certiurlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $certiurlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }

  Future certicameraselectFile() async {
    // final result = await FilePicker.platform.pickFiles();
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result == null) return;

    setState(() {
      certicameraimages = File(result.path);
    });

    await certicamerauploadfile();
  }

  Future certicamerauploadfile() async {
    try {
      final path = 'files/${certicameraimages}';
      final file = File(certicameraimages!.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      certiuploadtask = ref.putFile(file);

      final snapshot = await certiuploadtask!.whenComplete(() {});
      certiurlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $certiurlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }
}
