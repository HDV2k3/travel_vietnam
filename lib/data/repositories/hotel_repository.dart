// repository
import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/repositories/abstract_hotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../constants/constants.dart';
import '../../core/failure.dart';
import '../models/room_in_hotel.dart';

class HotelRepository implements HotelInterface {
  final FirebaseFirestore _fireStore;

  HotelRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  CollectionReference get _hotels =>
      _fireStore.collection(Constants.hotelsCollection);
  @override
  Either<dynamic, Future<void>> addHotel(Hotel hotel) {
    try {
      return right(_hotels.doc(hotel.hotelId.toString()).set(hotel.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<List<Hotel>> getHotels() {
    return _hotels.limit(10).snapshots().map((event) {
      List<Hotel> hotels = [];

      for (var doc in event.docs) {
        hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
      }

      return hotels;
    });
  }

  @override
  Stream<Hotel> getHotelById(String productId) {
    return _hotels
        .doc(productId)
        .snapshots()
        .map((event) => Hotel.fromJson((event.data() as Map<String, dynamic>)));
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
          List<Hotel> hotels = [];
          for (var doc in event.docs) {
            hotels.add(Hotel.fromJson(doc.data() as Map<String, dynamic>));
          }
          return hotels;
        });
  }

  @override
  Stream<List<Room>> getDataRoomInHotels(String hotelId) {
    return FirebaseFirestore.instance
        .collection('hotels')
        .doc(hotelId)
        .collection('room')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        // Create a Room object from the document data
        return Room.fromJson(doc.data());
      }).toList();
    });
  }

  @override
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

  @override
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

  @override
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
