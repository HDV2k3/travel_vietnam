import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../constants/constants.dart';
import '../../../data/models/payment.dart';
import '../../../data/providers/firebase_provider.dart';

final paymentServiceProvider = Provider((ref) => PaymentService(
    firestore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider)));

class PaymentService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  PaymentService(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth})
      : _firestore = firestore,
        _firebaseAuth = firebaseAuth;
  CollectionReference get _payments =>
      _firestore.collection(Constants.paymentsCollection);
  Either<dynamic, Future<void>> createPayment(Payment payment) {
    return right(
      _payments.doc(payment.transactionId).set(payment.toJson()),
    );
  }
}
