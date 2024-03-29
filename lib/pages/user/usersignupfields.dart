import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/common/login.dart';
import 'package:firebasetut/pages/common/signup.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string_generator/random_string_generator.dart';
import 'package:image_picker/image_picker.dart';

class UserSignupFields extends StatefulWidget {
  const UserSignupFields({Key? key}) : super(key: key);

  @override
  State<UserSignupFields> createState() => UserSignupFieldsState();
}

var sehatid;

class UserSignupFieldsState extends State<UserSignupFields> {
  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;

  int? profileimagedone;

  var store = FirebaseFirestore.instance;
  bool useropencam = false;
  var controller;
  bool flash = false;
  var uname;
  var usernewEmail;
  var usernewPassword;
  var usernumber;
  var relationshipvalue;
  var dropdownrelationshipvalue;

  final relationitems = [
    'Mother',
    'Father',
    'Wife',
    'Husband',
    'Son',
    'Daughter',
    ' Brother',
    'Sister',
    'Grandfather',
    'Grandmother'
  ];
  var relationselecteditem;

  final genderitems = ['Male', 'Female', 'Other'];
  var genderselecteditem;

  final blooditems = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  var bloodselecteditem;

  DateTime date = DateTime(2022, 12, 24);

  bool dateselected = false;

  var dob;
  var _error;

  var profilegallaryimages;

  UploadTask? profileuploadtask;
  File? profilecameraimages;
  String? profileurlDownlad;

  var emptyerror = false;
  late Timer _timer;

