//Following code is responsible to show a drawer in left side of the screen
//which will include button for every specific feature in the app.
//The button have conditons to show differently in user's flow and doctor's flow.

import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

var navigatedto;
bool searchpatientpressed = false;

class Drawerwidgets extends StatefulWidget {
  var drawerusername;
  var drawerimage;
  Drawerwidgets({this.drawerusername, this.drawerimage});
  @override
  State<Drawerwidgets> createState() => _DrawerwidgetsState(
      drawerusername: drawerusername, drawerimage: drawerimage);
}

class _DrawerwidgetsState extends State<Drawerwidgets> {
  var drawerusername;
  var drawerimage;

  _DrawerwidgetsState({this.drawerusername, this.drawerimage});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.blue[50],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),

                        //Profile image widgets for 2 different situations. No image, Uploading image and after uploading image completely.
                        Row(
                          children: [
                            //Situation 1 : No image data
                            if (drawerimage == null)
                              CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 30,
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                  )),

                            //Situation 1 : Image data fetched
                            if (drawerimage != null)
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage("$drawerimage"),
                              ),
                            SizedBox(width: 20),

                            //Display User's/Doctor's name
                            loginas == 'Doctor'
                                ? Text(
                                    "Dr. $drawerusername",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                : Text(
                                    "$drawerusername",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                          ],
                        ),

                        //Button to navigate to Multiple Profile page.
                        //This will display only if current flow is User.
                        if (loginas == 'User')
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, 'MultipleProfile');
                                      },
                                      child: Text("Switch Profile",
                                          style:
                                              TextStyle(color: Colors.blue))),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  color: Colors.blue),
              SizedBox(height: 20),

              //Button to navigate to Profile page.
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    navigatedto = 'profilepage';
                    Navigator.pushNamed(context, 'Firebasecard');
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.black),
                        SizedBox(
                          width: 15,
                        ),
                        Text("My Profile",
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
              ),

              //Button to navigate to SearchPatient page.
              //This will display only if current flow is Doctor.
              if (loginas == 'Doctor')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 20,
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        searchpatientpressed = true;
                      });
                      Navigator.pushNamed(context, 'SearchPatient');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Search Patient",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ),

              //Button to navigate to Dashboard page.
              //This will display only if current flow is User.
              if (loginas == 'User')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 20,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'Dashboard');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.bubble_chart, color: Colors.black),
                          SizedBox(
                            width: 15,
                          ),
                          Text("DashBoard",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ),

              //Button to navigate to insurance page.
              //This will display only if current flow is User.
              if (loginas == 'User')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 20,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'insurance');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.note, color: Colors.black),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Insurance",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ),

              //Button to navigate to Emergency page.
              //This will display only if current flow is User.
              if (loginas == 'User')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 20,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Emergency');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.sos, color: Colors.black),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Emergency ",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ),

              //Button to navigate to SehatGyan page.
              //This will display only if current flow is User.
              if (loginas == 'User')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 20,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'sehatgyan');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.video_collection, color: Colors.black),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sehat Gyan",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ),
              if (loginas == 'User')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 20,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'BloodDonation');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.bloodtype, color: Colors.black),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Blood Donation",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                ),

              //Button to navigate to AboutUs page.
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    navigatedto = 'aboutus';
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.bubble_chart, color: Colors.black),
                        SizedBox(
                          width: 15,
                        ),
                        Text("About us", style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
              ),

              //Button to navigate to Settings page.
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    navigatedto = 'settings';
                    // Navigator.pushNamed(context, 'Firebasecard');
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Setting", style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
              ),

              //Button to Signout and navigate to Login page.
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 5,
                ),
                child: TextButton(
                  onPressed: () {
                    navigatedto = 'logout';
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.black),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
