import 'package:chandoiqua/data/models/usser.dart';
import 'package:chandoiqua/presentation/features/sign_in/sign_in_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_view_model.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  FutureOr<SignInState> build() {
    return SignInState(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      rememberMe: ValueNotifier<bool>(false),
    );
  }

  // sign in with google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    User? user = userCredential.user;
    if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        await _firestore.collection('users').doc(user.uid).set({
          'name': user.displayName,
          'uid': user.uid,
          'avatar': user.photoURL,
          'password': user.uid,
        });
      }
    }

    return userCredential; // Trả về giá trị UserCredential
  }

  // anonymous
  Future<bool> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If the login is successful, return true
      return true;
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      if (e.code == 'user-not-found') {
        // Return user not found error
        return false;
      } else if (e.code == 'wrong-password') {
        // Return wrong password error
        return false;
      }
    } catch (e) {
      // Handle other errors
      return false;
    }

    // If no errors occurred, return false
    return false;
  }

  // get collection of users
  final CollectionReference account =
      FirebaseFirestore.instance.collection('users');

  //Create add new account
  Future<void> newAccount(
    TextEditingController fullnameController,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      UserModel user = UserModel(
        uid: '',
        avatar: '',
        birthday: '',
        email: emailController.text,
        fullName: fullnameController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            user.toJson(),
          );
    } catch (e) {
      e.toString();
    }
  }

// check users
  Future<bool> userRegisteredSuccessfully() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        // Người dùng đã được lưu vào Firestore
        return true;
      } else {
        // Người dùng không được lưu vào Firestore
        return false;
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      return false;
    }
  }
}
