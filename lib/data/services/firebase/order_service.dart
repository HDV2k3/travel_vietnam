import 'package:chandoiqua/data/models/order.dart';
import 'package:chandoiqua/data/services/firebase/provider/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../constants/constants.dart';

final ordersServiceProvider = Provider((ref) => OrderService(
    firestore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseStorage: ref.watch(firebaseStorageProvider)));

class OrderService {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  OrderService(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage firebaseStorage})
      : _fireStore = firestore,
        _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage;
  CollectionReference get _orders =>
      _fireStore.collection(Constants.orderCollection);
  Either<dynamic, Future<void>> createOrder(Orders order) {
    return right(
      _orders.doc(order.orderId).set(order.toJson()),
    );
  }
}
