import 'package:chandoiqua/data/models/hotel.dart';
import 'package:hive/hive.dart';

class HotelWishListRepository {
  static const String boxName = "products_box";
  static openBox() async => await Hive.openBox<Hotel>(boxName);
  static Box getBox() => Hive.box<Hotel>(boxName);
  static closeBox() async => await Hive.box(boxName).close();
  static clearBox() async => await Hive.box(boxName).clear();
}
