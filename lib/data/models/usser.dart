import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'cart_item.dart';
import 'oder.dart';

part 'activity_on_location.freezed.dart';
part 'activity_on_location.g.dart';

List<User> userFromJson(dynamic str) =>
    List<User>.from((str).map((e) => User.fromJson(e)));

@freezed
@HiveType(typeId: 0)
abstract class User with _$User {
  factory User(
      {@HiveField(0) String id,
      @HiveField(0) String name,
      @HiveField(0) String birthday,
      @HiveField(0) String avatar,
      @HiveField(0) bool gender,
      @HiveField(0) String email,
      @HiveField(0) String password,
      List<CartItem>? cart,
      List<Orders>? orders}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
