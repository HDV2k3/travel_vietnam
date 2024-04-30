// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return _Hotel.fromJson(json);
}

/// @nodoc
mixin _$Hotel {
  @HiveField(0)
  String? get hotelId => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String>? get image =>
      throw _privateConstructorUsedError; // Kiểu List<String> cho danh sách ảnh
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get price => throw _privateConstructorUsedError;
  @HiveField(4)
  double? get oldPrice => throw _privateConstructorUsedError;
  @HiveField(5)
  bool? get isAvailable => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(7)
  List<String>? get utilities =>
      throw _privateConstructorUsedError; // Kiểu List<dynamic> cho danh sách tiện ích
  @HiveField(8)
  int? get vote => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get provinceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelCopyWith<Hotel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelCopyWith<$Res> {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) then) =
      _$HotelCopyWithImpl<$Res, Hotel>;
  @useResult
  $Res call(
      {@HiveField(0) String? hotelId,
      @HiveField(1) List<String>? image,
      @HiveField(2) String? name,
      @HiveField(3) double? price,
      @HiveField(4) double? oldPrice,
      @HiveField(5) bool? isAvailable,
      @HiveField(6) String? description,
      @HiveField(7) List<String>? utilities,
      @HiveField(8) int? vote,
      @HiveField(9) String? provinceName});
}

/// @nodoc
class _$HotelCopyWithImpl<$Res, $Val extends Hotel>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotelId = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? oldPrice = freezed,
    Object? isAvailable = freezed,
    Object? description = freezed,
    Object? utilities = freezed,
    Object? vote = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(_value.copyWith(
      hotelId: freezed == hotelId
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as double?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      utilities: freezed == utilities
          ? _value.utilities
          : utilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vote: freezed == vote
          ? _value.vote
          : vote // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelImplCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$$HotelImplCopyWith(
          _$HotelImpl value, $Res Function(_$HotelImpl) then) =
      __$$HotelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? hotelId,
      @HiveField(1) List<String>? image,
      @HiveField(2) String? name,
      @HiveField(3) double? price,
      @HiveField(4) double? oldPrice,
      @HiveField(5) bool? isAvailable,
      @HiveField(6) String? description,
      @HiveField(7) List<String>? utilities,
      @HiveField(8) int? vote,
      @HiveField(9) String? provinceName});
}

/// @nodoc
class __$$HotelImplCopyWithImpl<$Res>
    extends _$HotelCopyWithImpl<$Res, _$HotelImpl>
    implements _$$HotelImplCopyWith<$Res> {
  __$$HotelImplCopyWithImpl(
      _$HotelImpl _value, $Res Function(_$HotelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotelId = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? oldPrice = freezed,
    Object? isAvailable = freezed,
    Object? description = freezed,
    Object? utilities = freezed,
    Object? vote = freezed,
    Object? provinceName = freezed,
  }) {
    return _then(_$HotelImpl(
      hotelId: freezed == hotelId
          ? _value.hotelId
          : hotelId // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as double?,
      oldPrice: freezed == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      utilities: freezed == utilities
          ? _value._utilities
          : utilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vote: freezed == vote
          ? _value.vote
          : vote // ignore: cast_nullable_to_non_nullable
              as int?,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelImpl implements _Hotel {
  _$HotelImpl(
      {@HiveField(0) this.hotelId,
      @HiveField(1) final List<String>? image,
      @HiveField(2) this.name,
      @HiveField(3) this.price,
      @HiveField(4) this.oldPrice,
      @HiveField(5) this.isAvailable,
      @HiveField(6) this.description,
      @HiveField(7) final List<String>? utilities,
      @HiveField(8) this.vote,
      @HiveField(9) this.provinceName})
      : _image = image,
        _utilities = utilities;

  factory _$HotelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelImplFromJson(json);

  @override
  @HiveField(0)
  final String? hotelId;
  final List<String>? _image;
  @override
  @HiveField(1)
  List<String>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Kiểu List<String> cho danh sách ảnh
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final double? price;
  @override
  @HiveField(4)
  final double? oldPrice;
  @override
  @HiveField(5)
  final bool? isAvailable;
  @override
  @HiveField(6)
  final String? description;
  final List<String>? _utilities;
  @override
  @HiveField(7)
  List<String>? get utilities {
    final value = _utilities;
    if (value == null) return null;
    if (_utilities is EqualUnmodifiableListView) return _utilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Kiểu List<dynamic> cho danh sách tiện ích
  @override
  @HiveField(8)
  final int? vote;
  @override
  @HiveField(9)
  final String? provinceName;

  @override
  String toString() {
    return 'Hotel(hotelId: $hotelId, image: $image, name: $name, price: $price, oldPrice: $oldPrice, isAvailable: $isAvailable, description: $description, utilities: $utilities, vote: $vote, provinceName: $provinceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelImpl &&
            (identical(other.hotelId, hotelId) || other.hotelId == hotelId) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._utilities, _utilities) &&
            (identical(other.vote, vote) || other.vote == vote) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hotelId,
      const DeepCollectionEquality().hash(_image),
      name,
      price,
      oldPrice,
      isAvailable,
      description,
      const DeepCollectionEquality().hash(_utilities),
      vote,
      provinceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      __$$HotelImplCopyWithImpl<_$HotelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelImplToJson(
      this,
    );
  }
}

abstract class _Hotel implements Hotel {
  factory _Hotel(
      {@HiveField(0) final String? hotelId,
      @HiveField(1) final List<String>? image,
      @HiveField(2) final String? name,
      @HiveField(3) final double? price,
      @HiveField(4) final double? oldPrice,
      @HiveField(5) final bool? isAvailable,
      @HiveField(6) final String? description,
      @HiveField(7) final List<String>? utilities,
      @HiveField(8) final int? vote,
      @HiveField(9) final String? provinceName}) = _$HotelImpl;

  factory _Hotel.fromJson(Map<String, dynamic> json) = _$HotelImpl.fromJson;

  @override
  @HiveField(0)
  String? get hotelId;
  @override
  @HiveField(1)
  List<String>? get image;
  @override // Kiểu List<String> cho danh sách ảnh
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  double? get price;
  @override
  @HiveField(4)
  double? get oldPrice;
  @override
  @HiveField(5)
  bool? get isAvailable;
  @override
  @HiveField(6)
  String? get description;
  @override
  @HiveField(7)
  List<String>? get utilities;
  @override // Kiểu List<dynamic> cho danh sách tiện ích
  @HiveField(8)
  int? get vote;
  @override
  @HiveField(9)
  String? get provinceName;
  @override
  @JsonKey(ignore: true)
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
