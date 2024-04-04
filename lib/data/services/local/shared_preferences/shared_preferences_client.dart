import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../presentation/features/settings/models/app_language.dart';

class SharedPreferencesClient {
  SharedPreferencesClient(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _isDarkThemeSettingKey = 'is_dark_theme_setting';
  static const _languageSettingKey = 'language_setting';

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
