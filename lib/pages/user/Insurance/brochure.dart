import 'package:flutter/material.dart';

class Brochure extends StatefulWidget {
  var title;
  var image;

  var copay;

  var covid;

  var maternity;

  var hospitalroom;

  var bonus;

  var restoration;
  var price;
  Brochure(
      {this.image,
      this.title,
      this.copay,
      this.covid,
      this.maternity,
      this.hospitalroom,
      this.bonus,
      this.restoration,
      this.price});

  @override
  State<Brochure> createState() => _BrochureState(
      title: title,
      image: image,
      bonus: bonus,
      copay: copay,
      covid: covid,
      hospitalroom: hospitalroom,
      maternity: maternity,
      restoration: restoration,
      price: price);
}

class _BrochureState extends State<Brochure> {
  var title;
  var image;

  var copay;

  var covid;

  var maternity;

  var hospitalroom;

  var bonus;

  var restoration;

  var price;
  bool drop = false;

  _BrochureState(
      {this.image,
      this.title,
      this.copay,
      this.covid,
      this.maternity,
      this.hospitalroom,
      this.bonus,
      this.restoration,
      this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Image(
                    image: AssetImage("$image"),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 130,
                      child: Text("$title",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (drop == false) {
                    setState(() {});
                    drop = true;
                  } else {
                    setState(() {});
                    drop = false;
                  }
                },
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Plan Benefits",
                          ),
                        )),
                    Expanded(child: Divider()),
                    if (drop == false)
                      Icon(Icons.arrow_drop_down_circle_rounded),
                    if (drop == true)
                      CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.black,
                          child: Center(
                              child: Icon(
                            size: 18,
                            Icons.arrow_drop_up_sharp,
                            color: Colors.white,
                          )))
                  ],
                ),
              ),
            ),
            if (drop == true)
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Co-Pay",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" - $copay")
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Covid Covered",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" - $covid")
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Maternity",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" - $maternity")
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Hospital Room",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" - $hospitalroom")
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "No Claim Bonus",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " - $bonus",
                          overflow: TextOverflow.clip,
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Restoration",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" - $restoration")
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "₹ $price/Year",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_rounded, color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
