import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sugarcard extends StatefulWidget {
  var date;
  var time;
  var event;
  var sugarlvl;

  Sugarcard({this.date, this.time, this.event, this.sugarlvl});

  @override
  State<Sugarcard> createState() => __SugarcardState(
        date,
        time,
        event,
        sugarlvl,
      );
}

class __SugarcardState extends State<Sugarcard> {
  var date;
  var time;
  var event;
  var sugarlvl;

  __SugarcardState(this.date, this.time, this.event, this.sugarlvl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 250,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Results on the event of :',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '$event',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.white,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                      Text('$sugarlvl'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('mg/dL')
                    ]),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 15),

            event == 'Before Meal'? BeforeMealCatalog(): AfterMealCatalog()
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
    return Row(              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Column(
        children: [Text('Normal'),SizedBox(height: 5), Text('<160',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),SizedBox(height: 5), Text('mg/dL')],
      ),

      Column(
        children: [Text('Risky'),SizedBox(height: 5), Text('160-180',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),SizedBox(height: 5), Text('mg/dL')],
      ),


      Column(
        children: [Text('Critical'),SizedBox(height: 5), Text('>180',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),SizedBox(height: 5), Text('mg/dL')],
      ),
    ]);
  }
}

class BeforeMealCatalog extends StatelessWidget {
  const BeforeMealCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Column(
        children: [Text('Normal'),SizedBox(height: 5), Text('70-110',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),SizedBox(height: 5), Text('mg/dL')],
      ),

      Column(
        children: [Text('Risky'),SizedBox(height: 5), Text('111-125',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),SizedBox(height: 5), Text('mg/dL')],
      ),


      Column(
        children: [Text('Critical'),SizedBox(height: 5), Text('>125',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),SizedBox(height: 5), Text('mg/dL')],
      ),
    ]);;
  }
}

