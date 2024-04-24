import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discovery_view_model.g.dart';

@riverpod
class DiscoveryViewModel extends _$DiscoveryViewModel {
  FutureOr<DiscoveryState> build() {
    return DiscoveryState();
  }
}
