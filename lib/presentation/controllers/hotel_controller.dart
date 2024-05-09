import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/services/firebase/hotel_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/room_in_hotel.dart';
import '../../data/services/firebase/storage_service.dart';

final hotelsControllerProvider =
    StateNotifierProvider<HotelController, bool>((ref) {
  final hotelsService = ref.watch(hotelsServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return HotelController(
      hotelService: hotelsService, ref: ref, storageService: storageService);
});

final getHotelsProvider = StreamProvider(
    (ref) => ref.watch(hotelsControllerProvider.notifier).getHotels());

final getHotelByProvinceNameProvider =
    StreamProvider.family((ref, String provinceName) {
  return ref
      .watch(hotelsControllerProvider.notifier)
      .getHotelByProvinceName(provinceName);
});

final relatedHotelsProvider =
    StreamProvider.family<List<Hotel>, String>((ref, provinceName) {
  return ref
      .watch(hotelsControllerProvider.notifier)
      .getRelatedHotels(provinceName);
});
//
final roomsByHotelProvider =
    StreamProvider.family<List<Room>, String>((ref, String hotelId) {
  return ref
      .watch(hotelsControllerProvider.notifier)
      .getDataRoomInHotels(hotelId);
});
final searchLocations = StreamProvider.family((ref, String search) {
  return ref.watch(hotelsControllerProvider.notifier).searchHotels(search);
});

class HotelController extends StateNotifier<bool> {
  final HotelService _hotelService;
  final StorageService _storageService;
  HotelController(
      {required HotelService hotelService,
      required Ref ref,
      required StorageService storageService})
      : _hotelService = hotelService,
        _storageService = storageService,
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
