import 'package:CapstoneFinalProject/src/models/entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  //where app and firestoredb interaction happens
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //get entries
  Stream<List<Entry>> getEntries() {
    return _db
        .collection('entries')
        .where('date',
            isGreaterThan:
                DateTime.now().add(Duration(days: -30)).toIso8601String())
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());
  }

  //create and update
  Future<void> setEntry(Entry entry) {
    var options = SetOptions(merge: true);

    return _db
        .collection('entries')
        .doc(entry.entryId)
        .set(entry.toMap(), options);
  }

  //delete
  Future<void> removeEntry(String entryId) {
    return _db.collection('entries').doc(entryId).delete();
  }
}
