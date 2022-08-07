import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasetut/pages/common/signup.dart';

import 'package:firebasetut/select_title/Select_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

import '../user/usersignupfields.dart';

class DoctorSignupFields extends StatefulWidget {
  const DoctorSignupFields({Key? key}) : super(key: key);

  @override
  State<DoctorSignupFields> createState() => _DoctorSignupFieldsState();
}

class _DoctorSignupFieldsState extends State<DoctorSignupFields> {
  TextEditingController Licensenumcontroller = TextEditingController();

  //firebase variables to use in future
  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;

  //variables to store data from fields
  var name;
  var newEmail;
  var newPassword;
  var hospitalname;
  var speciality;
  var degree;
  var address;
  var number;
  var license_num;

//variables to upload profile image
  File? profilecameraimages;
  var profilegallaryimages;
  UploadTask? profileuploadtask;
  int? profileimagedone;

  // this variable will have the network link of photo
  String? profileurlDownlad;

  //validation checking variable
  var _error;

  //validation for fields
  bool validator() {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //validation widget. will appear if there's any error.
            showAlert(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(children: [
                  Container(
                    child: Column(children: [
                      Stack(
                        children: [
                          //Profile image widgets for 3 different situations. No image, Uploading image and after uploading image completely.

                          //Situation 1 : No image uploaded
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          //Situation 2 : Uploading image
                          if (profileimagedone == 0)
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 40,
                                child: CircularProgressIndicator()),
                          //Situation 3 : Uploaded image
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
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                                    Navigator.of(context).pop();
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
                                                  Navigator.of(context).pop();
                                                  await profilecameraselectFile();
                                                  profileimagedone = 1;
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
                            padding:
                                EdgeInsetsDirectional.only(top: 60, start: 50),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
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
                        if (value!.isEmpty) {
                          return "Field can't be empty";
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
                          child: Icon(Icons.local_hospital),
                        ),
                        hintText: "Hospital Name",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
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
                        if (value!.isEmpty) {
                          return "Field can't be empty";
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
                          child: Icon(Icons.stars_rounded),
                        ),
                        hintText: "Speciality",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
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
                        if (value!.isEmpty) {
                          return "Field can't be empty";
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
                          child: Icon(Icons.school),
                        ),
                        hintText: "Degree",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
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
                        if (value!.isEmpty) {
                          return "Field can't be empty";
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
                          child: Icon(Icons.home),
                        ),
                        hintText: "Address",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
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
                        if (value!.isEmpty) {
                          return "Field can't be empty";
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
                        number = value.toString();
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
                        if (value!.isEmpty) {
                          return "Field can't be empty";
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
                          child: Icon(Icons.shield),
                        ),
                        hintText: "License Number",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
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

                            if (validator()) {
                              try {
                                final user = await auth
                                    .createUserWithEmailAndPassword(
                                        email: newEmail, password: newPassword)
                                    .then((value) {
                                  final result = store
                                      .collection(loginas!)
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('MainUser')
                                      .add({
                                    'Image': profileurlDownlad,
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
                                }).then((value) {
                                  Navigator.pushReplacementNamed(
                                      context, "Firebasecard");
                                });
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
          ],
        ),
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
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
            Text("$_error"),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  Future profilecameraselectFile() async {
    // final result = await FilePicker.platform.pickFiles();
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result == null) return;

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

  String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    } else {
      return null!;
    }
  }
}

class EmailValidator {}
