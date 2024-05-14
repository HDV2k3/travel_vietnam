import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/features/payment_screen/payment_view_model.dart';
import '../repositories/order_repository.dart';
import 'firebase_provider.dart';

final ordersServiceProvider = Provider((ref) => OrderRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseStorage: ref.watch(firebaseStorageProvider)));

final orderControllerProvider =
    StateNotifierProvider<OrderController, bool>((ref) => OrderController(
          ref: ref,
          orderService: ref.watch(ordersServiceProvider),
        ));
