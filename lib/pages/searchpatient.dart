import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({Key? key}) : super(key: key);

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

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
          return ListTile(
            leading: Text(

                (snapshotData!.docs[index])['Name']),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              GetBuilder<DataController>(
                init: DataController(),
                builder: (val) {
                  return IconButton(onPressed: () {
                    setState(() {
                      val.querydata(searchcontroller.text).then((value) {
                        setState(() {
                          snapshotData = value;
                          isexecuted = true;
                        });
                      });
                    });
                  }, icon: Icon(Icons.search));
                },
              ),
            ],
            title: TextFormField(
              controller: searchcontroller,

            ),
          ),
          body: isexecuted == true ? searchedData() : SizedBox()),
    );
  }
}

class DataController extends GetxController {
  Future querydata(String querysearch) async {
    return FirebaseFirestore.instance
        .collection('User')
        .doc(querysearch)
        .collection('MainUser')
        .where('Name', isGreaterThanOrEqualTo: querysearch)
        .get();
  }
}
