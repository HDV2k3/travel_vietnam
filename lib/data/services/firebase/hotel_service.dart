import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/services/firebase/provider/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../models/room_in_hotel.dart';

final hotelsServiceProvider = Provider((ref) {
  return HotelService(fireStore: ref.watch(firebaseFirestoreProvider));
});

class HotelService {
  final FirebaseFirestore _fireStore;

  HotelService({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  CollectionReference get _hotels =>
      _fireStore.collection(FirebaseConstants.hotelsCollection);

  Either<dynamic, Future<void>> addHotel(Hotel hotel) {
    try {
      return right(_hotels.doc(hotel.hotelId.toString()).set(hotel.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Hotel>> getHotels() {
    return _hotels.limit(10).snapshots().map((event) {
      List<Hotel> hotels = [];

      for (var doc in event.docs) {
        hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }

      return hotels;
    });
  }

  Stream<Hotel> getHotelById(String productId) {
    return _hotels
        .doc(productId)
        .snapshots()
        .map((event) => Hotel.fromJson((event.data() as Map<String, dynamic>)));
  }

  Stream<List<Hotel>> searchHotels(String search) {
    return _hotels
        .orderBy("name")
        .startAt([search])
        .endAt(['$search\uf8ff'])
        .limit(10)
        .snapshots()
        .map((event) {
          List<Hotel> hotels = [];
          for (var doc in event.docs) {
            hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
          }
          return hotels;
        });
  }

  Stream<List<Room>> getDataRoomInHotels(String hotelId) {
    return FirebaseFirestore.instance
        .collection('hotels')
        .doc(hotelId)
        .collection('room')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        // Create a Room object from the document data
        return Room.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Either<dynamic, Future<void>> updateLocation(Hotel hotel) {
    try {
      return right(
          _hotels.doc(hotel.hotelId.toString()).update(hotel.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Hotel>> getHotelsByProvinceName(String provinceName) {
    return _hotels
        .where("provinceName", isEqualTo: provinceName)
        .snapshots()
        .map((event) {
      List<Hotel> hotels = [];
      for (var doc in event.docs) {
        hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return hotels;
    });
  }

  Stream<List<Hotel>> getRelatedHotels(String provinceName) {
    return _hotels
        .where("provinceName", isEqualTo: provinceName)
        .snapshots()
        .map((event) {
      List<Hotel> hotels = [];
      for (var doc in event.docs) {
        hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return hotels;
    });
  }
}
