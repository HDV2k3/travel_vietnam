import 'dart:io';

import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/repositories/hotel_repository.dart';
import 'package:chandoiqua/data/repositories/location_repository.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

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
  final StorageRepository _storageService;
  LocationViewModel(
      {required LocationRepository locationService,
      required Ref ref,
      required StorageRepository storageService})
      : _locationService = locationService,
        _storageService = storageService,
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

  void createLocation(
      BuildContext context,
      File? file,
      String name,
      String description,
      double price,
      double oldPrice,
      String provinceName) async {
    String locationId = const Uuid().v1();
    final imageRes = await _storageService.storeFile(
      path: "products/",
      id: locationId,
      file: file,
    );

    imageRes.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))), (r) async {
      final location = Location(
          locationId: locationId,
          image: r.toString(),
          name: name,
          description: description,
          price: price,
          oldPrice: oldPrice,
          provinceName: provinceName);
      final res = _locationService.addLocation(location);
      state = false;
      res.fold(
          (l) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l.message))), (r) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("location uploaded successfully")));
      });
    });
  }
}

@riverpod
class DiscoveryViewModel extends _$DiscoveryViewModel {
  @override
  FutureOr<DiscoveryState> build() {
    return DiscoveryState();
  }

  Future<List<DocumentSnapshot>> searchLocations(String query) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final querySnapshot = await FirebaseFirestore.instance
            .collection('location')
            .where('location', isGreaterThanOrEqualTo: query)
            .where('location', isLessThan: '${query}z')
            .get();

        return querySnapshot.docs;
      } else {
        // Người dùng chưa đăng nhập
        return [];
      }
    } catch (e) {
      // Xử lý lỗi
      if (kDebugMode) {
        print('Error searching favorites: $e');
      }
      return [];
    }
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
