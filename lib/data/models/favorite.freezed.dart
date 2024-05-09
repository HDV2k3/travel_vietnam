// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  List<Location> get locations => throw _privateConstructorUsedError;
  List<Hotel> get hotels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call({List<Location> locations, List<Hotel> hotels});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? hotels = null,
  }) {
    return _then(_value.copyWith(
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
      hotels: null == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteImplCopyWith<$Res>
    implements $FavoriteCopyWith<$Res> {
  factory _$$FavoriteImplCopyWith(
          _$FavoriteImpl value, $Res Function(_$FavoriteImpl) then) =
      __$$FavoriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Location> locations, List<Hotel> hotels});
}

/// @nodoc
class __$$FavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$FavoriteImpl>
    implements _$$FavoriteImplCopyWith<$Res> {
  __$$FavoriteImplCopyWithImpl(
      _$FavoriteImpl _value, $Res Function(_$FavoriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? hotels = null,
  }) {
    return _then(_$FavoriteImpl(
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
      hotels: null == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteImpl implements _Favorite {
  _$FavoriteImpl(
      {required final List<Location> locations,
      required final List<Hotel> hotels})
      : _locations = locations,
        _hotels = hotels;

  factory _$FavoriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteImplFromJson(json);

  final List<Location> _locations;
  @override
  List<Location> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<Hotel> _hotels;
  @override
  List<Hotel> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  @override
  String toString() {
    return 'Favorite(locations: $locations, hotels: $hotels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteImpl &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            const DeepCollectionEquality().equals(other._hotels, _hotels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_locations),
      const DeepCollectionEquality().hash(_hotels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      __$$FavoriteImplCopyWithImpl<_$FavoriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteImplToJson(
      this,
    );
  }
}

abstract class _Favorite implements Favorite {
  factory _Favorite(
      {required final List<Location> locations,
      required final List<Hotel> hotels}) = _$FavoriteImpl;

  factory _Favorite.fromJson(Map<String, dynamic> json) =
      _$FavoriteImpl.fromJson;

  @override
  List<Location> get locations;
  @override
  List<Hotel> get hotels;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
