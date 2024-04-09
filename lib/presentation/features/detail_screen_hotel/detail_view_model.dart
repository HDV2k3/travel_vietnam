import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailHotelViewModel extends _$DetailHotelViewModel {
  @override
  FutureOr<DetailHotelState> build() {
    return DetailHotelState();
  }
}
