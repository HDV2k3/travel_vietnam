import 'package:chandoiqua/data/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/features/discovery/discovery_view_model.dart';
import '../models/hotel.dart';
import '../models/room_in_hotel.dart';
import '../repositories/hotel_repository.dart';
import 'firebase_provider.dart';

final hotelsServiceProvider = Provider((ref) {
  return HotelRepository(fireStore: ref.watch(firebaseFirestoreProvider));
});
final hotelsControllerProvider =
    StateNotifierProvider<HotelViewModel, bool>((ref) {
  final hotelsService = ref.watch(hotelsServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return HotelViewModel(
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
final roomsByHotelProvider =
    StreamProvider.family<List<Room>, String>((ref, String hotelId) {
  return ref
      .watch(hotelsControllerProvider.notifier)
      .getDataRoomInHotels(hotelId);
});
final searchHotels = StreamProvider.family((ref, String search) {
  return ref.watch(hotelsControllerProvider.notifier).searchHotels(search);
});
