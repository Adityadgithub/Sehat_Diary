import 'package:firebasetut/pages/user/Blood%20Donation/getbdreqdata.dart';
import 'package:firebasetut/pages/user/Blood%20Donation/getdonated.dart';
import 'package:flutter/material.dart';

import 'bloodbanks.dart';

class BloodDonation extends StatefulWidget {
  const BloodDonation({Key? key}) : super(key: key);

  @override
  _BloodDonationState createState() => _BloodDonationState();
}

class _BloodDonationState extends State<BloodDonation> {
  var date = DateTime.now();
  var currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Firebasecard');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Blood Donation",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  if (currentindex == 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Requests for Donation",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  if (currentindex == 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Track of blood donated ",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),

                  if (currentindex == 2)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Near by blood banks",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),

                  SizedBox(
                    height: 25,
                  ),
                  if (currentindex == 0) Expanded(child: getbddata()),

                  // 1
                  if (currentindex == 1) Expanded(child: getdonated()),

                  // 2                  Bloodbanks
                  if (currentindex == 2) Bloodbanks(),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bloodtype_outlined), label: "Requests"),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory_sharp),
                label: "Donated",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.maps_home_work_outlined),
                label: "Blood banks",
              ),
            ]),
        floatingActionButton: currentindex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'AddBd');
                },
                child: Icon(Icons.add))
            : SizedBox(),
      ),
    );
  }
}
