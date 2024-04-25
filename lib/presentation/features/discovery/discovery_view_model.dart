import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discovery_view_model.g.dart';

@riverpod
class DiscoveryViewModel extends _$DiscoveryViewModel {
  FutureOr<DiscoveryState> build() {
    return DiscoveryState();
  }

  Future<List<DocumentSnapshot>> searchFavorites(String query) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final querySnapshot = await FirebaseFirestore.instance
            .collection('locations')
            .where('location', isGreaterThanOrEqualTo: query)
            .where('location', isLessThan: query + 'z')
            .get();

        return querySnapshot.docs;
      } else {
        // Người dùng chưa đăng nhập
        return [];
      }
    } catch (e) {
      // Xử lý lỗi
      print('Error searching favorites: $e');
      return [];
    }
  }
}
