import 'package:chandoiqua/presentation/features/sign_up/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  FutureOr<SignUpState> build() {
    return SignUpState();
  }
}
