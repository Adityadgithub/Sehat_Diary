import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class dstest extends StatefulWidget {
  const dstest({Key? key}) : super(key: key);
  @override
  State<dstest> createState() => _dstestState();
}

class _dstestState extends State<dstest> {
  var couldname;
  CollectionReference? collectionRefrence;
  var id = FirebaseAuth.instance.currentUser!.uid;

  var myUsername;

  var snapshot;
  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get(); //get the data
    snapshot = data;
    myUsername = (snapshot.data()!)['Name'].toString();
  }

  _finaldata() async {
    await FirebaseFirestore.instance.collection("users").get().then((event) {
      for (var doc in event.docs) {
       
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  String? _userName;

  fetchData() {
    collectionRefrence = FirebaseFirestore.instance.collection('User');

    collectionRefrence?.snapshots().listen((snapshot) {
      setState(() {
        couldname = snapshot.docs[0].data();
      });
    });
  }

  // _getUserName() async {
  //   print("atyudf");
  //   FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc((await FirebaseAuth.instance.currentUser)!.uid)
  //       .get()
  //       .catchError((e) {
  //     print(e);
  //   }).then((value) {
  //     setState(() {
  //       _userName = (value.data()!)['Name'].toString();
  //     });
  //   });
  // }

  // Future<User> getData() async {
  //   final user = await collectionRefrence!.doc('$userid');
  //   print("AYY : $user");
  //   return user as Future<User>;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (id != null) Text('$id'),
        TextButton(
            onPressed: () {
              setState(() {});
              fetchData();
            },
            child: Text("Namee : $couldname")),
        TextButton(
            onPressed: () async {
              setState(() {
                _signOut();
                collectionRefrence = null;
                couldname = null;
              });
            },
            child: Text("Signout"))
      ],
    )));
  }

  Future<void> _signOut() async {
    FirebaseAuth.instance.authStateChanges();
    await FirebaseAuth.instance.signOut();
  }
}
