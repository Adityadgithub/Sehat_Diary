import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicinecard extends StatefulWidget {
  var date;
  var time;
  var medname;
  var medtype;
  var quantity;
  var nooftimes;
  var freq;
  var startdate;
  var enddate;

  Medicinecard(
      {this.date,
      this.time,
      this.medname,
      this.medtype,
      this.quantity,
      this.nooftimes,
      this.freq,
      this.startdate,
      this.enddate});

  @override
  State<Medicinecard> createState() => _MedicinecardState(date, time, medname,
      medtype, quantity, nooftimes, freq, startdate, enddate);
}

class _MedicinecardState extends State<Medicinecard> {
  var date;
  var time;
  var medname;
  var medtype;
  var quantity;
  var nooftimes;
  var freq;
  var startdate;
  var enddate;

  _MedicinecardState(this.date, this.time, this.medname, this.medtype,
      this.quantity, this.nooftimes, this.freq, this.startdate, this.enddate);

  var medtypeicon;

  @override
  Widget build(BuildContext context) {
    if (medtype == 'Capsule') {
      medtypeicon = Icons.medication;
    } else if (medtype == 'ML') {
      medtypeicon = Icons.medication_liquid_outlined;
    }
    else if (medtype == 'Tablet') {
      medtypeicon = Icons.medication_rounded;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: SafeArea(
        child: Container(
          height: 155,
          width: 140,
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
              Row(
                children: [
                  Text(
                    '$medname',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Date: $startdate'),
                      SizedBox(height: 3),
                      Text('End Date: $enddate'),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(medtypeicon),
                          Text('$quantity $medtype'),
                        ],
                      ),SizedBox(height: 3),
                      Text('$nooftimes Time $freq'),
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
