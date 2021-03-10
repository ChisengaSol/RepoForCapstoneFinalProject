import 'package:CapstoneFinalProject/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreService{
    FirebaseFirestore _db = FirebaseFirestore.instance;

    //create and update user entry
  Future<void> setUserEntry(User userEntry) {
    var options = SetOptions(merge: true);

    return _db
        .collection('users')
        .doc(userEntry.userId)
        .set(userEntry.toMap(), options);
  }
}