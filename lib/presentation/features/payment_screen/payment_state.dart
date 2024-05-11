import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  factory PaymentState({
    @Default(0) int selectedTabPaymentMethod,
  }) = _PaymentState;
}
