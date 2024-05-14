import 'package:chandoiqua/data/providers/storage_provider.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/location_repository.dart';
import 'firebase_provider.dart';

final locationsServiceProvider = Provider((ref) {
  return LocationRepository(fireStore: ref.watch(firebaseFirestoreProvider));
});

final locationsControllerProvider =
    StateNotifierProvider<LocationViewModel, bool>((ref) {
  final locationsService = ref.watch(locationsServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return LocationViewModel(
      locationService: locationsService,
      ref: ref,
      storageService: storageService);
});

final getLocationsProvider = StreamProvider(
    (ref) => ref.watch(locationsControllerProvider.notifier).getLocations());

final getLocationByProvinceNameProvider =
    StreamProvider.family((ref, String provinceName) {
  return ref
      .watch(locationsControllerProvider.notifier)
      .getLocationByProvinceName(provinceName);
});

final relatedLocationsProvider =
    StreamProvider.family((ref, String provinceName) {
  return ref
      .watch(locationsControllerProvider.notifier)
      .getRelatedLocations(provinceName);
});

final searchLocations = StreamProvider.family((ref, String search) {
  return ref
      .watch(locationsControllerProvider.notifier)
      .searchLocations(search);
});
