import 'package:chandoiqua/data/models/order.dart';
import 'package:chandoiqua/data/repositories/abstract_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';

import '../../constants/constants.dart';

class OrderRepository implements OrderInterface {
  final FirebaseFirestore _fireStore;
  OrderRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage firebaseStorage})
      : _fireStore = firestore;
  CollectionReference get _orders =>
      _fireStore.collection(Constants.orderCollection);
  @override
  Either<dynamic, Future<void>> createOrder(Orders order) {
    return right(
      _orders.doc(order.orderId).set(order.toJson()),
    );
  }

  Stream<List<Orders>> getUserOrders(String userId) {
    return _orders.where('uid', isEqualTo: userId).snapshots().map((event) {
      List<Orders> orders = [];
      for (var doc in event.docs) {
        orders.add(Orders.fromJson(doc.data() as Map<String, dynamic>));
      }
      return orders;
    });
  }
}
