import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/AddBp.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/BloodPressure.dart';
import 'package:firebasetut/pages/DashBoard/Blood%20Pressure/getbpdata.dart';

import 'package:firebasetut/pages/DashBoard/Dashboard.dart';
import 'package:firebasetut/pages/DashBoard/Heart%20Rate/Add_Heartrate.dart';
import 'package:firebasetut/pages/DashBoard/Heart%20Rate/getheartdata.dart';
import 'package:firebasetut/pages/DashBoard/Heart%20Rate/heartrate.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Add_Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/Sugar.dart';
import 'package:firebasetut/pages/DashBoard/Log%20Sugar/getsugardata.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/Add_Medicine.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/Medicine.dart';
import 'package:firebasetut/pages/DashBoard/Medicine/getmedicinedata.dart';
import 'package:firebasetut/pages/DashBoard/Prescription%20and%20Report/Add_P&R.dart';
import 'package:firebasetut/pages/DashBoard/Prescription%20and%20Report/P&R.dart';
import 'package:firebasetut/pages/DashBoard/Prescription%20and%20Report/getp&rdata.dart';

import 'package:firebasetut/pages/DashBoard/Weight/Add_Weight.dart';
import 'package:firebasetut/pages/DashBoard/Weight/Weight.dart';
import 'package:firebasetut/pages/DashBoard/Weight/getweightdata.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';

import 'package:firebasetut/pages/common/login.dart';
import 'package:firebasetut/pages/common/signup.dart';

import 'package:firebasetut/pages/doctor/doctorprofilepage.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';

import 'package:firebasetut/pages/user/addmember/multipleprofile.dart';
import 'package:firebasetut/pages/user/emergency/emergency.dart';
import 'package:firebasetut/pages/user/emergency/managecontacts/addcontact.dart';
import 'package:firebasetut/pages/user/emergency/managecontacts/contacts.dart';

import 'package:firebasetut/pages/user/userprofilepage.dart';
import 'package:firebasetut/pages/user/addmember/addmemsignupfields.dart';
import 'package:firebasetut/pages/user/usersignupfields.dart';
import 'package:firebasetut/splashscreen.dart';
import 'package:flutter/material.dart';

import 'select_title/Select_title.dart';

void main() async {
  //Initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Running Root Widget
  runApp(MyApp());
}

//Root Widget
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Hiding debug banner
      debugShowCheckedModeBanner: false,

      //Naming routes to use in navigation
      routes: {
        "/": (context) => Selecttitle(),
        "signup": (context) => SignUp(),
        "login": (context) => login(),
        "profilepage": (context) => doctorprofilepage(),
        "SearchPatient": (context) => SearchPatient(),
        "Emergency": (context) => Emergency(),
        "Contact": (context) => Contact(),
        "addcontacts": (context) => addcontacts(),
        "Firebasecard": (context) => Firebasecard(),
        "UserProfilePage": (context) => UserProfilePage(),
        "UserSignupFields": (context) => UserSignupFields(),
        "MultipleProfile": (context) => MultipleProfile(),
        "AddMemberSignuFields": (context) => AddMemberSignuFields(),
        "Selecttitle": (context) => Selecttitle(),
        "Dashboard": (context) => Dashboard(),
        "Sugar": (context) => Sugar(),
        "AddSugar": (context) => AddSugar(),
        "getsugardata": (context) => getsugardata(),
        "BloodPressure": (context) => BloodPressure(),
        "AddBp": (context) => AddBp(),
        "getbpdata": (context) => getbpdata(),
        "Weight": (context) => Weight(),
        "AddWeight": (context) => AddWeight(),
        "getweightdata": (context) => getweightdata(),
        "Medicine": (context) => Medicine(),
        "AddMedicine": (context) => AddMedicine(),
        "getweightdata": (context) => getmedicinedata(),
        "PnR": (context) => PNR(),
        "AddPnR": (context) => AddPnR(),
        "getpnrdata": (context) => getpnrdata(),
        "AddHeart": (context) => AddHeart(),
        "HeartRate": (context) => HeartRate(),
        "getheartdata": (context) => getheartdata(),
      },
    );
  }
}
