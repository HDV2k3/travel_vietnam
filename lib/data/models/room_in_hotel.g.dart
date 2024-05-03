// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_in_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      price: json['price'] as String?,
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool?,
      numberOfBeds: json['numberOfBeds'] as String?,
      area: json['area'] as String?,
      view: json['view'] as String?,
      regulations: json['regulations'] as String?,
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'isAvailable': instance.isAvailable,
      'numberOfBeds': instance.numberOfBeds,
      'area': instance.area,
      'view': instance.view,
      'regulations': instance.regulations,
    };
