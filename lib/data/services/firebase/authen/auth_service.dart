import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class AuthenticationService {
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

// sign in with email and password
  Future<void> signInUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    } catch (e) {
      e.toString();
    }
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

      Users user = Users(
        id: '',
        avatar: '',
        birthday: '',
        email: emailController.text,
        name: fullnameController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            user.toMap(),
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
