import '../services/local/shared_preferences/shared_preferences_client.dart';

abstract class SharedPreferencesRepository {
  bool getIsDarkTheme();

  Future<void> saveIsDarkTheme(bool isDarkTheme);

  Future<void> saveLanguageSetting(String language);

  String getLanguageSetting();
}

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  const SharedPreferencesRepositoryImpl(this._sharedPreferencesClient);

  final SharedPreferencesClient _sharedPreferencesClient;

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
}
