// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';
//
// import 'cart_item.dart';
// import 'order.dart';
//
// part 'usser.freezed.dart';
// part 'usser.g.dart';
//
// @freezed
// @HiveType(typeId: 0)
// abstract class User with _$User {
//   factory User(
//       {required String id,
//       String? fullName,
//       String birthday,
//       String avatar,
//       bool gender,
//       String email,
//       String password,
//       List<CartItem>? cart,
//       List<Orders>? orders}) = _Cart;
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
//
// extension CartExt on User {
//   double get grandTotal {
//     return cart!
//         .map((e) => e.numberOfNights * e.price)
//         .fold(0, (p, c) => p + c);
//   }
// }
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';
import 'order.dart';

part 'usser.freezed.dart';
part 'usser.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel(
      {required String uid,
      String? fullName,
      String? birthday,
      String? avatar,
      bool? gender,
      String? email,
      String? password,
      List<CartItem>? cart,
      List<Orders>? orders}) = _Cart;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension CartExt on UserModel {
  double get grandTotal {
    return cart!.map((e) => e.cost * e.quantity).fold(0, (p, c) => p + c);
  }
}
