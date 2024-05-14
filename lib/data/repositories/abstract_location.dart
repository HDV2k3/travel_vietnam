import 'package:chandoiqua/data/models/location.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocationInterface {
  Either<dynamic, Future<void>> addLocation(Location location);

  Stream<List<Location>> getLocations();

  Stream<Location> getLocationById(String productId);

  Stream<List<Location>> searchLocations(String search);

  Either<dynamic, Future<void>> updateLocation(Location location);

  Stream<List<Location>> getLocationsByProvinceName(String provinceName);

  Stream<List<Location>> getRelatedLocations(String provinceName);
}
