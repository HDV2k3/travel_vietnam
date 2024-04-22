import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/local/shared_preferences/shared_preferences_client.dart';
import 'shared_preferences_provider.dart';

part 'shared_preferences_client_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferences])

SharedPreferencesClient sharedPreferencesClient(
    SharedPreferencesClientRef ref) {
  return SharedPreferencesClient(ref.watch(sharedPreferencesProvider));
}
