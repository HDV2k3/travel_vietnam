// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  List<CartItem>? get cart => throw _privateConstructorUsedError;
  List<Orders>? get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String? fullName,
      String? birthday,
      String? avatar,
      bool? gender,
      String? email,
      String? password,
      List<CartItem>? cart,
      List<Orders>? orders});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? fullName = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? cart = freezed,
    Object? orders = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Orders>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? fullName,
      String? birthday,
      String? avatar,
      bool? gender,
      String? email,
      String? password,
      List<CartItem>? cart,
      List<Orders>? orders});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? fullName = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? cart = freezed,
    Object? orders = freezed,
  }) {
    return _then(_$CartImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      cart: freezed == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Orders>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl with DiagnosticableTreeMixin implements _Cart {
  _$CartImpl(
      {required this.uid,
      this.fullName,
      this.birthday,
      this.avatar,
      this.gender,
      this.email,
      this.password,
      final List<CartItem>? cart,
      final List<Orders>? orders})
      : _cart = cart,
        _orders = orders;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String uid;
  @override
  final String? fullName;
  @override
  final String? birthday;
  @override
  final String? avatar;
  @override
  final bool? gender;
  @override
  final String? email;
  @override
  final String? password;
  final List<CartItem>? _cart;
  @override
  List<CartItem>? get cart {
    final value = _cart;
    if (value == null) return null;
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Orders>? _orders;
  @override
  List<Orders>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(uid: $uid, fullName: $fullName, birthday: $birthday, avatar: $avatar, gender: $gender, email: $email, password: $password, cart: $cart, orders: $orders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('birthday', birthday))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('cart', cart))
      ..add(DiagnosticsProperty('orders', orders));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      fullName,
      birthday,
      avatar,
      gender,
      email,
      password,
      const DeepCollectionEquality().hash(_cart),
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements UserModel {
  factory _Cart(
      {required final String uid,
      final String? fullName,
      final String? birthday,
      final String? avatar,
      final bool? gender,
      final String? email,
      final String? password,
      final List<CartItem>? cart,
      final List<Orders>? orders}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String get uid;
  @override
  String? get fullName;
  @override
  String? get birthday;
  @override
  String? get avatar;
  @override
  bool? get gender;
  @override
  String? get email;
  @override
  String? get password;
  @override
  List<CartItem>? get cart;
  @override
  List<Orders>? get orders;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
