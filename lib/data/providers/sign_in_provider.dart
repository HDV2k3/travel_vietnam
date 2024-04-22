import 'package:chandoiqua/data/providers/shared_preferences_client_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/sign_in_repository.dart';
part 'sign_in_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [sharedPreferencesClient])
SignInRepository signInRepository(SignInRepositoryRef ref) {
  return SignInRepositoryImpl(
    FirebaseAuth.instance,
    ref.watch(sharedPreferencesClientProvider as AlwaysAliveProviderListenable<SharedPreferences>),
  );
}

