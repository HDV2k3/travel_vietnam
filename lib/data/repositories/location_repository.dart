import 'package:chandoiqua/data/models/location.dart';
import 'package:chandoiqua/data/repositories/abstract_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../constants/constants.dart';
import '../../core/failure.dart';

class LocationRepository implements LocationInterface {
  final FirebaseFirestore _fireStore;

  LocationRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  CollectionReference get _loactions =>
      _fireStore.collection(Constants.locationsCollection);
  @override
  Either<dynamic, Future<void>> addLocation(Location location) {
    try {
      return right(_loactions
          .doc(location.locationId.toString())
          .set(location.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<List<Location>> getLocations() {
    return _loactions.limit(10).snapshots().map((event) {
      List<Location> locations = [];

      for (var doc in event.docs) {
        locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
      }

      return locations;
    });
  }

  @override
  Stream<Location> getLocationById(String productId) {
    return _loactions.doc(productId).snapshots().map(
        (event) => Location.fromJson((event.data() as Map<String, dynamic>)));
  }

  @override
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
            locations
                .add(Location.fromJson(doc.data() as Map<String, dynamic>));
          }
          return locations;
        });
  }

  @override
  Either<dynamic, Future<void>> updateLocation(Location location) {
    try {
      return right(_loactions
          .doc(location.locationId.toString())
          .update(location.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
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

  @override
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
