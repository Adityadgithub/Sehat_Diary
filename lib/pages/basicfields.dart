import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(BasicFields());
}

class BasicFields extends StatefulWidget {
  const BasicFields({Key? key}) : super(key: key);
  @override
  State<BasicFields> createState() => _BasicFieldsState();
}

class _BasicFieldsState extends State<BasicFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Stack(
          children: [
            CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                backgroundImage: AssetImage(
                  "assets/images/profilepic.jpg",
                )),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                    height: 50,
                    child: AlertDialog(
                        title: Text(
                          '''Select an option
        to pick your image''',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                width: MediaQuery.of(context).size.longestSide,
                                child: TextButton(
                                  onPressed: () {
                                    getgalaryimage();
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
                                    borderRadius: BorderRadius.circular(15)),
                                width: MediaQuery.of(context).size.longestSide,
                                child: TextButton(
                                  onPressed: () {
                                    getcamimage();
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
              padding: EdgeInsetsDirectional.only(top: 60, start: 50),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            enableSuggestions: true,
            validator: (value) {
              return null;
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
              labelText: "Full Name",
              labelStyle: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
            ),
            onChanged: (value) {
              // Email = value;
            },
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            enableSuggestions: true,
            validator: (value) {
              return null;
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
              labelText: "Email address",
              labelStyle: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 111, 111, 111)),
            ),
            onChanged: (value) {
              // Email = value;
            },
          ),
        ),
        SizedBox(height: 15),
      ]),
    );
  }

  Future getgalaryimage() async {
    try {
      var images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images == null) return;
      var ImageTemp = File(images.path as String);

      setState(() {
        images = ImageTemp as XFile;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future getcamimage() async {
    try {
      var images = await ImagePicker().pickImage(source: ImageSource.camera);
      if (images == null) return;
      var ImageTemp = File(images.path as String);

      setState(() {
        images = ImageTemp as XFile;
      });
    } on PlatformAdaptiveIcons catch (e) {
      print(e);
    }
  }
}
