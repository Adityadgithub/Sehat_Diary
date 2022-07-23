// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';



//  var uname;
//   var unewEmail;
//   var unewPassword;
//   var uhospitalname;
//   var uspeciality;
//   var udegree;
//   var uaddress;
//   int? unumber;
//   var ulicense_num;
// class getusertdetails extends StatelessWidget {
//   final String documentId;

//   getusertdetails({required this.documentId});


//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('Doctor');
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           uname = data['Name'];
//           unewEmail = data['Email'];
//           unewPassword = data['password'];
//           uhospitalname = data['Hospital Name'];
//           uspeciality = data['Speciality'];
//           udegree = data['Degree'];
//           uaddress = data['Address'];
//         }
//         return Text("loading...");
//       }),
//     );
//   }
// }
