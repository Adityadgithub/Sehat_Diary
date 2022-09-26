import 'package:flutter/material.dart';

class Bloodbanks extends StatefulWidget {
  const Bloodbanks({Key? key}) : super(key: key);

  @override
  State<Bloodbanks> createState() => _BloodbanksState();
}

class _BloodbanksState extends State<Bloodbanks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 110,
                    image: AssetImage("assets/images/bloodbank/bloodline.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bloodline Charitable Blood Bank",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_in_talk_sharp,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "07947174601",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                "Swargiya Anand Dighe Sankul, Khopat, Dr Ambedkar Road, Thane West",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "OPEN NOW",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 110,
                    image: AssetImage("assets/images/bloodbank/sadguru.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sadguru Charitable Blood Bank",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_in_talk_sharp,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "07947336914",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                "Office No 1 and 2 Kalash Vailbhav, Mahalaxmi CHS, Plot 21, Sector 11, Kopar Khairane",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "OPEN NOW",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 110,
                    image: AssetImage("assets/images/bloodbank/manas.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Manas Institutes Blood Bank",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_in_talk_sharp,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "07947170162",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                "101 and 104/A, 1st Floor, Grace Plaza, S V Road, Jogeshwari West",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "CLOSED",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 110,
                    image: AssetImage("assets/images/bloodbank/borivali.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Borivali Blood bank",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_in_talk_sharp,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "07947464100",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                "CTS 21/B, 1st Floor, BMC Market Village, Mandpeshwar Road, Navagaon-dahisar West",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "OPEN NOW",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 110,
                    image: AssetImage("assets/images/bloodbank/mira.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mira Bhayandar Munciple Corp.",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_in_talk_sharp,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "07947172086",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                "Poonam Sagar Complex, Station Road, Mira Road",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "OPEN NOW",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
