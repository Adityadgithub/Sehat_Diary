import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PnRcard extends StatefulWidget {
  var date;
  var time;
  var docname;
  var docmobile;
  var pres;
  var report;

  PnRcard(
      {this.date,
      this.time,
      this.docname,
      this.docmobile,
      this.pres,
      this.report});

  @override
  State<PnRcard> createState() => _PnRcardState(
        docname: docname,
        docmobile: docmobile,
        pres: pres,
        report: report,
        date: date,
        time: time,
      );
}

class _PnRcardState extends State<PnRcard> {
  var date;
  var time;
  var docname;
  var docmobile;
  var pres;
  var report;

  _PnRcardState(
      {this.date,
      this.time,
      this.docname,
      this.docmobile,
      this.pres,
      this.report});

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
                              'Doctor: ',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              '$docname',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (docmobile != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact: ', style: TextStyle(fontSize: 15)),
                              Text(
                                '+91 $docmobile',
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
                if (pres != null)
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
                                        child: Text("Prescription",
                                            style: TextStyle(fontSize: 25)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Image.network(
                                        pres,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Prescription",
                            style: TextStyle(),
                          ))),
                SizedBox(width: 30),
                if (report != null)
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
                                        child: Text("Report",
                                            style: TextStyle(fontSize: 25)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Image.network(
                                        report,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Report",
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
