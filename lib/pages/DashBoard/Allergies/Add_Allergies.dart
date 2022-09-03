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

class AddAllergy extends StatefulWidget {
  const AddAllergy({Key? key}) : super(key: key);

  @override
  State<AddAllergy> createState() => _AddAllergyState();
}

class _AddAllergyState extends State<AddAllergy> {
  var mainboard = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Allergy')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('MainUser')
          .doc('Dashboard')
          .collection('Allergy');

  var family = doctoraccessgetusersehatid == null
      ? FirebaseFirestore.instance
          .collection('User')
          .doc(universalsehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Allergy')
      : FirebaseFirestore.instance
          .collection('User')
          .doc(doctoraccessgetusersehatid)
          .collection('Family member')
          .doc(membername)
          .collection('Dashboard')
          .doc('path')
          .collection('Allergy');

  TextEditingController Licensenumcontroller = TextEditingController();

  var auth = FirebaseAuth.instance;
  var store = FirebaseFirestore.instance;
  var sugarlvl;
  final categoryitems = [
    'Drug Allergy',
    'Food Allergy',
    'Environment Allergy',
    'Insect Allergy',
    'Others'
  ];
  var categoryselecteditem = 'Drug Allergy';
  //
  final drugitems = [
    'Antibiotics',
    'Nonsteroidal A-I',
    'Aspirin',
    'Sulfa',
    'Monoclonal',
    'HIV',
    'Insulin',
    'Antiseizure',
    'Muscle relaxers'
  ];
  var drugselecteditem = 'Antibiotics';
  final fooditems = [
    'Dairy',
    'Lactose I.',
    'Peanuts',
    'Potato',
    'Cabbage',
    'Cauliflowers',
    'Sea food',
    'Maida',
  ];
  var foodselecteditem = 'Dairy';
  final Enviitems = [
    'Pollen',
    'Dust',
    'Mold',
    'Smoke',
    'Pet hair',
    'Pet Danter'
  ];
  var Enviselecteditem = 'Pollen';

  final Petitems = [
    'Bees',
    'wasps',
    'hornets',
    'yellow-jackets',
    'fire ants',
    'mosquitoes',
    'flies'
  ];
  var Petselecteditem = 'Bees';

  DateTime date = DateTime.now();

  late Timer _timer;
  var mainorfamily;

  var allergyname = 'Antibiotics';

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
    if (categoryselecteditem == "Others") {
      if (formkey.currentState!.validate()) {
        return true;
      }
    } else if (categoryselecteditem != "Others") {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Dashboard');
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Add Allergies Details",
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
                SizedBox(height: 25),
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
                      onChanged: (categoryitem) {
                        setState(() {
                          categoryselecteditem = categoryitem as String;
                        });
                      },
                      value: categoryselecteditem,
                      items: categoryitems
                          .map((categoryitem) => DropdownMenuItem(
                              value: categoryitem, child: Text(categoryitem)))
                          .toList()),
                ),
                SizedBox(height: 15),
                if (categoryselecteditem == "Drug Allergy")
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
                        onChanged: (drugitem) {
                          setState(() {
                            drugselecteditem = drugitem as String;
                            allergyname = drugselecteditem;
                          });
                        },
                        value: drugselecteditem,
                        items: drugitems
                            .map((drugitem) => DropdownMenuItem(
                                value: drugitem, child: Text(drugitem)))
                            .toList()),
                  ),
                if (categoryselecteditem == "Food Allergy")
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
                        onChanged: (fooditem) {
                          setState(() {
                            foodselecteditem = fooditem as String;
                            allergyname = foodselecteditem;
                          });
                        },
                        value: foodselecteditem,
                        items: fooditems
                            .map((fooditem) => DropdownMenuItem(
                                value: fooditem, child: Text(fooditem)))
                            .toList()),
                  ),
                if (categoryselecteditem == "Environment Allergy")
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
                        onChanged: (Enviitem) {
                          setState(() {
                            Enviselecteditem = Enviitem as String;
                            allergyname = Enviselecteditem;
                          });
                        },
                        value: Enviselecteditem,
                        items: Enviitems.map((Enviitem) => DropdownMenuItem(
                            value: Enviitem, child: Text(Enviitem))).toList()),
                  ),
                if (categoryselecteditem == "Insect Allergy")
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
                        onChanged: (Petitem) {
                          setState(() {
                            Petselecteditem = Petitem as String;
                            allergyname = Petselecteditem;
                          });
                        },
                        value: Petselecteditem,
                        items: Petitems.map((Petitem) => DropdownMenuItem(
                            value: Petitem, child: Text(Petitem))).toList()),
                  ),
                SizedBox(height: 15),
                if (categoryselecteditem == "Others")
                  Form(
                    key: formkey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field can't be empty";
                        }

                        if (value.length < 5) {
                          return "name should have at least 5 character";
                        }
                        if (value.contains(',')) {
                          return "Invalid input, value can't contain {@#(),-;:=<>?!}";
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
                          allergyname = value;
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
                          child: Icon(Icons.airline_seat_flat_rounded),
                        ),
                        hintText: "Enter Allergy",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 111, 111, 111)),
                      ),
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
                                      'Time': '${date.hour}:${date.minute}',
                                      'Category': categoryselecteditem,
                                      'Allergy': allergyname,
                                    }).then((value) =>
                                      Navigator.pushNamed(context, "Allergy"))
                                  : mainboard.add({
                                      'Date':
                                          '${date.day}/${date.month}/${date.year}',
                                      'Time': '${date.hour}:${date.minute}',
                                      'Category': categoryselecteditem,
                                      'Allergy': allergyname,
                                    }).then((value) =>
                                      Navigator.pushNamed(context, "Allergy"));
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
          )),
    );
  }
}
