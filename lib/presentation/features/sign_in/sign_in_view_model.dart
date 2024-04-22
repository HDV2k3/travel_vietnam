import 'package:chandoiqua/presentation/features/sign_in/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_in_view_model.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  @override
  FutureOr<SignInState> build() {
    return SignInState();
  }
}