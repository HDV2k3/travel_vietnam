// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      locationId: json['locationId'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool?,
      description: json['description'] as String?,
      provinceName: json['provinceName'] as String?,
      vote: json['vote'] as int?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'provinceName': instance.provinceName,
      'vote': instance.vote,
    };
