//Widget responsible to Manage, Display and add contact using Firebase.

import 'package:firebasetut/pages/user/emergency/managecontacts/getcontactdata.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //back button
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Emergency');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Contacts",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),

        // Button to navigate to Add contact page.
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'addcontacts');
            },
            child: Icon(Icons.person_add_alt_rounded)),

        //Widget to Call getcontactsdata to connect to firebase and get all the data.
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: getcontactdata(),
            ),
          ]),
        ),
      ),
    );
  }
}
