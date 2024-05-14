import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/features/cart_screen/cart_view_model.dart';
import '../repositories/cart_repository.dart';
import 'firebase_provider.dart';

final cartServiceProvider = Provider((ref) => CartRepository(
    firebaseFireStore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseStorage: ref.watch(firebaseStorageProvider),
    ref: ref));

final cartControllerProvider =
    StateNotifierProvider<CartProductViewModel, bool>((ref) =>
        CartProductViewModel(
            cartService: ref.watch(cartServiceProvider), ref: ref));
