import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';



part 'payment_view_model.g.dart';

@riverpod
class PaymentViewModel extends _$PaymentViewModel {
  @override
  FutureOr<PaymentState> build() {
    return PaymentState();
  }
}
