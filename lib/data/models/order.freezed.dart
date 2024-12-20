// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return _Orders.fromJson(json);
}

/// @nodoc
mixin _$Orders {
  String? get uid => throw _privateConstructorUsedError;
  List<CartItem> get products => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  bool? get isAccepted => throw _privateConstructorUsedError;
  bool? get isCancelled => throw _privateConstructorUsedError;
  bool? get isActivity => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersCopyWith<Orders> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersCopyWith<$Res> {
  factory $OrdersCopyWith(Orders value, $Res Function(Orders) then) =
      _$OrdersCopyWithImpl<$Res, Orders>;
  @useResult
  $Res call(
      {String? uid,
      List<CartItem> products,
      double total,
      String orderId,
      bool? isAccepted,
      bool? isCancelled,
      bool? isActivity,
      DateTime date});
}

/// @nodoc
class _$OrdersCopyWithImpl<$Res, $Val extends Orders>
    implements $OrdersCopyWith<$Res> {
  _$OrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? products = null,
    Object? total = null,
    Object? orderId = null,
    Object? isAccepted = freezed,
    Object? isCancelled = freezed,
    Object? isActivity = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelled: freezed == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActivity: freezed == isActivity
          ? _value.isActivity
          : isActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersImplCopyWith<$Res> implements $OrdersCopyWith<$Res> {
  factory _$$OrdersImplCopyWith(
          _$OrdersImpl value, $Res Function(_$OrdersImpl) then) =
      __$$OrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      List<CartItem> products,
      double total,
      String orderId,
      bool? isAccepted,
      bool? isCancelled,
      bool? isActivity,
      DateTime date});
}

/// @nodoc
class __$$OrdersImplCopyWithImpl<$Res>
    extends _$OrdersCopyWithImpl<$Res, _$OrdersImpl>
    implements _$$OrdersImplCopyWith<$Res> {
  __$$OrdersImplCopyWithImpl(
      _$OrdersImpl _value, $Res Function(_$OrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? products = null,
    Object? total = null,
    Object? orderId = null,
    Object? isAccepted = freezed,
    Object? isCancelled = freezed,
    Object? isActivity = freezed,
    Object? date = null,
  }) {
    return _then(_$OrdersImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelled: freezed == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActivity: freezed == isActivity
          ? _value.isActivity
          : isActivity // ignore: cast_nullable_to_non_nullable
              as bool?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrdersImpl implements _Orders {
  _$OrdersImpl(
      {this.uid,
      required final List<CartItem> products,
      required this.total,
      required this.orderId,
      this.isAccepted,
      this.isCancelled,
      this.isActivity,
      required this.date})
      : _products = products;

  factory _$OrdersImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersImplFromJson(json);

  @override
  final String? uid;
  final List<CartItem> _products;
  @override
  List<CartItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final double total;
  @override
  final String orderId;
  @override
  final bool? isAccepted;
  @override
  final bool? isCancelled;
  @override
  final bool? isActivity;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Orders(uid: $uid, products: $products, total: $total, orderId: $orderId, isAccepted: $isAccepted, isCancelled: $isCancelled, isActivity: $isActivity, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.isCancelled, isCancelled) ||
                other.isCancelled == isCancelled) &&
            (identical(other.isActivity, isActivity) ||
                other.isActivity == isActivity) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      const DeepCollectionEquality().hash(_products),
      total,
      orderId,
      isAccepted,
      isCancelled,
      isActivity,
      date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersImplCopyWith<_$OrdersImpl> get copyWith =>
      __$$OrdersImplCopyWithImpl<_$OrdersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersImplToJson(
      this,
    );
  }
}

abstract class _Orders implements Orders {
  factory _Orders(
      {final String? uid,
      required final List<CartItem> products,
      required final double total,
      required final String orderId,
      final bool? isAccepted,
      final bool? isCancelled,
      final bool? isActivity,
      required final DateTime date}) = _$OrdersImpl;

  factory _Orders.fromJson(Map<String, dynamic> json) = _$OrdersImpl.fromJson;

  @override
  String? get uid;
  @override
  List<CartItem> get products;
  @override
  double get total;
  @override
  String get orderId;
  @override
  bool? get isAccepted;
  @override
  bool? get isCancelled;
  @override
  bool? get isActivity;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$OrdersImplCopyWith<_$OrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
