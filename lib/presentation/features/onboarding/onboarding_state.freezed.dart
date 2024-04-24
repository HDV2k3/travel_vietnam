// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  bool get isSignInSelected => throw _privateConstructorUsedError;
  bool get isSignUpSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call({bool isSignInSelected, bool isSignUpSelected});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignInSelected = null,
    Object? isSignUpSelected = null,
  }) {
    return _then(_value.copyWith(
      isSignInSelected: null == isSignInSelected
          ? _value.isSignInSelected
          : isSignInSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignUpSelected: null == isSignUpSelected
          ? _value.isSignUpSelected
          : isSignUpSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSignInSelected, bool isSignUpSelected});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSignInSelected = null,
    Object? isSignUpSelected = null,
  }) {
    return _then(_$OnboardingStateImpl(
      isSignInSelected: null == isSignInSelected
          ? _value.isSignInSelected
          : isSignInSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignUpSelected: null == isSignUpSelected
          ? _value.isSignUpSelected
          : isSignUpSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  _$OnboardingStateImpl(
      {this.isSignInSelected = false, this.isSignUpSelected = false});

  @override
  @JsonKey()
  final bool isSignInSelected;
  @override
  @JsonKey()
  final bool isSignUpSelected;

  @override
  String toString() {
    return 'OnboardingState(isSignInSelected: $isSignInSelected, isSignUpSelected: $isSignUpSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.isSignInSelected, isSignInSelected) ||
                other.isSignInSelected == isSignInSelected) &&
            (identical(other.isSignUpSelected, isSignUpSelected) ||
                other.isSignUpSelected == isSignUpSelected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isSignInSelected, isSignUpSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState(
      {final bool isSignInSelected,
      final bool isSignUpSelected}) = _$OnboardingStateImpl;

  @override
  bool get isSignInSelected;
  @override
  bool get isSignUpSelected;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
