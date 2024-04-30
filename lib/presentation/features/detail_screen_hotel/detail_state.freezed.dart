// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailHotelState {
  List<String> get utilities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailHotelStateCopyWith<DetailHotelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailHotelStateCopyWith<$Res> {
  factory $DetailHotelStateCopyWith(
          DetailHotelState value, $Res Function(DetailHotelState) then) =
      _$DetailHotelStateCopyWithImpl<$Res, DetailHotelState>;
  @useResult
  $Res call({List<String> utilities});
}

/// @nodoc
class _$DetailHotelStateCopyWithImpl<$Res, $Val extends DetailHotelState>
    implements $DetailHotelStateCopyWith<$Res> {
  _$DetailHotelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utilities = null,
  }) {
    return _then(_value.copyWith(
      utilities: null == utilities
          ? _value.utilities
          : utilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailHotelStateImplCopyWith<$Res>
    implements $DetailHotelStateCopyWith<$Res> {
  factory _$$DetailHotelStateImplCopyWith(_$DetailHotelStateImpl value,
          $Res Function(_$DetailHotelStateImpl) then) =
      __$$DetailHotelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> utilities});
}

/// @nodoc
class __$$DetailHotelStateImplCopyWithImpl<$Res>
    extends _$DetailHotelStateCopyWithImpl<$Res, _$DetailHotelStateImpl>
    implements _$$DetailHotelStateImplCopyWith<$Res> {
  __$$DetailHotelStateImplCopyWithImpl(_$DetailHotelStateImpl _value,
      $Res Function(_$DetailHotelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utilities = null,
  }) {
    return _then(_$DetailHotelStateImpl(
      utilities: null == utilities
          ? _value._utilities
          : utilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$DetailHotelStateImpl implements _DetailHotelState {
  _$DetailHotelStateImpl({final List<String> utilities = const []})
      : _utilities = utilities;

  final List<String> _utilities;
  @override
  @JsonKey()
  List<String> get utilities {
    if (_utilities is EqualUnmodifiableListView) return _utilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_utilities);
  }

  @override
  String toString() {
    return 'DetailHotelState(utilities: $utilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailHotelStateImpl &&
            const DeepCollectionEquality()
                .equals(other._utilities, _utilities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_utilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailHotelStateImplCopyWith<_$DetailHotelStateImpl> get copyWith =>
      __$$DetailHotelStateImplCopyWithImpl<_$DetailHotelStateImpl>(
          this, _$identity);
}

abstract class _DetailHotelState implements DetailHotelState {
  factory _DetailHotelState({final List<String> utilities}) =
      _$DetailHotelStateImpl;

  @override
  List<String> get utilities;
  @override
  @JsonKey(ignore: true)
  _$$DetailHotelStateImplCopyWith<_$DetailHotelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
