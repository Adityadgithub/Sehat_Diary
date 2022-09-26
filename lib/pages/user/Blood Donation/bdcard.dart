import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class bdcard extends StatefulWidget {
  var patientname;
  var patientcontact;
  var patientage;
  var bloodgrp;
  var liter;
  var address;
  var requireddate;
  var locationtype;
  var date;
  var time;

  bdcard(
      {this.patientname,
      this.date,
      this.time,
      this.patientcontact,
      this.patientage,
      this.bloodgrp,
      this.liter,
      this.address,
      this.requireddate,
      this.locationtype});

  @override
  State<bdcard> createState() => __bdcardState(
        date: date,
        time: time,
        address: address,
        patientname: patientname,
        patientcontact: patientcontact,
        patientage: patientage,
        bloodgrp: bloodgrp,
        liter: liter,
        requireddate: requireddate,
        locationtype: locationtype,
      );
}

class __bdcardState extends State<bdcard> {
  var patientname;
  var patientcontact;
  var patientage;
  var bloodgrp;
  var liter;
  var address;
  var requireddate;
  var locationtype;
  var date;
  var time;

  bool donated = false;
  DateTime datenow = DateTime.now();

  __bdcardState(
      {this.date,
      this.time,
      this.patientname,
      this.patientcontact,
      this.patientage,
      this.bloodgrp,
      this.liter,
      this.requireddate,
      this.locationtype,
      this.address});

  var literdonated;

