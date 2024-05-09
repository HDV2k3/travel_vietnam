// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteImpl _$$FavoriteImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteImpl(
      locations: (json['locations'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotels: (json['hotels'] as List<dynamic>)
          .map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FavoriteImplToJson(_$FavoriteImpl instance) =>
    <String, dynamic>{
      'locations': instance.locations,
      'hotels': instance.hotels,
    };
