import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Heartcard extends StatefulWidget {
  var date;
  var time;
  var heart;

  Heartcard({this.date, this.time, this.heart});

  @override
  State<Heartcard> createState() => __HeartcardState(
        date,
        time,
    heart,

      );
}

class __HeartcardState extends State<Heartcard> {
  var date;
  var time;
  var heart;

  __HeartcardState(this.date, this.time, this.heart);

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
                      Text('$heart',style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: 3,
                      ),
                      Text('rpm')
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
