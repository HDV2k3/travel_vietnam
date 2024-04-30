import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/services/firebase/provider/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firebase_constants.dart';

final hotelsServiceProvider = Provider((ref) {
  return HotelService(fireStore: ref.watch(firebaseFirestoreProvider));
});

class HotelService {
  final FirebaseFirestore _fireStore;

  HotelService({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  CollectionReference get _hotels =>
      _fireStore.collection(FirebaseConstants.hotelsCollection);

  // Either<dynamic, Future<void>> addHotel(Hotel hotel) {
  //   try {
  //     return right(
  //         _hotels.doc(hotel.hotelId.toString()).set(hotel.toJson()));
  //   } on FirebaseException catch (e) {
  //     throw e.message!;
  //   } catch (e) {
  //     return left(Failure(message: e.toString()));
  //   }
  // }

  Stream<List<Hotel>> getHotels() {
    return _hotels.limit(10).snapshots().map((event) {
      List<Hotel> hotels = [];

      for (var doc in event.docs) {
        hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }

      return hotels;
    });
  }

  // Stream<Location> getLocationById(String productId) {
  //   return _loactions.doc(productId).snapshots().map(
  //           (event) => Location.fromJson((event.data() as Map<String, dynamic>)));
  // }
  //
  // Stream<List<Location>> searchLocations(String search) {
  //   return _loactions
  //       .orderBy("name")
  //       .startAt([search])
  //       .endAt(['$search\uf8ff'])
  //       .limit(10)
  //       .snapshots()
  //       .map((event) {
  //     List<Location> locations = [];
  //     for (var doc in event.docs) {
  //       locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
  //     }
  //     return locations;
  //   });
  // }
  //
  // Either<dynamic, Future<void>> updateLocation(Location location) {
  //   try {
  //     return right(
  //         _loactions.doc(location.locationId.toString()).update(location.toJson()));
  //   } on FirebaseException catch (e) {
  //     throw e.message!;
  //   } catch (e) {
  //     return left(Failure(message: e.toString()));
  //   }
  // }
  //
  // Stream<List<Location>> getLocationsByProvinceName(String provinceName) {
  //   return _loactions
  //       .where("provinceName", isEqualTo: provinceName)
  //       .snapshots()
  //       .map((event) {
  //     List<Location> locations = [];
  //     for (var doc in event.docs) {
  //       locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
  //     }
  //     return locations;
  //   });
  // }
  // Stream<List<Location>> getRelatedLocations(String provinceName) {
  //   return _loactions
  //       .where("provinceName", isEqualTo: provinceName)
  //       .snapshots()
  //       .map((event) {
  //     List<Location> locations = [];
  //     for (var doc in event.docs) {
  //       locations.add(Location.fromJson(doc.data() as Map<String, dynamic>));
  //     }
  //     return locations;
  //   });
  // }
}
