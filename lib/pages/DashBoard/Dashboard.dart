import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
var whichboard;
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
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
                                  onPressed: () {Navigator.pushNamed(context, "BloodPressure");},
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/bp.jpg"),
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
                                  onPressed: () {Navigator.pushNamed(context, "Weight");},
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
                                  onPressed: () {Navigator.pushNamed(context, "Medicine");},
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                        AssetImage("assets/images/medicine.jpg"),
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
                            TextButton(
                              onPressed: () {
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage("assets/images/heartrate.png"),
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

