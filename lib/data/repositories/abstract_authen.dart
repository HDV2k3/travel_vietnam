import 'package:fpdart/fpdart.dart';

import '../models/usser.dart';

abstract class Authentication {
  Future<Either<dynamic, dynamic>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either> signUpWithEmailAndPassword(String email, String password);

  Future<void> signOut();

  Stream<UserModel> getUserData(uid);

  Stream<UserModel> getUserDataFromFireStore();
  Either<dynamic, Future<void>> updateUser(UserModel user);
}
