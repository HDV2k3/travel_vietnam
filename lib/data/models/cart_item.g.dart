// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      cartId: json['cartId'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      cost: (json['cost'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      numberOfBeds: json['numberOfBeds'] as String,
      area: json['area'] as String,
      view: json['view'] as String,
      regulations: json['regulations'] as String,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'image': instance.image,
      'name': instance.name,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'price': instance.price,
      'numberOfBeds': instance.numberOfBeds,
      'area': instance.area,
      'view': instance.view,
      'regulations': instance.regulations,
    };
