import 'package:flutter/material.dart';

enum AppSupportedLanguage {
  en,
  vi,
}

extension AppSupportedLanguageExtension on AppSupportedLanguage {
  Locale get locale {
    switch (this) {
      case AppSupportedLanguage.en:
        return const Locale('en');
      case AppSupportedLanguage.vi:
        return const Locale('vi');
    }
  }
}
