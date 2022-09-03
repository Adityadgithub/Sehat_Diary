// This code is responsible to perform SOS operation.
// It will add contacts and will send an emergency message with
// user's name, contact number aned current Location.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/user/emergency/managecontacts/getcontactdata.dart';

import 'package:firebasetut/pages/user/userprofilefields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

//check button status.
bool Emergencypressed = false;

//get contatcts.
List<String> recipents = [];

class _EmergencyState extends State<Emergency> {
  Timer? _timer;
  Position? position;
  bool cooldownover = false;

  bool error = false;

  //Function to - Send Sms with all credentials.
  Future _sendSMS(String message, List<String> recipents) async {
    var _result =
        await sendSMS(message: message, recipients: recipents, sendDirect: true)
            .catchError((onError) {
      return print('BAE $onError');
    });
    return print('BAE $_result');
  }

  //Function to - Get user's current location.
  Future getlocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        //back button
        leading: IconButton(
          onPressed: () {
            Emergencypressed = false;
            Navigator.pushNamed(context, 'Firebasecard');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),

        iconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Emergency",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        actions: [
          // This will detect device back button and will perform the same action
          // as the back button in the appbar.
          WillPopScope(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onWillPop: () async {
                Emergencypressed = false;
                error = false;
                Navigator.pushNamed(context, 'Firebasecard');
                return error;
              })
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(alignment: Alignment.center, children: [
                if (Emergencypressed == true && cooldownover == true)

                  // Text Widget. This will display if SOS is active
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Icon(
                          Icons.warning_rounded,
                          size: 75,
                          color: Colors.red,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            textAlign: TextAlign.center,
                            "An Alert messege is sent to your emergency contacts, they will contact you soon, stay calm.",
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        )
                      ]),

                if (error == true)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.amberAccent,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.error_outline_outlined),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text("No contact found")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 0, maxWidth: 0),
                    child: getcontactdata()),

                // Text Widget. will display if SOS is active or inactive respectively.
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Scenario 1: SOS is inactive
                        if (Emergencypressed == false && cooldownover == false)
                          Text(
                            "PRESS THE BUTTON IN CASE OF EMERGENCY",
                            style: TextStyle(color: Colors.grey),
                          ),

                        //Scenario 2: SOS is iactive
                        if (Emergencypressed == true && cooldownover == true)
                          Text(
                            "PRESS THE BUTTON IF YOUR PROBLEM IS SOLVED",
                            style: TextStyle(color: Colors.grey),
                          ),

                        //Scenario 3: SOS is pressed and Cooldown is loaded for 5 sec
                        if (Emergencypressed == true && cooldownover == false)
                          Text(
                            "PLEASE WAIT...",
                            style: TextStyle(color: Colors.grey),
                          ),
                        SizedBox(height: 15),

                        //The Main SOS button, this will call all function onces pressed.
                        if (Emergencypressed == false)
                          TextButton(
                              onPressed: () async {
                                print(
                                    "Here : ${getcontactdataState().contacttest}");
                                if (recipents.length > 0) {
                                  // Updating variables and state.
                                  setState(() {
                                    cooldownover = false;
                                    Emergencypressed = true;
                                  });

                                  // function call to get location
                                  await getlocation();

                                  print('MCC $recipents');

                                  //Message to send
                                  String message = '''HELP! IT'S AN EMERGENCY
Please contact to Mr. $universalnamefordrawer, they need help ASAP.

their contact number : +91$universalcontactnumber
Location : https://maps.google.com/maps?q=loc:${position!.latitude},${position!.longitude}
''';
                                  // function call to send message
                                  await _sendSMS(message, recipents);
                                } else {
                                  setState(() {
                                    error = true;
                                  });
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.red,
                                child: Text(
                                  "SOS",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              )),

                        //Widget to - Display 5sec Countdown onces SOS is pressed
                        if (Emergencypressed == true && cooldownover == false)
                          CircularCountDownTimer(
                            // Countdown duration in Seconds.
                            duration: 5,

                            key: UniqueKey(),

                            // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                            controller: _controller,

                            // Width of the Countdown Widget.
                            width: MediaQuery.of(context).size.width / 2,

                            // Height of the Countdown Widget.
                            height: MediaQuery.of(context).size.height / 2,

                            // Ring Color for Countdown Widget.
                            ringColor: Colors.grey[300]!,

                            // Ring Gradient for Countdown Widget.
                            ringGradient: null,

                            // Filling Color for Countdown Widget.
                            fillColor: Colors.grey[100]!,

                            // Filling Gradient for Countdown Widget.
                            fillGradient: null,

                            // Background Color for Countdown Widget.
                            backgroundColor: Colors.blue[500],

                            // Background Gradient for Countdown Widget.
                            backgroundGradient: null,

                            // Border Thickness of the Countdown Ring.
                            strokeWidth: 20.0,

                            // Begin and end contours with a flat edge and no extension.
                            strokeCap: StrokeCap.round,

                            // Text Style for Countdown Text.
                            textStyle: const TextStyle(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),

                            // Format for the Countdown Text.
                            textFormat: CountdownTextFormat.S,

                            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                            isReverse: true,

                            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                            isReverseAnimation: false,

                            // Handles visibility of the Countdown Text.
                            isTimerTextShown: true,

                            onComplete: () {
                              setState(() {
                                cooldownover = true;
                              });
                            },
                          ),

                        //Widget Button to inactivate SOS and reset values
                        if (Emergencypressed == true && cooldownover == true)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                error = false;
                                Emergencypressed = false;
                              });
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.blue,
                              child: Text(
                                "SOLVED",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                //Widgets that will display according to different Situations.
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Text Widget
                      Row(
                        children: [
                          Text(
                            "Current SOS state :",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Emergencypressed == false
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Emergencypressed == false
                                  ?
                                  // Scenario 1: if SOS is inactive
                                  Text(
                                      "Inactive",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )
                                  :
                                  // Scenario 2: if SOS is active
                                  Text(
                                      "Active",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25),

                      //Widget to navigate to contact page.
                      if (Emergencypressed == false)
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'Contact');
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.quick_contacts_dialer_rounded,
                                        size: 33, color: Colors.white),
                                    SizedBox(width: 15),
                                    Text(
                                      'Manage SOS Contacts',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ],
                                )))
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    ));
  }

  Widget showAlert() {
    if (error == true) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline_outlined),
            ),
            Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Text("No contact found")),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
