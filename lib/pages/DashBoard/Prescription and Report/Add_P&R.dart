import 'dart:async';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/profilecard.dart';
import 'package:firebasetut/pages/common/signup.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<DocumentReference<Map<String, dynamic>>>? userid;

class AddPnR extends StatefulWidget {
  const AddPnR({Key? key}) : super(key: key);

  @override
  State<AddPnR> createState() => _AddPnRState();
}

class _AddPnRState extends State<AddPnR> {
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('PnR')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('PnR');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('PnR')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('PnR');
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;

  DateTime date = DateTime.now();

  late Timer _timer;

  var weight;

  var docname;

  var docmobile;

  File? prescameraimages;
  PlatformFile? presgallaryimages;

  var presimagedone;

  var repoimagedone;

  UploadTask? presuploadtask;

  var presurlDownlad;

  File? reportcameraimages;
  PlatformFile? reportgallaryimages;

  UploadTask? reportuploadtask;

  var reporturlDownlad;
  var _error;
  var controller;

  bool opencam = false;

  bool flash = false;

  bool presupload = false;

  bool repoupload = false;

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

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool validator() {
    if (formkey.currentState!.validate()) {
      if (presurlDownlad != null || reporturlDownlad != null) {
        return true;
      } else {
        setState(() {
          _error = true;
        });
        return false;
      }
    }
    return false;
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
            Text("Please upload at least one document"),
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
    if (opencam == true) {
      return SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 170,
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(controller),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (presupload == true) {
                            presimagedone = null;
                          }
                          if (repoupload == true) {
                            repoimagedone = null;
                          }
                          opencam = false;
                        });
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () async {
                          var result = await controller.takePicture();
                          setState(() {
                            opencam = false;
                          });
                          if (presupload == true) {
                            await prescameraselectFile(result);
                            presimagedone = 1;
                            presupload = false;
                          }
                          if (repoupload == true) {
                            await reportcameraselectFile(result);
                            repoimagedone = 1;
                            repoupload = false;
                          }

                          setState(() {});
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.camera,
                                size: 35,
                              ),
                            ))),
                  ),
                  if (flash == false)
                    TextButton(
                      onPressed: () {
                        flash = true;
                        controller.setFlashMode(FlashMode.always);
                        setState(() {});
                      },
                      child: Icon(Icons.flashlight_on),
                    ),
                  if (flash == true)
                    TextButton(
                      onPressed: () {
                        flash = false;

                        controller.setFlashMode(FlashMode.off);
                        setState(() {});
                      },
                      child: Icon(Icons.flashlight_off),
                    )
                ],
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add Details",
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Date"),
                                      Text(
                                          "${date.year}/${date.month}/${date.day}")
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      docname = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 216, 230, 255),
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
                                      child: Icon(Icons.ad_units_outlined),
                                    ),
                                    hintText: "Doctor's Name",
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 111, 111, 111)),
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
                                    setState(() {
                                      docmobile = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 216, 230, 255),
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
                                      child: Icon(Icons.ad_units_outlined),
                                    ),
                                    hintText: "Doctor's Mobile (optional)",
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 111, 111, 111)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Add your documents here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You can either add both",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "or one at a time.",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Prescription",
                            style: TextStyle(color: Colors.grey),
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
                                      Text('Add Prescription')
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
                                                                  .circular(
                                                                      15)),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .longestSide,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() async {
                                                            presimagedone = 0;
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            await presgallaryselectFile();
                                                            presimagedone = 1;
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
                                                                  .circular(
                                                                      15)),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .longestSide,
                                                      child: TextButton(
                                                        onPressed: () async {
                                                          presimagedone = 0;
                                                          Navigator.of(context)
                                                              .pop();
                                                          // await prescameraselectFile();
                                                          //prescription
                                                          List _cameras =
                                                              await availableCameras();
                                                          controller =
                                                              CameraController(
                                                                  _cameras[0],
                                                                  ResolutionPreset
                                                                      .max);

                                                          controller
                                                              .initialize()
                                                              .then((_) {
                                                            if (!mounted) {
                                                              return;
                                                            }
                                                            setState(() {});
                                                          }).catchError(
                                                                  (Object e) {
                                                            if (e
                                                                is CameraException) {
                                                              switch (e.code) {
                                                                case 'CameraAccessDenied':
                                                                  print(
                                                                      'User denied camera access.');
                                                                  break;
                                                                default:
                                                                  print(
                                                                      'Handle other errors.');
                                                                  break;
                                                              }
                                                            }
                                                          });
                                                          presupload = true;
                                                          opencam = true;
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
                                  ),
                                ),
                                if (presimagedone == 0)
                                  Row(
                                    children: [
                                      SizedBox(width: 23),
                                      SizedBox(
                                          width: 108,
                                          child:
                                              Text('Uploading, please wait...'))
                                    ],
                                  ),
                                if (presimagedone == 1)
                                  Row(
                                    children: [
                                      SizedBox(width: 23),
                                      Icon(Icons.cloud_done),
                                      SizedBox(width: 5),
                                      Text('Done')
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Report",
                            style: TextStyle(color: Colors.grey),
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
                                        Text('Add Report')
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
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .longestSide,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            setState(() async {
                                                              repoimagedone = 0;
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              await reportgallaryselectFile();
                                                              repoimagedone = 1;
                                                            });
                                                          },
                                                          child:
                                                              Text("Gallary"),
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .longestSide,
                                                        child: TextButton(
                                                          onPressed: () async {
                                                            repoimagedone = 0;
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            // await reportcameraselectFile();

                                                            List _cameras =
                                                                await availableCameras();
                                                            controller =
                                                                CameraController(
                                                                    _cameras[0],
                                                                    ResolutionPreset
                                                                        .max);

                                                            controller
                                                                .initialize()
                                                                .then((_) {
                                                              if (!mounted) {
                                                                return;
                                                              }
                                                              setState(() {});
                                                            }).catchError(
                                                                    (Object e) {
                                                              if (e
                                                                  is CameraException) {
                                                                switch (
                                                                    e.code) {
                                                                  case 'CameraAccessDenied':
                                                                    print(
                                                                        'User denied camera access.');
                                                                    break;
                                                                  default:
                                                                    print(
                                                                        'Handle other errors.');
                                                                    break;
                                                                }
                                                              }
                                                            });
                                                            repoupload = true;
                                                            opencam = true;
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

                                if (repoimagedone == 0)
                                  Row(
                                    children: [
                                      SizedBox(width: 23),
                                      SizedBox(
                                          width: 108,
                                          child:
                                              Text('Uploading, please wait...'))
                                    ],
                                  ),

                                if (repoimagedone == 1)
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
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                "Doctor's Name": docname,
                                                "Doctor's Mobile": docmobile,
                                                'Prescription': presurlDownlad,
                                                'Report': reporturlDownlad,
                                              }).then((value) =>
                                                Navigator.pushNamed(
                                                    context, "PnR"))
                                            : mainboard.add({
                                                'Date':
                                                    '${date.day}/${date.month}/${date.year}',
                                                'Time':
                                                    '${date.hour}:${date.minute}',
                                                "Doctor's Name": docname,
                                                "Doctor's Mobile": docmobile,
                                                'Prescription': presurlDownlad,
                                                'Report': reporturlDownlad,
                                              }).then((value) =>
                                                Navigator.pushNamed(
                                                    context, "PnR"));
                                      } on FirebaseAuthException catch (e) {
                                        print(e);
                                      }
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Center(
                                        child: Text("SUBMIT",
                                            style:
                                                TextStyle(color: Colors.white)),
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

  //
  // Future presgetgalaryimage() async {
  //   try {
  //     presimages = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (presimages == null) return;
  //     var ImageTemp = File(presimages.path as String);
  //
  //     setState(() {
  //       presimages = ImageTemp;
  //     });
  //     await uploadfile();
  //
  //
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }

  Future prescameraselectFile(result) async {
    // final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.camera);
    // if (result == null) return;

    setState(() {
      prescameraimages = File(result.path);
    });

    await prescamerauploadfile();
  }

  Future prescamerauploadfile() async {
    try {
      final path = 'files/${prescameraimages}';
      final file = File(prescameraimages!.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      presuploadtask = ref.putFile(file);

      final snapshot = await presuploadtask!.whenComplete(() {});
      presurlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $presurlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }

  Future presgallaryselectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      presgallaryimages = result.files.first;
    });

    await presgallaryuploadfile();
  }

  Future presgallaryuploadfile() async {
    try {
      final path = 'files/${presgallaryimages}';
      final file = File(presgallaryimages!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      presuploadtask = ref.putFile(file);

      final snapshot = await presuploadtask!.whenComplete(() {});
      presurlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $presurlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }

  Future reportgallaryselectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      reportgallaryimages = result.files.first;
    });

    await reportgallaryuploadfile();
  }

  Future reportgallaryuploadfile() async {
    try {
      final path = 'files/${reportgallaryimages}';
      final file = File(reportgallaryimages!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      reportuploadtask = ref.putFile(file);

      final snapshot = await reportuploadtask!.whenComplete(() {});
      reporturlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $reporturlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }

  Future reportcameraselectFile(result) async {
    // final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.camera);
    // if (result == null) return;
    print("Report started");
    setState(() {
      reportcameraimages = File(result.path);
    });

    await reportcamerauploadfile();
  }

  Future reportcamerauploadfile() async {
    try {
      final path = 'files/${reportcameraimages}';
      final file = File(reportcameraimages!.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      reportuploadtask = ref.putFile(file);

      final snapshot = await reportuploadtask!.whenComplete(() {});
      reporturlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $reporturlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }
}
