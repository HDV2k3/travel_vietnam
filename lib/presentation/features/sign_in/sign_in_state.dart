import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  factory SignInState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required ValueNotifier<bool> rememberMe,
  }) = _SignInState;

}