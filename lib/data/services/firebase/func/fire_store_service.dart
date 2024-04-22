import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static getFavorite(uid) {
    return FirebaseFirestore.instance
        .collection('favorite')
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

}
