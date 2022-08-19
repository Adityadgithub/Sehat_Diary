import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vaccinecard extends StatefulWidget {
  var date;
  var time;
  var vaccine_type;
  var vaccine;
  var certificate;

  Vaccinecard(
      {this.date,
      this.time,
      this.vaccine_type,
      this.vaccine,
      this.certificate});

  @override
  State<Vaccinecard> createState() =>
      __VaccinecardState(date, time, vaccine_type, vaccine, certificate);
}

class __VaccinecardState extends State<Vaccinecard> {
  var date;
  var time;
  var vaccine_type;
  var vaccine;
  var certificate;
  __VaccinecardState(
      this.date, this.time, this.vaccine_type, this.vaccine, this.certificate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 230,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$date',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '$time',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category: ',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              '$vaccine_type Vaccine',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (vaccine != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Vaccine: ', style: TextStyle(fontSize: 15)),
                              Text(
                                '$vaccine',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (certificate != null)
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // image: DecorationImage(
                                  //     image: Image.file(File(report))
                                  //         .image)),),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Vaccine Certificate",
                                            style: TextStyle(fontSize: 25)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Image.network(
                                        certificate,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Certificate",
                            style: TextStyle(),
                          ))),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
