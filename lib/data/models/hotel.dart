import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

List<Hotel> locationFromJson(dynamic str) =>
    List<Hotel>.from((str).map((e) => Hotel.fromJson(e)));

@freezed
@HiveType(typeId: 0)
abstract class Hotel with _$Hotel {
  factory Hotel({
    @HiveField(0) String? hotelId,
    @HiveField(1) List<String>? image, // Kiểu List<String> cho danh sách ảnh
    @HiveField(2) String? name,
    @HiveField(3) double? price,
    @HiveField(4) double? oldPrice,
    @HiveField(5) bool? isAvailable,
    @HiveField(6) String? description,
    @HiveField(7)
    List<String>? utilities, // Kiểu List<dynamic> cho danh sách tiện ích
    @HiveField(8) int? vote,
    @HiveField(9) String? provinceName,
  }) = _Hotel;
  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
