import 'package:chandoiqua/data/models/hotel.dart';
import 'package:fpdart/fpdart.dart';

import '../models/room_in_hotel.dart';

abstract class HotelInterface {
  Either<dynamic, Future<void>> addHotel(Hotel hotel);

  Stream<List<Hotel>> getHotels();

  Stream<Hotel> getHotelById(String productId);

  Stream<List<Hotel>> searchHotels(String search);

  Stream<List<Room>> getDataRoomInHotels(String hotelId);

  Either<dynamic, Future<void>> updateLocation(Hotel hotel);

  Stream<List<Hotel>> getHotelsByProvinceName(String provinceName);

  Stream<List<Hotel>> getRelatedHotels(String provinceName);
}
