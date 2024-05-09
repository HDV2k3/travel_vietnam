// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      uid: json['uid'] as String,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] as String?,
      avatar: json['avatar'] as String?,
      gender: json['gender'] as bool?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'email': instance.email,
      'password': instance.password,
      'cart': instance.cart,
      'orders': instance.orders,
    };
