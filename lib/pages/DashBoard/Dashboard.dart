// Following code is responsible to display a Dashboard page/screen and navigate
// to different pages specified in respective sub/child widgets.

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/getbpdata.dart';
import 'package:firebasetut/pages/DashBoard/Heart%20Rate/getheartdata.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/getsugardata.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/getmedicinedata.dart';
import 'package:firebasetut/pages/DashBoard/Vaccine/getvaccinedata.dart';
import 'package:firebasetut/pages/DashBoard/Weight/getweightdata.dart';
import 'package:firebasetut/pages/Firebase/Firebasefamilymemdata.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/drawerwidgets.dart';
import 'package:firebasetut/pages/common/profilecard.dart';

import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

var generaterepo = false;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            // Back button
            leading: IconButton(
                onPressed: () async {
                  // If the user is not inside dashboard of any other user (family member)
                  // then back button open either profile page or search patient page
                  // according to current flow (login as).
                  if (familymempressed == false) {
                    // If current flow is of User then it will open Profile page
                    if (doctoraccessgetusersehatid == null) {
                      await Navigator.pushNamed(context, 'Firebasecard');
                      return membername;
                    }

                    // If current flow is of Doctor then it will open Search Patient page
                    else {
                      membername = null;
                      await Navigator.pushReplacementNamed(
                          context, 'SearchPatient');
                      return membername;
                    }
                  }

                  // If the user is inside dashboard of any other user (family member)
                  // then back button open either Switch profile page or search patient page
                  // according to current flow (login as).
                  else {
                    // If current flow is of User then it will open Switch profile page
                    if (doctoraccessgetusersehatid == null) {
                      membername = null;
                      await Navigator.pushReplacementNamed(
                          context, 'MultipleProfile');
                      return membername;
                    }
                    // If current flow is of Doctor then it will open Search Patient page
                    else {
                      membername = null;
                      await Navigator.pushReplacementNamed(
                          context, 'SearchPatient');
                      return membername;
                    }
                  }
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.blue,
                )),
            actions: [
              // This will detect device back button and will perform the same action
              // as the back button in the appbar.
              WillPopScope(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onWillPop: () async {
                    // If the user is not inside dashboard of any other user (family member)
                    // then back button open either profile page or search patient page
                    // according to current flow (login as).
                    if (familymempressed == false) {
                      membername = null;
                      familymempressed = false;
                      await Navigator.pushReplacementNamed(
                          context, 'Firebasecard');
                      return membername;
                    } else if (familymempressed == true) {
                      membername = null;
                      familymempressed = false;
                      await Navigator.pushReplacementNamed(
                          context, 'SearchPatient');
                      return membername;
                    }

                    // If the user is inside dashboard of any other user (family member)
                    // then back button open either Switch profile page or search patient page
                    // according to current flow (login as).
                    else {
                      if (doctoraccessgetusersehatid == null) {
                        membername = null;
                        await Navigator.pushReplacementNamed(
                            context, 'MultipleProfile');
                        return membername;
                      } else {
                        membername = null;
                        await Navigator.pushReplacementNamed(
                            context, 'SearchPatient');
                        return membername;
                      }
                    }
                  })
            ],
            centerTitle: true,
            backgroundColor: Colors.white,

            // Appbar Title
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),

          //Drawer
          drawer: familymempressed == false
              ? Drawerwidgets(
                  drawerimage: universalimagefordrawer,
                  drawerusername: universalnamefordrawer,
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Following is the Field to display Sehat-Id of the specific user.
                  if (familymempressed == true && searchpatientpressed == false)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: membersehatid,
                          enableSuggestions: true,
                          validator: (value) {
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Icon(Icons.key),
                            ),
                            suffixIcon: TextButton(
                              child: Icon(Icons.copy),
                              onPressed: () {
                                FlutterClipboard.copy(membersehatid);
                              },
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 111, 111, 111)),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),

                  // Sub-title
                  Row(
                    children: [
                      Text(
                        "Health Trackers",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),

                  // Button to open Sugar page
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "Sugar");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/sugar.jpg"),
                                        radius: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text("Log Sugar",
                                          style: TextStyle(color: Colors.black))
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "BloodPressure");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/images/bp.jpg"),
                                        radius: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Blood Pressure",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),

                            // Button to open Weight page
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "Weight");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/weight.png"),
                                        radius: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Track Weight",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "Medicine");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/medicine.jpg"),
                                        radius: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Track Medicine",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),

                            // Button to open Heartrate page
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "HeartRate");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/heartrate.png"),
                                        radius: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Heart Rate",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'PnR');
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/images/PnR.png"),
                                        radius: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Text(
                                            "Prescription",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "& Reports",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),

                            // Button to open Vaccine page
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "Vaccine");
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/vaccine.png"),
                                    radius: 50,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Vaccine",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Button to open GenerateRepo page
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextButton(
                        onPressed: () {
                          generaterepo = true;

                          Navigator.pushNamed(context, 'GenerateRepo');
                        },
                        child: Text(
                          'Generate Report',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
