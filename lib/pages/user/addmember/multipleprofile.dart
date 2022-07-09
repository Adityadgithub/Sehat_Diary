import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetut/pages/fireabsedatatest.dart';
import 'package:flutter/material.dart';

class MultipleProfile extends StatefulWidget {
  const MultipleProfile({Key? key}) : super(key: key);
  @override
  State<MultipleProfile> createState() => _MultipleProfileState();
}

class _MultipleProfileState extends State<MultipleProfile> {
  var calllqn;

  Future getPost() async {
    var firestore = FirebaseFirestore.instance;
    var qn = await firestore.collection("User").doc().collection('Family').get();
    calllqn = qn.docs;
    print(calllqn);
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 255, 253),
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'AddMemberSignuFields');
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                )),
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 70,
          iconTheme: IconThemeData(color: Colors.blue),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Switch Profile",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
        // body: Text("calllqn"),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Firebasecardtest(),
        ));
  }
}
