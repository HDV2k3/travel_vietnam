import 'package:chandoiqua/data/models/location.dart';
import 'package:chandoiqua/data/services/firebase/provider/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../constants/firebase_constants.dart';
import '../../../core/failure.dart';


final locationsServiceProvider = Provider((ref) {
  return LocationService(fireStore: ref.watch(firebaseFirestoreProvider));
});

class LocationService {
  final FirebaseFirestore _fireStore;

  LocationService({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  CollectionReference get _loactions =>
      _fireStore.collection(FirebaseConstants.locationsCollection);

  Either<dynamic, Future<void>> addLocation(Location location) {
    try {
      return right(
          _loactions.doc(location.locationId.toString()).set(location.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Location>> getLocations() {
    return _loactions.limit(10).snapshots().map((event) {
      List<Location> locations = [];

      for (var doc in event.docs) {
        locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
      }

      return locations;
    });
  }


  Stream<Location> getLocationById(String productId) {
    return _loactions.doc(productId).snapshots().map(
            (event) => Location.fromJson((event.data() as Map<String, dynamic>)));
  }

  Stream<List<Location>> searchLocations(String search) {
    return _loactions
        .orderBy("name")
        .startAt([search])
        .endAt(['$search\uf8ff'])
        .limit(10)
        .snapshots()
        .map((event) {
      List<Location> locations = [];
      for (var doc in event.docs) {
        locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  Either<dynamic, Future<void>> updateLocation(Location location) {
    try {
      return right(
          _loactions.doc(location.locationId.toString()).update(location.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Location>> getLocationsByProvinceName(String provinceName) {
    return _loactions
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
  Stream<List<Location>> getRelatedLocations(String provinceName) {
    return _loactions
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
}
