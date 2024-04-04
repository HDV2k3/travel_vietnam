import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/shared_preferences_repository.dart';
import 'shared_preferences_client_provider.dart';

part 'shared_preferences_repository_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesClient])
SharedPreferencesRepository sharedPreferencesRepository(
  SharedPreferencesRepositoryRef ref,
) {
  return SharedPreferencesRepositoryImpl(
    ref.watch(sharedPreferencesClientProvider),
  );
}
