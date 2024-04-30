import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailHotelViewModel extends _$DetailHotelViewModel {
  @override
  FutureOr<DetailHotelState> build() {
    return DetailHotelState();
  }

  Future<void> fetchUtilitiesFromFirebase(String docId) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('hotels').doc(docId).get();
    final data = snapshot.data() as Map<String, dynamic>;
    final List<String> utilitiesList = List<String>.from(data['utilities']);
    (update((state) => state.copyWith(utilities: utilitiesList)));
  }
}
