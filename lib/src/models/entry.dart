import 'package:flutter/material.dart';

class Entry {
  final String entryId;
  final String date;
  final String entry;

  //constructor
  Entry({this.date, this.entry, @required this.entryId});

  //convert json from firestore to dart object when retieved
  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        date: json['date'], entry: json['entry'], entryId: json['entryId']);
  }

  //convert dart object to json when sent to firestore
  Map<String, dynamic> toMap() {
    return {'date': date, 'entry': entry, 'entryId': entryId};
  }
}

