// this Code is responsible to Connect to firebase and
// search for the user with their sehat-id.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetut/pages/common/drawerwidgets.dart';
import 'package:firebasetut/pages/common/profilecard.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({Key? key}) : super(key: key);

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

bool datanotfound = false;
var doctoraccessgetusersehatid;

class _SearchPatientState extends State<SearchPatient> {
  var search;
  bool isexecuted = false;
  QuerySnapshot? snapshotData;
  TextEditingController searchcontroller = TextEditingController();

  DataController? buildvalue;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      datanotfound = false;
      return ListView.builder(
        itemCount: snapshotData!.docs.length,
        itemBuilder: (BuildContext context, int index) {
          print("Lenght data - ${snapshotData!.docs.length}");
          return Row(
            children: [
              Profilecard(
                name: (snapshotData!.docs[index])['Name'],
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                searchpatientpressed = false;
                await Navigator.pushNamed(context, 'Firebasecard');
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              )),
          actions: [
            //Widget to - Connect to firebase and search for the user
            GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                buildvalue = val;
                return IconButton(
                    onPressed: () {
                      builddata(val);
                      builddata(val);
                    },
                    icon: Icon(Icons.search));
              },
            ),
          ],
          //Widget to - Type the user's sehat-id.
          title: TextFormField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
            controller: searchcontroller,
          ),
        ),

        //Widget to - Call searchdata class
        body: isexecuted == true
            ? searchedData()
            : Center(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(width: 5),
                      Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "sehat-id",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          )),
                      SizedBox(width: 5),
                      Text(
                        "to get the user's details.",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  builddata(val) {
    if (datanotfound == false) {
      val.querydata(searchcontroller.text).then((value) {
        setState(() {
          snapshotData = value;
          if (snapshotData!.docs.length == 1) {
            datanotfound = false;
            isexecuted = true;
          } else {
            datanotfound = true;
            isexecuted = false;
          }
        });
      });
    } else if (datanotfound == true) {
      print("Family exe");

      val.querydata(searchcontroller.text).then((value) {
        setState(() {
          snapshotData = value;
          isexecuted = true;
          datanotfound = false;
        });
      });
    }
  }
}

//Widget to - Perform search in the location specified in Firebase.
class DataController extends GetxController {
  var nameofmember;

  var mainuserid;

  CollectionReference<Map<String, dynamic>>? document;

  Future querydata(String querysearch) async {
    doctoraccessgetusersehatid = querysearch;
    if (datanotfound == false) {
      document = FirebaseFirestore.instance
          .collection('User')
          .doc(querysearch)
          .collection('MainUser');
      // var test = document!.get();
      // QuerySnapshot snapshot = test as QuerySnapshot<Object?>;
      // print("Test value ${snapshot.docs.length}");
      // print("Test value ${document}");

      familymempressed = false;
    } else if (datanotfound == true) {
      document = FirebaseFirestore.instance
          .collection('clonedataforsearch')
          .doc(querysearch)
          .collection('path');
      print("Test value $document");
      familymempressed = true;
    }

    return document!.get();
  }
}

// Future querydata(String querysearch) async {
//   return FirebaseFirestore.instance
//       .collection('User')
//       .doc(querysearch)
//       .collection('MainUser')
//       .get();
// }
