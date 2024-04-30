import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DiscoveryController extends GetxController {
  Future<void> addToFavorite({
    required String title,
    required String image,
    required String price,
    required String location,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final querySnapshot = await FirebaseFirestore.instance
            .collection('favorite')
            .where('title', isEqualTo: title)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          // Tiêu đề đã có trong favorite, không thêm nữa
          return;
        }
        final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

        await FirebaseFirestore.instance.collection('favorite').doc().set({
          'id': timestamp,
          'title': title,
          'image': image,
          'price': price,
          'location': location,
          'added_by': user.uid,
        });
        // Thêm sản phẩm thành công
      } else {
        final googleUser = await GoogleSignIn().signIn();
        final googleAuth = await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final newUser = userCredential.user;

        if (newUser != null) {
          final querySnapshot = await FirebaseFirestore.instance
              .collection('favorite')
              .where('title', isEqualTo: title)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            // Tiêu đề đã có trong favorite, không thêm nữa
            return;
          }
          final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

          await FirebaseFirestore.instance.collection('favorite').doc().set({
            'id': timestamp,
            'title': title,
            'image': image,
            'price': price,
            'location': location,
            'added_by': newUser.uid,
          });
          // Thêm sản phẩm thành công
        }
      }
    } catch (e) {
      // Xử lý lỗi
      if (kDebugMode) {
        print('Error adding to favorite: $e');
      }
    }
  }

  Future<void> removeFromFavorite(String title) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final querySnapshot = await FirebaseFirestore.instance
            .collection('favorite')
            .where('title', isEqualTo: title)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          final docId = querySnapshot.docs.first.id;
          await FirebaseFirestore.instance
              .collection('favorite')
              .doc(docId)
              .delete();
          // Xoá đối tượng yêu thích thành công
        } else {
          // Không tìm thấy đối tượng yêu thích
        }
      } else {
        // Người dùng chưa đăng nhập
      }
    } catch (e) {
      // Xử lý lỗi
      if (kDebugMode) {
        print('Error removing from favorite: $e');
      }
    }
  }

  Future<List<QueryDocumentSnapshot>> fetchFavoriteItems(String uid) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('favorite')
          .where('added_by', isEqualTo: uid)
          .get();
      return snapshot.docs;
    } catch (e) {
      // Xử lý lỗi
      if (kDebugMode) {
        print('Error fetching favorite items: $e');
      }
      return [];
    }
  }
}
