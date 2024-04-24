import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../presentation/features/settings/models/app_language.dart';

class SharedPreferencesClient {
  SharedPreferencesClient(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;
  static const _isDarkThemeSettingKey = 'is_dark_theme_setting';
  static const _languageSettingKey = 'language_setting';
  static const _isFavorite = 'is_favorite';


  bool getIsFavorite() {
    final isFavorite = _sharedPreferences.getBool(_isFavorite);

    if (isFavorite != null) {
      return isFavorite; // Nếu giá trị yêu thích là null, mặc định trả về true
    } else {
      return  false;
    }
  }
  Future<void> saveIsFavorite(bool isFavorite) async
  {
    await _sharedPreferences.setBool(_isFavorite, isFavorite);
  }
  Future<void> saveIsDarkTheme(bool isDarkTheme) async {
    await _sharedPreferences.setBool(_isDarkThemeSettingKey, isDarkTheme);
  }

  bool getIsDarkTheme() {
    final isDarkTheme = _sharedPreferences.getBool(_isDarkThemeSettingKey);
    if (isDarkTheme == null) {
      return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    } else {
      return isDarkTheme;
    }


  }




  Future<void> saveLanguageSetting(String language) async {
    await _sharedPreferences.setString(_languageSettingKey, language);
  }

  String getLanguageSetting() {
    final language = _sharedPreferences.getString(_languageSettingKey);
    if (language == null) {
      return AppSupportedLanguage.vi.name;
    } else {
      return language;
    }
  }

  Future<void> removeData(String key) async {
    await _sharedPreferences.remove(key);
  }

  bool checkKeyExists(String key) {
    return _sharedPreferences.containsKey(key);
  }
}
