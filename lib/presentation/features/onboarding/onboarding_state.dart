import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default(false) bool isSignInSelected,
    @Default(false) bool isSignUpSelected,
}) = _OnboardingState;
}
