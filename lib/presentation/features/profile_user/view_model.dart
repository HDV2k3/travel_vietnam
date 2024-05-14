import 'dart:io';

import 'package:chandoiqua/data/repositories/authen_repository.dart';
import 'package:chandoiqua/data/repositories/storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/usser.dart';
import '../../../data/providers/authen_provider.dart';

class AuthViewModel extends StateNotifier<bool> {
  final AuthRepository _authService;
  final StorageRepository _storageService;
  final Ref _ref;
  AuthViewModel(
      {required AuthRepository authService,
      required StorageRepository storageService,
      required Ref ref})
      : _authService = authService,
        _storageService = storageService,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authService.authStateChange;
  //UserModel userModel = UserModel(uid: FirebaseAuth.instance.currentUser!.uid);
  void signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final user = await _authService.signInWithEmailAndPassword(email, password);
    state = false;
    user.fold(
        (failure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.message))),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final user = await _authService.signUpWithEmailAndPassword(email, password);
    state = false;
    user.fold(
        (failure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.message))),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  Future<void> signOut() async {
    _authService.signOut();
  }

  Stream<UserModel> getUserData(uid) {
    return _authService.getUserData(uid);
  }

  Stream<UserModel> getUserDataFromFireStore() {
    return _authService.getUserDataFromFireStore();
  }

  void updateUser(
    BuildContext context,
    File image,
    String fullName,
  ) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? user = firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    final imageRes = await _storageService.storeFile(
        path: '/profileimages', id: userId, file: image);
    imageRes.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))), (r) {
      final user =
          UserModel(uid: userId, fullName: fullName, avatar: r.toString());
      final res = _authService.updateUser(user);
      state = false;
      res.fold(
          (l) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l.message))),
          (r) => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("profile updated"))));
    });
  }
}
