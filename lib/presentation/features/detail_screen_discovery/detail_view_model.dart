import 'package:chandoiqua/presentation/features/detail_screen_discovery/detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailDiscoveryViewModel extends _$DetailDiscoveryViewModel {
  @override
  FutureOr<DetailDiscoveryState> build() {
    return DetailDiscoveryState();
  }
}
