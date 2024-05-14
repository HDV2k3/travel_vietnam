import 'package:chandoiqua/data/providers/storage_provider.dart';
import 'package:chandoiqua/presentation/features/profile_user/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/usser.dart';
import '../repositories/authen_repository.dart';
import 'firebase_provider.dart';

final authServiceProvider = Provider((ref) => AuthRepository(
    fireStore: ref.read(firebaseFirestoreProvider),
    firebaseAuth: ref.read(firebaseAuthProvider),
    firebaseStorage: ref.read(firebaseStorageProvider)));

final authControllerProvider =
    StateNotifierProvider<AuthViewModel, bool>((ref) => AuthViewModel(
        authService: ref.watch(
          authServiceProvider,
        ),
        storageService: ref.watch(storageServiceProvider),
        ref: ref));
final userProvider = StateProvider<UserModel?>((ref) => null);
final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});
final getUserDataFromFirestoreProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserDataFromFireStore();
});
