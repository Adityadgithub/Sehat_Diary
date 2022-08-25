import 'package:firebasetut/pages/user/Insurance/insurancecard.dart';
import 'package:flutter/material.dart';

class insurance extends StatefulWidget {
  const insurance({Key? key}) : super(key: key);

  @override
  State<insurance> createState() => insuranceState();
}

class insuranceState extends State<insurance> {
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
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  filterQuality: FilterQuality.high,
                  image: AssetImage(
                      "assets/images/insurance/bg/insurancebg3.png")),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 45.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Insurancecard(
                          logosize: 40.0,
                          name: "Health",
                          logo: "assets/images/insurance/health.png"),
                      SizedBox(width: 15),
                      Insurancecard(
                          logosize: 65.0,
                          name: "Family",
                          logo: "assets/images/insurance/family.png")
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Insurancecard(
                          logosize: 60.0,
                          name: "Parents",
                          logo: "assets/images/insurance/parents.png"),
                      SizedBox(width: 15),
                      Insurancecard(
                          logosize: 50.0,
                          name: "Term",
                          logo: "assets/images/insurance/term.png"),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Insurancecard(
                          logosize: 60.0,
                          name: "Life",
                          logo: "assets/images/insurance/life.png"),
                      SizedBox(width: 15),
                      Insurancecard(
                          logosize: 40.0,
                          name: "Child",
                          logo: "assets/images/insurance/child.png")
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Insurancecard(
                          logosize: 40.0,
                          name: "Medical",
                          logo: "assets/images/insurance/medical.png"),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
