import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Weightcard extends StatefulWidget {
  var date;
  var time;
  var weight;

  Weightcard({this.date, this.time, this.weight});

  @override
  State<Weightcard> createState() => __WeightcardState(
        date,
        time,
        weight,

      );
}

class __WeightcardState extends State<Weightcard> {
  var date;
  var time;
  var weight;

  __WeightcardState(this.date, this.time, this.weight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 150,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [

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
                      '''Last Checked on: $date 
                                $time''',
                      style: TextStyle(color: Colors.grey),
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
                      Text('$weight',style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: 3,
                      ),
                      Text('kg')
                    ]),
                  ),
                ),
              ],
            ),


          ]),
        ),
      ),
    );
  }
}
