import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/repositories/AHotelRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants/constants.dart';

class EFHotelRepository implements AHotelRepository {
  final FirebaseFirestore _fireStore;

  EFHotelRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;
  CollectionReference get _hotels =>
      _fireStore.collection(Constants.hotelsCollection);
  @override
  Stream<List<Hotel>> getHotelByProvinceName(String provinceName) {
    return _hotels
        .where("provinceName", isEqualTo: provinceName)
        .snapshots()
        .map((event) {
      List<Hotel> locations = [];
      for (var doc in event.docs) {
        locations.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  @override
  Stream<List<Hotel>> getHotels() {
    return _hotels.limit(10).snapshots().map((event) {
      List<Hotel> locations = [];

      for (var doc in event.docs) {
        locations.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  @override
  Stream<Hotel> getHotelsById(String locationId) {
    return _hotels
        .doc(locationId)
        .snapshots()
        .map((event) => Hotel.fromJson((event.data() as Map<String, dynamic>)));
  }

  @override
  Stream<List<Hotel>> getRelatedHotels(String provinceName) {
    return _hotels
        .where("provinceName", isEqualTo: provinceName)
        .snapshots()
        .map((event) {
      List<Hotel> locations = [];
      for (var doc in event.docs) {
        locations.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return locations;
    });
  }

  @override
  Stream<List<Hotel>> searchHotels(String search) {
    return _hotels
        .orderBy("name")
        .startAt([search])
        .endAt(['$search\uf8ff'])
        .limit(10)
        .snapshots()
        .map((event) {
          List<Hotel> locations = [];
          for (var doc in event.docs) {
            locations.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
          }
          return locations;
        });
  }
}
