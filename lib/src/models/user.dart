import 'package:flutter/material.dart';

class User {
  final String userId;
  final String userName;
  final String gender;

  //constructor
  User({this.gender, this.userName, @required this.userId});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userName: json['userName'],
        gender: json['gender'],
        userId: json['userId']);
  }

  Map<String, dynamic> toMap() {
    return {'userName': userName, 'gender': gender, 'userId': userId};
  }
}