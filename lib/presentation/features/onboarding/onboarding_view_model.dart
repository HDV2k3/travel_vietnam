import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'onboarding_state.dart';

part 'onboarding_view_model.g.dart';

@riverpod
class OnboardingViewModel extends _$OnboardingViewModel {
  @override
  FutureOr<OnboardingState> build() {
    return OnboardingState();
  }
  void selectSignIn() {
    update((state) => state.copyWith(isSignInSelected:true,isSignUpSelected:false));

  }

  void selectSignUp() {
    update((state) => state.copyWith(isSignInSelected:false,isSignUpSelected:true));
  }
}
