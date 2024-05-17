import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/repositories/hotel_repository.dart';
import 'package:chandoiqua/data/repositories/location_repository.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/constants.dart';
import '../../../data/models/location.dart';
import '../../../data/models/room_in_hotel.dart';
import '../../../data/repositories/storage_repository.dart';

part 'discovery_view_model.g.dart';

class HotelViewModel extends StateNotifier<bool> {
  final HotelRepository _hotelService;
  HotelViewModel(
      {required HotelRepository hotelService,
      required Ref ref,
      required StorageRepository storageService})
      : _hotelService = hotelService,
        super(false);

  Stream<List<Hotel>> getHotels() {
    return _hotelService.getHotels();
  }

  Stream<List<Hotel>> getHotelByProvinceName(String provinceName) {
    return _hotelService.getHotelsByProvinceName(provinceName);
  }

  Stream<List<Hotel>> searchHotels(String search) {
    return _hotelService.searchHotels(search);
  }

  Stream<List<Room>> getDataRoomInHotels(String hotelId) {
    return _hotelService.getDataRoomInHotels(hotelId);
  }

  Stream<List<Hotel>> getRelatedHotels(String provinceName) {
    return _hotelService.getRelatedHotels(provinceName);
  }
}

class LocationViewModel extends StateNotifier<bool> {
  final LocationRepository _locationService;
  LocationViewModel(
      {required LocationRepository locationService,
      required Ref ref,
      required StorageRepository storageService})
      : _locationService = locationService,
        super(false);

  Stream<List<Location>> getLocations() {
    return _locationService.getLocations();
  }

  Stream<List<Location>> getLocationByProvinceName(String provinceName) {
    return _locationService.getLocationsByProvinceName(provinceName);
  }

  Stream<List<Location>> searchLocations(String search) {
    return _locationService.searchLocations(search);
  }

  Stream<List<Location>> getRelatedLocations(String provinceName) {
    return _locationService.getRelatedLocations(provinceName);
  }
}

@riverpod
class DiscoveryViewModel extends _$DiscoveryViewModel {
  @override
  FutureOr<DiscoveryState> build() {
    return DiscoveryState();
  }

  Future<bool> userRegisteredSuccessfully() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(Constants.usersCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        // Người dùng đã được lưu vào Firestore
        return true;
      } else {
        // Người dùng không được lưu vào Firestore
        return false;
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      return false;
    }
  }
}
