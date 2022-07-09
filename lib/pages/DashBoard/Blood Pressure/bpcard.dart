import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bpcard extends StatefulWidget {
  var systolic;
  var diastolic;
  var pulse;
  var date;
  var time;

  bpcard({this.systolic, this.diastolic, this.pulse, this.date, this.time});

  @override
  State<bpcard> createState() => __bpcardState(
        systolic,
        diastolic,
        pulse,
        date,
        time,
      );
}

class __bpcardState extends State<bpcard> {
  var systolic;
  var diastolic;
  var pulse;
  var date;
  var time;

  __bpcardState(
      this.systolic, this.diastolic, this.pulse, this.date, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 300,
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Systolic',style: TextStyle(),),
                    SizedBox(height: 10,),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('$systolic',style: TextStyle(fontSize: 20)),
                              SizedBox(
                                height: 5,
                              ),
                              Text('mmHg', style: TextStyle(fontSize: 14))
                            ]),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Diastolic',style: TextStyle(),),
                    SizedBox(height: 10,),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('$diastolic',style: TextStyle(fontSize: 20)),
                              SizedBox(
                                height: 5,
                              ),
                              Text('mmHg', style: TextStyle(fontSize: 14))
                            ]),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Pulse',style: TextStyle(),),
                    SizedBox(height: 10,),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('$pulse',style: TextStyle(fontSize: 20)),
                              SizedBox(
                                height: 5,
                              ),
                              Text('beats/min',style: TextStyle(fontSize: 14),)
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 15),
            AfterMealCatalog()
            // event == 'Before Meal'? BeforeMealCatalog(): AfterMealCatalog()
          ]),
        ),
      ),
    );
  }
}

class AfterMealCatalog extends StatelessWidget {
  const AfterMealCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        children: [
          Text(
            'Low Blood Pressure',
            style: TextStyle(fontSize: 11),
          ),
          Text(
            '(mmHg)',
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
          SizedBox(height: 10),
          Text(
            'Sys : <90',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          Text(
            'Dia : <60',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          Text(
            'Pulse : <60',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
      Column(
        children: [
          Text(
            'Normal Blood',
            style: TextStyle(fontSize: 11),
          ),
          Text(
            '(mmHg)',
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
          SizedBox(height: 10),
          Text(
            'Sys : 90-130',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          Text(
            'Dia : 60-90',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          Text(
            'Pulse : 60-100',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
      Column(
        children: [
          Text(
            'High Blood Pressure',
            style: TextStyle(fontSize: 11),
          ),
          Text(
            '(mmHg)',
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
          SizedBox(height: 10),
          Text(
            'Sys : >130',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          Text(
            'Dia : >100',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          Text(
            'Pulse : >100',
            style: TextStyle(
              fontSize: 11.5,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    ]);
  }
}
