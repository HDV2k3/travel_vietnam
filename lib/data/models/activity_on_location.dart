import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'activity_on_location.freezed.dart';
part 'activity_on_location.g.dart';

List<Activity> activityFromJson(dynamic str) =>
    List<Activity>.from((str).map((e) => Activity.fromJson(e)));

@freezed
@HiveType(typeId: 0)
abstract class Activity with _$Activity {
  factory Activity({
    @HiveField(0) List<String>? activity,
    @HiveField(1) List<String>? image,
  }) = _Activity;
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
