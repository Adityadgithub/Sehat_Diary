import 'package:flutter/material.dart';

class User {
  var systolic;
  var diastolic;
  var pulse;
  var date;
  var time;
  User({
    this.systolic,
    this.diastolic,
    this.pulse,
    this.date,
    this.time,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        systolic: json['systolic'],
        diastolic: json['diastolic'],
        pulse: json['pulse'],
        date: json['date'],
        time: json['time'],
      );
}
