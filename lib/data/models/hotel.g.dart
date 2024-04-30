// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelImpl _$$HotelImplFromJson(Map<String, dynamic> json) => _$HotelImpl(
      hotelId: json['hotelId'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool?,
      description: json['description'] as String?,
      utilities: (json['utilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vote: json['vote'] as int?,
      provinceName: json['provinceName'] as String?,
    );

Map<String, dynamic> _$$HotelImplToJson(_$HotelImpl instance) =>
    <String, dynamic>{
      'hotelId': instance.hotelId,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'utilities': instance.utilities,
      'vote': instance.vote,
      'provinceName': instance.provinceName,
    };
