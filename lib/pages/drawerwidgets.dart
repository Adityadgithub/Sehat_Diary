import 'package:firebasetut/select_title/Select_title.dart';
import 'package:flutter/material.dart';

var navigatedto;

class Drawerwidgets extends StatefulWidget {
  var drawerusername;
  var drawerimage;
  Drawerwidgets({this.drawerusername,this.drawerimage});
  @override
  State<Drawerwidgets> createState() =>
      _DrawerwidgetsState(drawerusername: drawerusername,drawerimage: drawerimage);
}

class _DrawerwidgetsState extends State<Drawerwidgets> {
  var drawerusername;
  var drawerimage;

  _DrawerwidgetsState({this.drawerusername,this.drawerimage});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.blue[50],
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
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage("$drawerimage")
                            ,
                          ),
                          SizedBox(width: 20),
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
                                    Navigator.pushNamed(context, 'MultipleProfile');
                                  },
                                  child: Text("Switch Profile",
                                      style: TextStyle(color: Colors.blue))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                color: Colors.blue),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 20,
              ),
              child: TextButton(
                onPressed: () {
                  navigatedto = 'profilepage';
                  Navigator.pushNamed(context, 'profilepage');
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.black),
                      SizedBox(
                        width: 15,
                      ),
                      Text("My Profile", style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            if (loginas == 'Doctor')
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    navigatedto = 'profilepage';
                    Navigator.pushNamed(context, 'denalcare');
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.add_box_rounded, color: Colors.black),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Dental Care", style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ),
              ),

            if(loginas == 'User')
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 20,
              ),
              child: TextButton(
                onPressed: () {

                  Navigator.pushNamed(context, 'Dashboard');
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.bubble_chart, color: Colors.black),
                      SizedBox(
                        width: 15,
                      ),
                      Text("DashBoard", style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 20,
              ),
              child: TextButton(
                onPressed: () {
                  navigatedto = 'aboutus';
                  Navigator.pushNamed(context, 'profilepage');
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
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 20,
              ),
              child: TextButton(
                onPressed: () {
                  navigatedto = 'settings';
                  Navigator.pushNamed(context, 'profilepage');
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
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                bottom: 5,
              ),
              child: TextButton(
                onPressed: () {
                  navigatedto = 'logout';
                  Navigator.pushNamed(context, 'login');
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
    );
  }
}
