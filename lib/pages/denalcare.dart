import 'package:firebasetut/pages/basicfields.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(DentalCare());
}

class DentalCare extends StatefulWidget {
  const DentalCare({Key? key}) : super(key: key);
  @override
  State<DentalCare> createState() => _DentalCareState();
}

class _DentalCareState extends State<DentalCare> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawerwidgets(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Add Patient ",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                BasicFields(),
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
                        child: Icon(Icons.photo),
                      ),
                      hintText: "Add Photo",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
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
                        child: Icon(Icons.video_call),
                      ),
                      hintText: "Add Video",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
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
                        child: Icon(Icons.description),
                      ),
                      hintText: "Description",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 111, 111)),
                    ),
                    onChanged: (value) {
                      // Email = value;
                    },
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                      child: Text(
                    "ADD",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
