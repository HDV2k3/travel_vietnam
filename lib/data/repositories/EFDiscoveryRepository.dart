import 'package:chandoiqua/data/models/location.dart';
import 'package:chandoiqua/data/repositories/ADiscoveryRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants/constants.dart';

class EFDiscoveryRepository implements ADiscoveryRepository {
  final FirebaseFirestore _fireStore;

  EFDiscoveryRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;
  CollectionReference get _discoveries =>
      _fireStore.collection(Constants.locationsCollection);

  @override
  Stream<List<Location>> getDiscoveries() {
    return _discoveries.limit(10).snapshots().map((event) {
      List<Location> locations = [];

      for (var doc in event.docs) {
        locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  @override
  Stream<List<Location>> getDiscoveryByProvinceName(String provinceName) {
    return _discoveries
        .where("provinceName", isEqualTo: provinceName)
        .snapshots()
        .map((event) {
      List<Location> locations = [];
      for (var doc in event.docs) {
        locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  @override
  Stream<List<Location>> getRelatedDiscoveries(String provinceName) {
    return _discoveries
        .where("provinceName", isEqualTo: provinceName)
        .snapshots()
        .map((event) {
      List<Location> locations = [];
      for (var doc in event.docs) {
        locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  @override
  Stream<List<Location>> searchDiscoveries(String search) {
    return _discoveries
        .orderBy("name")
        .startAt([search])
        .endAt(['$search\uf8ff'])
        .limit(10)
        .snapshots()
        .map((event) {
          List<Location> locations = [];
          for (var doc in event.docs) {
            locations
                .add(Location.fromJson(doc.data() as Map<String, dynamic>));
          }
          return locations;
        });
  }

  @override
  Stream<Location> getDiscoveriesById(String locationId) {
    return _discoveries.doc(locationId).snapshots().map(
        (event) => Location.fromJson((event.data() as Map<String, dynamic>)));
  }
}
