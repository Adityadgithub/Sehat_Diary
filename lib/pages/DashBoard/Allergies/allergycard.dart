import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Allergycard extends StatefulWidget {
  var date;
  var time;
  var category;
  var allergy;

  Allergycard({this.date, this.time, this.category, this.allergy});

  @override
  State<Allergycard> createState() =>
      __AllergycardState(date, time, category, allergy);
}

class __AllergycardState extends State<Allergycard> {
  var date;
  var time;

  var category;
  var allergy;

  __AllergycardState(this.date, this.time, this.category, this.allergy);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Container(
            height: 130,
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
                                    '$category',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Allergy: ',
                                      style: TextStyle(fontSize: 15)),
                                  Text(
                                    '$allergy',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ]))));
  }
}
