import 'package:chandoiqua/data/models/hotel.dart';

abstract class AHotelRepository {
  Stream<List<Hotel>> getHotels();
  Stream<Hotel> getHotelsById(String locationId);
  Stream<List<Hotel>> getHotelByProvinceName(String provinceName);
  Stream<List<Hotel>> searchHotels(String search);
  Stream<List<Hotel>> getRelatedHotels(String provinceName);
}
