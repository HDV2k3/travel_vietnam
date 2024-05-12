import 'package:chandoiqua/data/services/firebase/provider/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../models/usser.dart';

final authServiceProvider = Provider((ref) => AuthService(
    firestore: ref.read(firebaseFirestoreProvider),
    firebaseAuth: ref.read(firebaseAuthProvider),
    firebaseStorage: ref.read(firebaseStorageProvider)));

class AuthService {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;

  AuthService(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage firebaseStorage})
      : _fireStore = firestore,
        _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage;
  CollectionReference get _users =>
      _fireStore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();
  User? user = FirebaseAuth.instance.currentUser;
  late UserModel _userModel;

  Future<Either<dynamic, dynamic>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel(uid: _firebaseAuth.currentUser!.uid));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<Either> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _userModel = UserModel(uid: _firebaseAuth.currentUser!.uid);
          await _users
              .doc(_firebaseAuth.currentUser!.uid)
              .set(_userModel.toJson());
        } else {
          _userModel = await getUserData(userCredential.user!.uid).first;
        }
      });

      return right(UserModel(uid: _firebaseAuth.currentUser!.uid));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<UserModel> getUserData(uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  Stream<UserModel> getUserDataFromFireStore() {
    return _users.doc(_firebaseAuth.currentUser!.uid).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  Either<dynamic, Future<void>> updateUser(UserModel user) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? currentUser = firebaseAuth.currentUser;
    final userId = currentUser!.uid.toString();
    try {
      return right(_users.doc(userId).update(user.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
