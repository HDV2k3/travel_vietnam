// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_on_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      activity: (json['activity'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'image': instance.image,
    };
