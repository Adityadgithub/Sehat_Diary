import 'dart:async';

import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/getbpdata.dart';
import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Heart%20Rate/getheartdata.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/getsugardata.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/getmedicinedata.dart';
import 'package:firebasetut/pages/DashBoard/Vaccine/getvaccinedata.dart';
import 'package:firebasetut/pages/DashBoard/Weight/getweightdata.dart';
import 'package:firebasetut/pages/Firebase/Firebasefamilymemdata.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:flutter/material.dart';

class GenerateRepo extends StatefulWidget {
  const GenerateRepo({Key? key}) : super(key: key);

  @override
  State<GenerateRepo> createState() => _GenerateRepoState();
}

double sugarwidgetsnum = 0;
double bpwidgetsnum = 0;
double weightwidgetsnum = 0;
double heartwidgetsnum = 0;
double vaccinewidgetsnum = 0;
double? medwidgetsnum = 0;
double familywidgetsnum = 0;
var pagelenght;

class _GenerateRepoState extends State<GenerateRepo> {
  DateTime date = DateTime.now();

  var _globalkey = GlobalKey();
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pagelenght = 500 +
        bpwidgetsnum! +
        weightwidgetsnum! +
        heartwidgetsnum! +
        vaccinewidgetsnum! +
        familywidgetsnum!;
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              generaterepo = false;
              await Navigator.pushNamed(context, 'Dashboard');
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        actions: [
          WillPopScope(
              child: SizedBox(),
              onWillPop: () async {
                generaterepo = false;
                await Navigator.pushNamed(context, 'Dashboard');
                return generaterepo = false;
              })
        ],
      ),
      //     .then((capturedImage) {
      //   // Handle captured image
      // });

      //             // final bytes = await controller.captureFromWidget(MaterialApp(
      //             //     debugShowCheckedModeBanner: false,
      //             //     home: GenerateRepo(pdfbuttonvalue: true)));
      //             // setState(() {
      //             //   this.bytes = bytes;
      //             // });

      //             await createpdf().catchError((e) {
      //               print("Errorrr: $e");
      //             });
      //             await openpdf();

      //             print("done");
      //             pdfbutton = await false;
      //             setState(() {});

      //             // Page
      //           }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: RepaintBoundary(
            key: _globalkey,
            child: Container(
              height: 5000,
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(192, 0, 187, 212),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/images/logo.png")),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Medical Report",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${date.day}/${date.month}/${date.year}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (universalimagefordrawer == null)
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 40,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                )),
                          if (universalimagefordrawer != null)
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 40,
                                backgroundImage:
                                    NetworkImage('$universalimagefordrawer')),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "$universalnamefordrawer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.black),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // Icon(Icons.square),
                                  Container(
                                    width: 22,
                                    height: 22,
                                    color: Colors.cyan[900],
                                  ),
                                  Container(
                                      color: Colors.cyan,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 1.5,
                                        ),
                                        child: Text(
                                          "PERSONAL INFORMATION",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "Sehat-Id : ",
                                    style: TextStyle(
                                        color: Colors.cyan[900], fontSize: 15),
                                  ),
                                  Text(
                                    "$universalsehatid",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Phone Number : ",
                                    style: TextStyle(
                                        color: Colors.cyan[900], fontSize: 15),
                                  ),
                                  Text(
                                    "+91 $universalcontactnumber",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Email Address : ",
                                    style: TextStyle(
                                        color: Colors.cyan[900], fontSize: 15),
                                  ),
                                  Text(
                                    "$universalemail",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Date of Birth : ",
                                    style: TextStyle(
                                        color: Colors.cyan[900], fontSize: 15),
                                  ),
                                  Text(
                                    "$universaldob",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "Gender : ",
                                    style: TextStyle(
                                        color: Colors.cyan[900], fontSize: 15),
                                  ),
                                  Text(
                                    "$universalgender",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              if (universalbloodgrp != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Blood Group : ",
                                        style: TextStyle(
                                            color: Colors.cyan[900],
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "$universalbloodgrp",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      if (familywidgetsnum! > 2) Divider(color: Colors.black),
                      SizedBox(height: 15),
                      if (familywidgetsnum! > 2)
                        Column(
                          children: [
                            Row(
                              children: [
                                // Icon(Icons.square),
                                Container(
                                  width: 22,
                                  height: 22,
                                  color: Colors.cyan[900],
                                ),
                                Container(
                                    color: Colors.cyan,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 1.5,
                                      ),
                                      child: Text(
                                        "EMERGENCY CONTACTS",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),

                // famdata(),
                if (familywidgetsnum! > 2)
                  ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight:
                            familywidgetsnum == null ? 10 : familywidgetsnum!,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 15, right: 15),
                        child: getfamilymemdata(),
                      )),
                SizedBox(height: 10),
                if ((sugarwidgetsnum! > 2) ||
                    (bpwidgetsnum! > 2) ||
                    (weightwidgetsnum! > 2) ||
                    (heartwidgetsnum! > 2) ||
                    (vaccinewidgetsnum! > 2))
                  Divider(color: Colors.black),
                SizedBox(height: 15),
                if ((sugarwidgetsnum! > 2) ||
                    (bpwidgetsnum! > 2) ||
                    (weightwidgetsnum! > 2) ||
                    (heartwidgetsnum! > 2) ||
                    (vaccinewidgetsnum! > 2))
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Icon(Icons.square),
                            Container(
                              width: 22,
                              height: 22,
                              color: Colors.cyan[900],
                            ),
                            Container(
                                color: Colors.cyan,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 1.5,
                                  ),
                                  child: Text(
                                    "HEALTH RECORDS",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (sugarwidgetsnum! > 2)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Sugar",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                if (sugarwidgetsnum! > 2)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight:
                          sugarwidgetsnum == null ? 10 : sugarwidgetsnum!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: getsugardata(),
                    ),
                  ),
                if (sugarwidgetsnum! > 2)
                  Divider(endIndent: 150, indent: 150, color: Colors.grey),

                if (bpwidgetsnum! > 2)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Blood Pressure",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                if (bpwidgetsnum! > 2)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: bpwidgetsnum == null ? 10 : bpwidgetsnum!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: getbpdata(),
                    ),
                  ),
                if (bpwidgetsnum! > 2)
                  Divider(endIndent: 150, indent: 150, color: Colors.grey),
                if (weightwidgetsnum! > 2)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Weight",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                if (weightwidgetsnum! > 2)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight:
                          weightwidgetsnum == null ? 10 : weightwidgetsnum!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: getweightdata(),
                    ),
                  ),

                if (weightwidgetsnum! > 2)
                  Divider(endIndent: 150, indent: 150, color: Colors.grey),

                if (medwidgetsnum! > 2)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Medicines",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                if (medwidgetsnum! > 2)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: medwidgetsnum == null ? 10 : medwidgetsnum!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: getmedicinedata(),
                    ),
                  ),

                if (medwidgetsnum! > 2)
                  Divider(endIndent: 150, indent: 150, color: Colors.grey),

                if (heartwidgetsnum! > 2)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Heart Rate",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                if (heartwidgetsnum! > 2)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight:
                          heartwidgetsnum == null ? 0.5 : heartwidgetsnum!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: getheartdata(),
                    ),
                  ),
                if (heartwidgetsnum! > 2)
                  Divider(endIndent: 150, indent: 150, color: Colors.grey),

                if (vaccinewidgetsnum! > 2)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Vaccines",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                if (vaccinewidgetsnum! > 2)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight:
                          vaccinewidgetsnum == null ? 10 : vaccinewidgetsnum!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15),
                      child: getvaccinedata(),
                    ),
                  ),
                if (vaccinewidgetsnum! > 2)
                  Divider(endIndent: 150, indent: 150, color: Colors.grey),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
