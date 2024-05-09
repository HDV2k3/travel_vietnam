import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'room_in_hotel.freezed.dart';
part 'room_in_hotel.g.dart';

List<Room> hotelFromJson(dynamic str) =>
    List<Room>.from((str).map((e) => Room.fromJson(e)));

@freezed
@HiveType(typeId: 0)
abstract class Room with _$Room {
  factory Room({
    @HiveField(0) List<String>? image, // Kiểu List<String> cho danh sách ảnh
    @HiveField(1) String? name,
    @HiveField(2) String? price,
    @HiveField(3) double? oldPrice,
    @HiveField(4) bool? isAvailable,
    @HiveField(5) String? numberOfBeds,
    @HiveField(6) String? area, // Kiểu List<dynamic> cho danh sách tiện ích
    @HiveField(7) String? view,
    @HiveField(8) String? regulations,
  }) = _Room;
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
