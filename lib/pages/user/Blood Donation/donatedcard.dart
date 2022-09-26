import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class donatedcard extends StatefulWidget {
  var patientname;
  var patientcontact;
  var patientage;
  var bloodgrp;

  var address;

  var date;
  var time;

  donatedcard({
    this.patientname,
    this.date,
    this.time,
    this.patientcontact,
    this.patientage,
    this.bloodgrp,
    this.address,
  });

  @override
  State<donatedcard> createState() => __donatedcardState(
        date: date,
        time: time,
        address: address,
        patientname: patientname,
        patientcontact: patientcontact,
        patientage: patientage,
        bloodgrp: bloodgrp,
      );
}

class __donatedcardState extends State<donatedcard> {
  var patientname;
  var patientcontact;
  var patientage;
  var bloodgrp;

  var address;

  var date;
  var time;

  bool donated = false;
  DateTime datenow = DateTime.now();

  __donatedcardState(
      {this.date,
      this.time,
      this.patientname,
      this.patientcontact,
      this.patientage,
      this.bloodgrp,
      this.address});

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
                          'Donated to : ',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood group donated : ',
                                style: TextStyle(fontSize: 15)),
                            Text(
                              '$bloodgrp',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text('Quantity: ', style: TextStyle(fontSize: 15)),
                        //     Text(
                        //       'liter ltr',
                        //       style: TextStyle(
                        //           fontSize: 15, fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('On Date : ', style: TextStyle(fontSize: 15)),
                        Text(
                          '$date',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
