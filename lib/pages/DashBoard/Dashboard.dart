import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:firebasetut/pages/profilecard.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
                  if(familymempressed == false){

                    await Navigator.pushNamed(
                        context, 'Firebasecard');
                    return membername;
                  }
                  else{
                    membername = null;
                    familymempressed = false;
                    await Navigator.pushNamed(
                        context, 'MultipleProfile');
                    return membername;
                  }
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.blue,
                )),
            actions: [
              WillPopScope(
                  child: Icon(Icons.arrow_back,color: Colors.white,),
                  onWillPop: () async {
                    if(familymempressed == false){
                      membername = null;
                      familymempressed = false;
                      await Navigator.pushReplacementNamed(
                          context, 'Firebasecard');
                      return membername;
                    }
                    else{
                      membername = null;
                      await Navigator.pushReplacementNamed(
                          context, 'MultipleProfile');
                      return membername;
                    }

                  })
            ],
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          drawer: familymempressed == false
              ? Drawerwidgets(
                  drawerimage: universalimagefordrawer,
                  drawerusername: universalnamefordrawer,
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Health Trackers",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
