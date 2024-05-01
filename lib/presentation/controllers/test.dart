// import 'dart:io';
//
// import 'package:chandoiqua/data/models/hotel.dart';
// import 'package:chandoiqua/data/models/location.dart';
// import 'package:chandoiqua/data/services/firebase/hotel_service.dart';
// import 'package:chandoiqua/data/services/firebase/location_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../data/services/firebase/storage_service.dart';
//
// final hotelsControllerProvider =
// StateNotifierProvider<HotelController, bool>((ref) {
//   final hotelsService = ref.watch(hotelsServiceProvider);
//   final storageService = ref.watch(storageServiceProvider);
//   return HotelController(
//       hotelService: hotelsService,
//       ref: ref,
//       storageService: storageService);
// });
//
// final getLocationsProvider = StreamProvider(
//         (ref) => ref.watch(hotelsControllerProvider.notifier).getHotels());
//
// final getHotelByProvinceNameProvider =
// StreamProvider.family((ref, String provinceName) {
//   return ref
//       .watch(hotelsControllerProvider.notifier)
//       .getHotelByProvinceName(provinceName);
// });
//
// final relatedLocationsProvider =
// StreamProvider.family((ref, String provinceName) {
//   return ref
//       .watch(hotelsControllerProvider.notifier)
//       .getRelatedHotels(provinceName);
// });
//
// final searchLocations = StreamProvider.family((ref, String search) {
//   return ref
//       .watch(hotelsControllerProvider.notifier)
//       .searchHotels(search);
// });
//
// class HotelController extends StateNotifier<bool> {
//   final HotelService _hotelService;
//   final StorageService _storageService;
//   HotelController(
//       {required HotelService hotelService,
//         required Ref ref,
//         required StorageService storageService})
//       : _hotelService = hotelService,
//         _storageService = storageService,
//         super(false);
//
//   Stream<List<Hotel>> getHotels() {
//     return _hotelService.getHotels();
//   }
//
//   Stream<List<Hotel>> getHotelByProvinceName(String provinceName) {
//     return _hotelService.getHotelsByProvinceName(provinceName);
//   }
//
//   Stream<List<Hotel>> searchHotels(String search) {
//     return _hotelService.searchHotels(search);
//   }
//
//   Stream<List<Hotel>> getRelatedHotels(String provinceName) {
//     return _hotelService.getHotelsByProvinceName(provinceName);
//   }
//
// }
