import 'package:chandoiqua/data/models/location.dart';

abstract class ADiscoveryRepository {
  Stream<List<Location>> getDiscoveries();
  Stream<Location> getDiscoveriesById(String locationId);
  Stream<List<Location>> getDiscoveryByProvinceName(String provinceName);
  Stream<List<Location>> searchDiscoveries(String search);
  Stream<List<Location>> getRelatedDiscoveries(String provinceName);
}
