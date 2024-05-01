import 'dart:io';

import 'package:chandoiqua/data/models/location.dart';
import 'package:chandoiqua/data/services/firebase/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/services/firebase/storage_service.dart';

final locationsControllerProvider =
    StateNotifierProvider<LocationController, bool>((ref) {
  final locationsService = ref.watch(locationsServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return LocationController(
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

class LocationController extends StateNotifier<bool> {
  final LocationService _locationService;
  final StorageService _storageService;
  LocationController(
      {required LocationService locationService,
      required Ref ref,
      required StorageService storageService})
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