  bool validator() {
    if (formkey.currentState!.validate()) {
      if (dob != null && genderselecteditem != null) {
        emptyerror = false;
        return true;
      } else {
        setState(() {
          emptyerror = true;
        });
        return false;
      }
    }
    return false;
  }

//this function will reload the state every second.
//it is required to update the profile image once uploaded.
//Else the Icon will keep showing CircularProgressIndicator (loading icon).
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (useropencam == true) {
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
                          profileimagedone = null;
                          useropencam = false;
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
                            useropencam = false;
                          });
                          await profilecameraselectFile(result);
                          profileimagedone = 1;

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
            "Sign up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              EmptyFieldsAlert(),
              showAlert(),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
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
                            ),
                            if (profileimagedone == 0)
                              CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                  child: CircularProgressIndicator()),
                            if (profileimagedone == 1)
                              CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage('$profileurlDownlad')),
                            IconButton(
                              onPressed: () {
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
                                                        BorderRadius.circular(
                                                            15)),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .longestSide,
                                                child: TextButton(
                                                  onPressed: () {
                                                    setState(() async {
                                                      setState(() {});
                                                      profileimagedone = 0;
                                                      Navigator.of(context)
                                                          .pop();
                                                      await profilegallaryselectFile();
                                                      profileimagedone = 1;
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
                                                        BorderRadius.circular(
                                                            15)),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .longestSide,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    setState(() {});
                                                    profileimagedone = 0;
                                                    Navigator.pop(context);
                                                    List _cameras =
                                                        await availableCameras();
                                                    controller =
                                                        CameraController(
                                                            _cameras[0],
                                                            ResolutionPreset
                                                                .max);

                                                    controller!
                                                        .initialize()
                                                        .then((_) {
                                                      if (!mounted) {
                                                        return;
                                                      }
                                                      setState(() {});
                                                    }).catchError((Object e) {
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
                                                    setState(() {});
                                                    useropencam = true;
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
                              padding: EdgeInsetsDirectional.only(
                                  top: 60, start: 50),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            initialValue: uname != null ? uname : "",
                            enableSuggestions: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name can't be empty";
                              }
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
                              hintText: "Full Name",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                            ),
                            onChanged: (value) {
                              uname = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            enableSuggestions: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              }
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
                            onChanged: (value) {
                              usernewEmail = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a valid password";
                              }
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
                              hintText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                            ),
                            onChanged: (value) {
                              usernewPassword = value;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            enableSuggestions: true,
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
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 111, 111, 111)),
                            ),
                            onChanged: (value) {
                              usernumber = value.toString();
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
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
                                  date = newdate;
                                  dob =
                                      '${date.year}/${date.month}/${date.day}';
                                  dateselected = true;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(width: 15),
                                  dateselected == false
                                      ? Text(
                                          'Date of Birth',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 18),
                                        )
                                      : Text(
                                          '${dob}',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 18),
                                        ),
                                ],
                              )),
                        ),
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
                                  child: Icon(Icons.male),
                                ),
                                hintText: "Choose Gender",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 111, 111, 111)),
                              ),
                              onChanged: (genderitem) {
                                setState(() {
                                  genderselecteditem = genderitem as String;
                                });
                              },
                              value: genderselecteditem,
                              items: genderitems
                                  .map((genderitem) => DropdownMenuItem(
                                      value: genderitem,
                                      child: Text(genderitem)))
                                  .toList()),
                        ),
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
                                  child: Icon(Icons.male),
                                ),
                                hintText: "Blood Group (optional)",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 111, 111, 111)),
                              ),
                              onChanged: (blooditem) {
                                setState(() {
                                  bloodselecteditem = blooditem as String;
                                });
                              },
                              value: bloodselecteditem,
                              items: blooditems
                                  .map((blooditem) => DropdownMenuItem(
                                      value: blooditem, child: Text(blooditem)))
                                  .toList()),
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
                                      final user = await auth
                                          .createUserWithEmailAndPassword(
                                              email: usernewEmail,
                                              password: usernewPassword)
                                          .then((value) {
                                        sehatid =
                                            '''SID${RandomStringGenerator(alphaCase: AlphaCase.UPPERCASE_ONLY, hasAlpha: true, hasDigits: true, fixedLength: 10, hasSymbols: false).generate()}''';
                                        loginpressed == false;
                                        final result = store
                                            .collection('User')
                                            .doc(sehatid)
                                            .collection('MainUser')
                                            .add({
                                          'Image': profileurlDownlad,
                                          'SehatId': sehatid,
                                          'Name': uname,
                                          'Email': usernewEmail,
                                          'Password': usernewPassword,
                                          'Dob': dob,
                                          'Gender': genderselecteditem,
                                          'Blood Group': bloodselecteditem,
                                          'Contact Number': usernumber
                                        });
                                      }).then((value) {
                                        store
                                            .collection('User')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('MainUser')
                                            .add({
                                          'Image': profileurlDownlad,
                                          'SehatId': sehatid,
                                          'Name': uname,
                                          'Email': usernewEmail,
                                          'Password': usernewPassword,
                                          'Dob': dob,
                                          'Gender': genderselecteditem,
                                          'Blood Group': bloodselecteditem,
                                          'Contact Number': usernumber
                                        });
                                      }).then((value) =>
                                              Navigator.pushReplacementNamed(
                                                  context, "Firebasecard"));
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        _error = e.message;
                                      });
                                      print(e);
                                    }
                                  }
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
                                      child: Text("SIGNUP",
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                      await Navigator.pushNamed(
                                          context, "login");
                                    },
                                    child: Text("LOGIN",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
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
                  ]),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget EmptyFieldsAlert() {
    if (emptyerror == true) {
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
            Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Text("Please enter all details")),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline_outlined),
            ),
            Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Text("$_error")),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  void getvalue() {
    setState(() {
      dropdownrelationshipvalue = relationshipvalue;
    });
  }

  Future profilecameraselectFile(result) async {
    // final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.camera);
    // if (result == null) return;
    print("uploaded image");
    setState(() {
      profilecameraimages = File(result.path);
    });

    await profilecamerauploadfile();
  }

  Future profilecamerauploadfile() async {
    try {
      final path = 'files/${profilecameraimages}';
      final file = File(profilecameraimages!.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      profileuploadtask = ref.putFile(file);

      final snapshot = await profileuploadtask!.whenComplete(() {});
      profileurlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $profileurlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }

  Future profilegallaryselectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      profilegallaryimages = result.files.first;
    });

    await profilegallaryuploadfile();
  }

  Future profilegallaryuploadfile() async {
    try {
      final path = 'files/${profilegallaryimages}';
      final file = File(profilegallaryimages!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      profileuploadtask = ref.putFile(file);

      final snapshot = await profileuploadtask!.whenComplete(() {});
      profileurlDownlad = await snapshot.ref.getDownloadURL();
      print('Download Link: $profileurlDownlad');
    } catch (e) {
      print('hey the error is: $e');
    }
  }
}
