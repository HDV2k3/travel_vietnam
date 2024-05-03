// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_in_hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Room _$RoomFromJson(Map<String, dynamic> json) {
  return _Room.fromJson(json);
}

/// @nodoc
mixin _$Room {
  @HiveField(0)
  List<String>? get image =>
      throw _privateConstructorUsedError; // Kiểu List<String> cho danh sách ảnh
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get price => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get oldPrice => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get isAvailable => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get numberOfBeds => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get area =>
      throw _privateConstructorUsedError; // Kiểu List<dynamic> cho danh sách tiện ích
  @HiveField(7)
  String? get view => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get regulations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {@HiveField(0) List<String>? image,
      @HiveField(1) String? name,
      @HiveField(2) String? price,
      @HiveField(3) double? oldPrice,
      @HiveField(4) bool? isAvailable,
      @HiveField(5) String? numberOfBeds,
      @HiveField(6) String? area,
      @HiveField(7) String? view,
      @HiveField(8) String? regulations});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? oldPrice = freezed,
    Object? isAvailable = freezed,
    Object? numberOfBeds = freezed,
    Object? area = freezed,
    Object? view = freezed,
    Object? regulations = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      numberOfBeds: freezed == numberOfBeds
          ? _value.numberOfBeds
          : numberOfBeds // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
      regulations: freezed == regulations
          ? _value.regulations
          : regulations // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<String>? image,
      @HiveField(1) String? name,
      @HiveField(2) String? price,
      @HiveField(3) double? oldPrice,
      @HiveField(4) bool? isAvailable,
      @HiveField(5) String? numberOfBeds,
      @HiveField(6) String? area,
      @HiveField(7) String? view,
      @HiveField(8) String? regulations});
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? oldPrice = freezed,
    Object? isAvailable = freezed,
    Object? numberOfBeds = freezed,
    Object? area = freezed,
    Object? view = freezed,
    Object? regulations = freezed,
  }) {
    return _then(_$RoomImpl(
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      numberOfBeds: freezed == numberOfBeds
          ? _value.numberOfBeds
          : numberOfBeds // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as String?,
      regulations: freezed == regulations
          ? _value.regulations
          : regulations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomImpl implements _Room {
  _$RoomImpl(
      {@HiveField(0) final List<String>? image,
      @HiveField(1) this.name,
      @HiveField(2) this.price,
      @HiveField(3) this.oldPrice,
      @HiveField(4) this.isAvailable,
      @HiveField(5) this.numberOfBeds,
      @HiveField(6) this.area,
      @HiveField(7) this.view,
      @HiveField(8) this.regulations})
      : _image = image;

  factory _$RoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomImplFromJson(json);

  final List<String>? _image;
  @override
  @HiveField(0)
  List<String>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Kiểu List<String> cho danh sách ảnh
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? price;
  @override
  @HiveField(3)
  final double? oldPrice;
  @override
  @HiveField(4)
  final bool? isAvailable;
  @override
  @HiveField(5)
  final String? numberOfBeds;
  @override
  @HiveField(6)
  final String? area;
// Kiểu List<dynamic> cho danh sách tiện ích
  @override
  @HiveField(7)
  final String? view;
  @override
  @HiveField(8)
  final String? regulations;

  @override
  String toString() {
    return 'Room(image: $image, name: $name, price: $price, oldPrice: $oldPrice, isAvailable: $isAvailable, numberOfBeds: $numberOfBeds, area: $area, view: $view, regulations: $regulations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.numberOfBeds, numberOfBeds) ||
                other.numberOfBeds == numberOfBeds) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.regulations, regulations) ||
                other.regulations == regulations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_image),
      name,
      price,
      oldPrice,
      isAvailable,
      numberOfBeds,
      area,
      view,
      regulations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomImplToJson(
      this,
    );
  }
}

abstract class _Room implements Room {
  factory _Room(
      {@HiveField(0) final List<String>? image,
      @HiveField(1) final String? name,
      @HiveField(2) final String? price,
      @HiveField(3) final double? oldPrice,
      @HiveField(4) final bool? isAvailable,
      @HiveField(5) final String? numberOfBeds,
      @HiveField(6) final String? area,
      @HiveField(7) final String? view,
      @HiveField(8) final String? regulations}) = _$RoomImpl;

  factory _Room.fromJson(Map<String, dynamic> json) = _$RoomImpl.fromJson;

  @override
  @HiveField(0)
  List<String>? get image;
  @override // Kiểu List<String> cho danh sách ảnh
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get price;
  @override
  @HiveField(3)
  double? get oldPrice;
  @override
  @HiveField(4)
  bool? get isAvailable;
  @override
  @HiveField(5)
  String? get numberOfBeds;
  @override
  @HiveField(6)
  String? get area;
  @override // Kiểu List<dynamic> cho danh sách tiện ích
  @HiveField(7)
  String? get view;
  @override
  @HiveField(8)
  String? get regulations;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