  bool validator() {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$date', 
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '$time',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient Name: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '$patientname',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age: ', style: TextStyle(fontSize: 15)),
                        Text(
                          '$patientage',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(color: Colors.grey),
                    Row(children: [
                      Text(
                        "Requestr for :",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Group: ',
                                style: TextStyle(fontSize: 15)),
                            Text(
                              '$bloodgrp',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Quantity: ', style: TextStyle(fontSize: 15)),
                            Text(
                              '$liter ltr',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Require before: ',
                            style: TextStyle(fontSize: 15)),
                        Text(
                          '$requireddate',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              if (donated == false)
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width - 34,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => Container(
                                  child: AlertDialog(
                                    title: Text("Contact details - "),
                                    content: SizedBox(
                                      height: 170,
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Contact : ",
                                                style: TextStyle(fontSize: 15)),
                                            Text(
                                              '+91 $patientcontact',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Location : ",
                                                style: TextStyle(fontSize: 15)),
                                            Text(
                                              '$locationtype',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Address : ",
                                                style: TextStyle(fontSize: 15)),
                                            Text(
                                              '$address',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            color: Colors.red,
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              // showDialog(
                                              //   context: context,
                                              //   builder: (context) =>
                                              //       AlertDialog(
                                              //     elevation: 0,
                                              //     title: Text("Liter donated"),
                                              //     content: SizedBox(
                                              //       height: 110,
                                              //       child: Column(
                                              //         children: [
                                              //           Flexible(
                                              //             child: TextFormField(
                                              //               inputFormatters: [
                                              //                 LengthLimitingTextInputFormatter(
                                              //                     3),
                                              //               ],
                                              //               validator: (value) {
                                              //                 if (value!
                                              //                     .contains(
                                              //                         ',')) {
                                              //                   return "Invalid input.";
                                              //                 }
                                              //                 if (value!
                                              //                     .contains(
                                              //                         '-')) {
                                              //                   return "Invalid input.";
                                              //                 }
                                              //                 if (value!
                                              //                     .contains(
                                              //                         ' ')) {
                                              //                   return "Invalid input.";
                                              //                 }
                                              //                 if (value!
                                              //                     .isEmpty) {
                                              //                   return "Field can't be empty";
                                              //                 }

                                              //                 if (int.parse(
                                              //                         value) <
                                              //                     0) {
                                              //                   return "value can't be 0";
                                              //                 }
                                              //               },
                                              //               keyboardType:
                                              //                   TextInputType
                                              //                       .number,
                                              //               onChanged: (value) {
                                              //                 setState(() {
                                              //                   literdonated =
                                              //                       value;
                                              //                 });
                                              //               },
                                              //               decoration:
                                              //                   InputDecoration(
                                              //                 filled: true,
                                              //                 fillColor: Color
                                              //                     .fromARGB(
                                              //                         255,
                                              //                         216,
                                              //                         230,
                                              //                         255),
                                              //                 focusedBorder:
                                              //                     OutlineInputBorder(
                                              //                   borderRadius:
                                              //                       BorderRadius
                                              //                           .circular(
                                              //                               5.0),
                                              //                   borderSide:
                                              //                       BorderSide(
                                              //                     color: Colors
                                              //                         .blue,
                                              //                   ),
                                              //                 ),
                                              //                 enabledBorder:
                                              //                     OutlineInputBorder(
                                              //                   borderRadius:
                                              //                       BorderRadius
                                              //                           .circular(
                                              //                               5.0),
                                              //                   borderSide:
                                              //                       BorderSide(
                                              //                     color: Colors
                                              //                         .transparent,
                                              //                     width: 2.0,
                                              //                   ),
                                              //                 ),
                                              //                 prefixIcon: Padding(
                                              //                     padding: const EdgeInsets
                                              //                             .only(
                                              //                         right:
                                              //                             5.0),
                                              //                     child: Icon(Icons
                                              //                         .water_drop)),
                                              //                 hintText: "ltr.",
                                              //                 labelStyle: TextStyle(
                                              //                     fontSize: 20,
                                              //                     color: Color
                                              //                         .fromARGB(
                                              //                             255,
                                              //                             111,
                                              //                             111,
                                              //                             111)),
                                              //               ),
                                              //             ),
                                              //           ),
                                              //           SizedBox(
                                              //             height: 15,
                                              //           ),
                                              //           Row(
                                              //             crossAxisAlignment:
                                              //                 CrossAxisAlignment
                                              //                     .end,
                                              //             mainAxisAlignment:
                                              //                 MainAxisAlignment
                                              //                     .end,
                                              //             children: [
                                              //               Container(
                                              //                 height: 40,
                                              //                 decoration: BoxDecoration(
                                              //                     borderRadius:
                                              //                         BorderRadius
                                              //                             .circular(
                                              //                                 5),
                                              //                     color: Colors
                                              //                         .blue),
                                              //                 child: Padding(
                                              //                   padding: const EdgeInsets
                                              //                           .symmetric(
                                              //                       horizontal:
                                              //                           3.0),
                                              //                   child:
                                              //                       TextButton(
                                              //                     onPressed:
                                              //                         () {
                                              //                       setState(
                                              //                           () {});

                                              //                       Navigator.of(
                                              //                               context)
                                              //                           .pop();
                                              //                       Navigator.of(
                                              //                               context)
                                              //                           .pop();
                                              //                       setState(
                                              //                           () {});
                                              //                     },
                                              //                     child: Text(
                                              //                       "Submit",
                                              //                       style: TextStyle(
                                              //                           color: Colors
                                              //                               .white),
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //               )
                                              //             ],
                                              //           )
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // );
                                              setState(() {});

                                              try {
                                                final result = FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                        'Blood Donation')
                                                    .doc('path')
                                                    .collection('donation')
                                                    .add({
                                                  'Date':
                                                      '${datenow.year}/${datenow.month}/${datenow.day}',
                                                  'Time':
                                                      '${datenow.hour}:${datenow.minute}',
                                                  'Patient Name': patientname,
                                                  'Patient contact':
                                                      patientcontact,
                                                  'Patient Age': patientage,
                                                  'Blood Group': bloodgrp,
                                                  'Liter': literdonated,
                                                  'Address': address,
                                                });
                                              } on FirebaseAuthException catch (e) {
                                                print(e);
                                              }
                                              setState(() {
                                                donated = true;
                                              });

                                              Navigator.of(context).pop();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Mark as donated",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Get Contacts",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ))),
                  ],
                ),
              if (donated == true)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 35,
                        color: Colors.green,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "DONATED",
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 124, 22),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
            ],
          ),
        ));
  }
}
