import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailHotelState with _$DetailHotelState {
  factory DetailHotelState({
    @Default([]) List<String> utilities,
  }) = _DetailHotelState;
}
