import 'package:firebasetut/pages/DashBoard/Log%20Sugar/getsugardata.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
import 'package:firebasetut/pages/profilecard.dart';
import 'package:flutter/material.dart';

class Sugar extends StatefulWidget {
  const Sugar({Key? key}) : super(key: key);

  @override
  _SugarState createState() => _SugarState();
}

class _SugarState extends State<Sugar> {
  var date = DateTime.now();

  final eventitems = ['Before Meal', 'After Meal'];
  var eventselecteditem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'Dashboard');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
          actions: [
            WillPopScope(
                child: Icon(Icons.arrow_back),
                onWillPop: () async {
                  await Navigator.pushNamed(context, 'Dashboard');
                  return null!;
                })
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Track Sugar level",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Track your sugar/blood glucose here",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(child: Expanded(child: getsugardata())),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AddSugar');
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
