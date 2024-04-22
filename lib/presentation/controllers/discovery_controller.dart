import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DiscoveryController extends GetxController {
  // ...

  Future<void> addToFavorite({
    required String title,
    required String image,
    required String price,
    required String location,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('favorite')
            .doc()
            .set({
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