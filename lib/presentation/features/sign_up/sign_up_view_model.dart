import 'package:chandoiqua/constants/constants.dart';
import 'package:chandoiqua/data/models/usser.dart';
import 'package:chandoiqua/presentation/features/sign_up/sign_up_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  FutureOr<SignUpState> build() {
    return SignUpState(
        fullNameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        agree: ValueNotifier<bool>(false));
  }

  //Create add new account
  Future<void> newAccount(
    TextEditingController fullNameController,
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
        fullName: fullNameController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection(Constants.usersCollection)
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
          .collection(Constants.usersCollection)
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
