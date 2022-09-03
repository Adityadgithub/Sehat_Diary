// Following includes the main Function, root widget and routes for different widget.
// This will be first called to start the application and navigate to different widgets.

// TO_DO's :-
// 1. customise insurance accroding to age
// 2. building pdf
// 3. validation in add member page

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetut/pages/DashBoard/Allergies/Add_Allergies.dart';
import 'package:firebasetut/pages/DashBoard/Allergies/Allergy.dart';
import 'package:firebasetut/pages/DashBoard/Allergies/getallergiesdata.dart';
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
import 'package:firebasetut/pages/DashBoard/Vaccine/Add_vaccine.dart';
import 'package:firebasetut/pages/DashBoard/Vaccine/Vaccine.dart';
import 'package:firebasetut/pages/DashBoard/Vaccine/getvaccinedata.dart';

import 'package:firebasetut/pages/DashBoard/Weight/Add_Weight.dart';
import 'package:firebasetut/pages/DashBoard/Weight/Weight.dart';
import 'package:firebasetut/pages/DashBoard/Weight/getweightdata.dart';
import 'package:firebasetut/pages/DashBoard/generaterepo.dart';
import 'package:firebasetut/pages/Firebase/FirebaseloginData.dart';
import 'package:firebasetut/pages/common/camerawidget.dart';

import 'package:firebasetut/pages/common/login.dart';
import 'package:firebasetut/pages/common/signup.dart';

import 'package:firebasetut/pages/doctor/doctorprofilepage.dart';
import 'package:firebasetut/pages/doctor/doctorsignupfields.dart';
import 'package:firebasetut/pages/doctor/searchpatient/searchpatient.dart';
import 'package:firebasetut/pages/user/Blood%20Donation/AddBdreq.dart';
import 'package:firebasetut/pages/user/Blood%20Donation/blooddonation.dart';
import 'package:firebasetut/pages/user/Blood%20Donation/getbdreqdata.dart';

import 'package:firebasetut/pages/user/Insurance/child/child.dart';
import 'package:firebasetut/pages/user/Insurance/family/family.dart';

import 'package:firebasetut/pages/user/Insurance/health/health.dart';

import 'package:firebasetut/pages/user/Insurance/insurance.dart';
import 'package:firebasetut/pages/user/Insurance/life/life.dart';
import 'package:firebasetut/pages/user/Insurance/medical/medical.dart';
import 'package:firebasetut/pages/user/Insurance/parents/parents.dart';

import 'package:firebasetut/pages/user/Insurance/term/term.dart';

import 'package:firebasetut/pages/user/addmember/multipleprofile.dart';
import 'package:firebasetut/pages/user/emergency/emergency.dart';
import 'package:firebasetut/pages/user/emergency/managecontacts/addcontact.dart';
import 'package:firebasetut/pages/user/emergency/managecontacts/contacts.dart';
import 'package:firebasetut/pages/user/sehatgyan/playvideo.dart';
import 'package:firebasetut/pages/user/sehatgyan/sehatgyan.dart';
import 'package:firebasetut/pages/user/sehatgyan/videoscreen.dart';

import 'package:firebasetut/pages/user/userprofilepage.dart';
import 'package:firebasetut/pages/user/addmember/addmemsignupfields.dart';
import 'package:firebasetut/pages/user/usersignupfields.dart';
import 'package:firebasetut/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'select_title/Select_title.dart';

void main() async {
  //Initializing Firebase

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // debugRepaintRainbowEnabled = true;

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
        "/": (context) => SplashScreen(),
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
        "DoctorSignupFields": (context) => DoctorSignupFields(),
        "MultipleProfile": (context) => MultipleProfile(),
        "AddMemberSignuFields": (context) => AddMemberSignuFields(),
        "Selecttitle": (context) => Selecttitle(),
        "Dashboard": (context) => Dashboard(),
        "GenerateRepo": (context) => GenerateRepo(),
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
        "getmedicinedata": (context) => getmedicinedata(),
        "PnR": (context) => PNR(),
        "AddPnR": (context) => AddPnR(),
        "getpnrdata": (context) => getpnrdata(),
        "AddHeart": (context) => AddHeart(),
        "HeartRate": (context) => HeartRate(),
        "getheartdata": (context) => getheartdata(),
        "AddVaccine": (context) => AddVaccine(),
        "Vaccine": (context) => Vaccine(),
        "getvaccinedata": (context) => getvaccinedata(),

        "AddAllergy": (context) => AddAllergy(),
        "Allergy": (context) => Allergy(),
        "getallergydata": (context) => getallergydata(),

        "AddBd": (context) => AddBd(),
        "BloodDonation": (context) => BloodDonation(),
        "getbddata": (context) => getbddata(),

        "insurance": (context) => insurance(),
        "Childinsurance": (context) => Childinsurance(),
        "Healthinsurance": (context) => Healthinsurance(),
        "Lifeinsurance": (context) => Lifeinsurance(),
        "Familyinsurance": (context) => Familyinsurance(),
        "Parentsinsurance": (context) => Parentsinsurance(),
        "Medicalinsurance": (context) => Medicalinsurance(),
        "Terminsurance": (context) => Terminsurance(),
        "sehatgyan": (context) => SehatGyan(),
        "PlayVideo": (context) => PlayVideo(),
        // "CameraWidget": (context) => CameraWidget()
      },
    );
  }
}
