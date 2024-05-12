import 'package:chandoiqua/presentation/features/detail_screen_discovery/detail_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailDiscoveryViewModel extends _$DetailDiscoveryViewModel {
  @override
  FutureOr<DetailDiscoveryState> build() {
    return DetailDiscoveryState();
  }

  Future<List<Map<String, dynamic>>> fetchNestedCollectionData(
      String parentCollection,
      String parentDocId,
      String childCollection) async {
    try {
      CollectionReference parentRef =
          FirebaseFirestore.instance.collection(parentCollection);
      DocumentSnapshot parentDoc = await parentRef.doc(parentDocId).get();
      CollectionReference childRef =
          parentDoc.reference.collection(childCollection);
      QuerySnapshot childQuerySnapshot = await childRef.get();
      List<Map<String, dynamic>> fieldValueList = [];
      for (DocumentSnapshot childDoc in childQuerySnapshot.docs) {
        Map<String, dynamic>? data = childDoc.data() as Map<String, dynamic>?;
        if (data != null) {
          fieldValueList.add(data);
        }
      }
      if (kDebugMode) {
        print(fieldValueList);
      }

      return fieldValueList;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching nested collection data: $error');
      }
      return [];
    }
  }
}
