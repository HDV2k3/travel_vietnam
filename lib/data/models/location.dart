
import'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'location.freezed.dart';
part 'location.g.dart';
List<Location> locationFromJson(dynamic str) =>
    List<Location>.from((str).map((e) => Location.fromJson(e)));
@freezed
@HiveType(typeId: 0)
abstract class Location with _$Location{
  factory Location({
    @HiveField(0)
    String? locationId,
    @HiveField(1)
    String? image,
    @HiveField(2)
    String? name,
    @HiveField(3)
    double? price,
    @HiveField(4)
    double? oldPrice,
    @HiveField(5)
    bool? isAvailable,
    @HiveField(6)
    String? description,
    @HiveField(7)
    String? provinceName,
    @HiveField(8)
    int? vote,
  })=_Location;
  factory Location.fromJson(Map<String,dynamic>json)=> _$LocationFromJson(json);
}