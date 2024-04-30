import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/services/firebase/hotel_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// final getLocationByProvinceNameProvider =
// StreamProvider.family((ref, String provinceName) {
//   return ref
//       .watch(locationsControllerProvider.notifier)
//       .getLocationByProvinceName(provinceName);
// });
//
// final relatedLocationsProvider =
// StreamProvider.family((ref, String provinceName) {
//   return ref
//       .watch(locationsControllerProvider.notifier)
//       .getRelatedLocations(provinceName);
// });
// final searchLocations = StreamProvider.family((ref, String search) {
//   return ref
//       .watch(locationsControllerProvider.notifier)
//       .searchLocations(search);
// });

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

  // Stream<List<Location>> getLocationByProvinceName(String provinceName) {
  //   return _locationService.getLocationsByProvinceName(provinceName);
  // }
  //
  // Stream<List<Location>> searchLocations(String search) {
  //   return _locationService.searchLocations(search);
  // }
  //
  // Stream<List<Location>> getRelatedLocations(String provinceName) {
  //   return _locationService.getRelatedLocations(provinceName);
  // }
  //
  // void createLocation(
  //     BuildContext context,
  //     File? file,
  //     String name,
  //     String description,
  //     double price,
  //     double oldPrice,
  //     String provinceName) async {
  //   String locationId = const Uuid().v1();
  //   final imageRes = await _storageService.storeFile(
  //     path: "products/",
  //     id: locationId,
  //     file: file,
  //   );
  //
  //   imageRes.fold(
  //           (l) => ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(l.message))), (r) async {
  //     final location = Location(
  //         locationId: locationId,
  //         image: r.toString(),
  //         name: name,
  //         description: description,
  //         price: price,
  //         oldPrice: oldPrice,
  //         provinceName: provinceName);
  //     final res = _locationService.addLocation(location);
  //     state = false;
  //     res.fold(
  //             (l) => ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text(l.message))), (r) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text("location uploaded successfully")));
  //     });
  //   });
  // }
}
