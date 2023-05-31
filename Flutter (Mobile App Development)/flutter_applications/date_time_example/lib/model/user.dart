import 'package:flutter/material.dart';

class User{
  String? id ;
  String? name;
  DateTime? date;
  TimeOfDay? time;


  User({this.id, this.name, this. date, this.time});

  @override
  String toString() {
    return '$id, $name, $date, $time';
  }
}