import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoveryController extends GetxController {

  Future<void> addToFavorite({
    required String title,
    required String image,
    required String price,
    required String location,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user !=null) {
        final querySnapshot = await FirebaseFirestore.instance
            .collection('favorite')
            .where('title', isEqualTo: title)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Tiêu đề đã có trong favorite, không thêm nữa
          return;
        }
        final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

        await FirebaseFirestore.instance
            .collection('favorite')
            .doc()
            .set({
          'id': timestamp,
          'title': title,
          'image': image,
          'price': price,
          'location': location,
          'added_by': user.uid,
        });
        // Thêm sản phẩm thành công

      } else {
        // Người dùng chưa đăng nhập
      }
    } catch (e) {
      // Xử lý lỗi
      print('Error adding to favorite: $e');
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
      print('Error fetching favorite items: $e');
      return [];
    }
  }

}