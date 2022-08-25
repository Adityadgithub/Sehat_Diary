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

var doctoraccessgetusersehatid;
var usertypeitems = [
  '''Main
user''',
  '''Family 
mem.''',
];
var usertypeselecteditem = '''Main
user''';

class _SearchPatientState extends State<SearchPatient> {
  var search;
  bool isexecuted = false;
  QuerySnapshot? snapshotData;
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData!.docs.length,
        itemBuilder: (BuildContext context, int index) {
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
              SizedBox(
                width: 90,
                child: DropdownButtonFormField<String>(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 230, 255),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onChanged: (usertypeitem) {
                      setState(() {
                        usertypeselecteditem = usertypeitem as String;
                      });
                    },
                    value: usertypeselecteditem,
                    items: usertypeitems
                        .map((usertypeitem) => DropdownMenuItem(
                            value: usertypeitem, child: Text(usertypeitem)))
                        .toList()),
              ),

              //Widget to - Connect to firebase and search for the user
              GetBuilder<DataController>(
                init: DataController(),
                builder: (val) {
                  return IconButton(
                      onPressed: () {
                        setState(() {
                          val.querydata(searchcontroller.text).then((value) {
                            setState(() {
                              snapshotData = value;
                              isexecuted = true;
                            });
                          });
                        });
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
          body: isexecuted == true ? searchedData() : SizedBox()),
    );
  }
}

//Widget to - Perform search in the location specified in Firebase.
class DataController extends GetxController {
  var document;

  var nameofmember;

  var mainuserid;

  Future querydata(String querysearch) async {
    doctoraccessgetusersehatid = querysearch;
    if (usertypeselecteditem ==
        '''Main
user''') {
      document = FirebaseFirestore.instance
          .collection('User')
          .doc(querysearch)
          .collection('MainUser');

      familymempressed = false;
    } else {
      document = FirebaseFirestore.instance
          .collection('clonedataforsearch')
          .doc(querysearch)
          .collection('path');
      familymempressed = true;
    }
    return document.get();
  }
}

// Future querydata(String querysearch) async {
//   return FirebaseFirestore.instance
//       .collection('User')v
//       .doc(querysearch)
//       .collection('MainUser')
//       .get();
// }
