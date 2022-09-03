import 'package:flutter/cupertino.dart';
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
                                height: 50,
                                child: AlertDialog(
                                  title: Text("Contact details - "),
                                  content: SizedBox(
                                    height: 100,
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
              )
            ],
          ),
        ));
  }
}
