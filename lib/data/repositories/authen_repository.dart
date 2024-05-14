import 'package:chandoiqua/data/models/usser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';

import '../../constants/constants.dart';
import '../../core/failure.dart';
import 'abstract_authen.dart';

class AuthRepository implements Authentication {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _firebaseAuth;

  AuthRepository(
      {required FirebaseFirestore fireStore,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage firebaseStorage})
      : _fireStore = fireStore,
        _firebaseAuth = firebaseAuth;
  CollectionReference get _users =>
      _fireStore.collection(Constants.usersCollection);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();
  User? user = FirebaseAuth.instance.currentUser;
  late UserModel _userModel;

  @override
  Stream<UserModel> getUserData(uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  @override
  Stream<UserModel> getUserDataFromFireStore() {
    return _users.doc(_firebaseAuth.currentUser!.uid).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  @override
  Future<Either> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel(uid: _firebaseAuth.currentUser!.uid));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
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

  @override
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
