import 'package:firebasetut/pages/DashBoard/Log%20Sugar/getsugardata.dart';
import 'package:firebasetut/pages/FirebaseData.dart';
import 'package:firebasetut/pages/drawerwidgets.dart';
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
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Sugar/Blood Glucose",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawerwidgets(drawerusername: universalnamefordrawer),
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
              SizedBox(height: 25,),
              Expanded(
                  child: getsugardata()),
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
