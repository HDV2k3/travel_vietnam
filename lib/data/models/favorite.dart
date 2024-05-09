import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/models/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
abstract class Favorite with _$Favorite {
  factory Favorite(
      {required List<Location> locations,
      required List<Hotel> hotels}) = _Favorite;
  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
