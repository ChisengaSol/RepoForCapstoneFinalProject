import 'package:CapstoneFinalProject/src/models/user.dart';
import 'package:CapstoneFinalProject/src/services/user_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserProvider with ChangeNotifier {
  final ufirestoreService = UserFirestoreService();

  String _username;
  String _gender;
  String _userId;

  var user_uuid = Uuid();

  String get username => _username;
  String get gender => _gender;
  String get userId => _userId;
  //Stream<List<User>> get users => ufirestoreService.getUserEntries()

  loadAllUserEntries(User user) {
    if (user != null) {
      _username = user.userName;
      _gender = user.gender;
      _userId = user.userId;
    } else {
      _username = null;
      _gender = null;
      _userId = null;
    }
  }

  saveUserEntry() {
    if (_userId == null) {
      //add user
      var newUser =
          User(userName: _username, gender: _gender, userId: user_uuid.v1());
      ufirestoreService.setUserEntry(newUser);
    } else {
      //edit
      var updateUser =
          User(userName: _username, gender: _gender, userId: _userId);
      ufirestoreService.setUserEntry(updateUser);
    }
  }
}
