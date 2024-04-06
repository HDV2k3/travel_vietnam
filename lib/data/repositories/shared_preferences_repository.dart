import 'package:flutter/cupertino.dart';

import '../services/local/shared_preferences/shared_preferences_client.dart';

abstract class SharedPreferencesRepository {
  bool getIsDarkTheme();

  Future<void> saveIsDarkTheme(bool isDarkTheme);

  Future<void> saveLanguageSetting(String language);

  String getLanguageSetting();
  IconData getFavorite();
  Future<void> saveFavorite(IconData isFavorite);
}

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  const SharedPreferencesRepositoryImpl(this._sharedPreferencesClient);

  final SharedPreferencesClient _sharedPreferencesClient;
  @override
  Future<void> saveFavorite(IconData isFavorite) async {
    await _sharedPreferencesClient.saveIsFavorite(isFavorite as bool);
  }

  @override
  Future<void> saveIsDarkTheme(bool isDarkTheme) async {
    await _sharedPreferencesClient.saveIsDarkTheme(isDarkTheme);
  }

  @override
  bool getIsDarkTheme() {
    return _sharedPreferencesClient.getIsDarkTheme();
  }

  @override
  String getLanguageSetting() {
    return _sharedPreferencesClient.getLanguageSetting();
  }

  @override
  Future<void> saveLanguageSetting(String language) async {
    await _sharedPreferencesClient.saveLanguageSetting(language);
  }

  @override
  IconData getFavorite() {
    return _sharedPreferencesClient.getIsFavorite();
  }
}
