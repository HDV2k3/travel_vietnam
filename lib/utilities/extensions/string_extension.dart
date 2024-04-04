import 'package:flutter/material.dart';

import '../../presentation/features/settings/models/app_language.dart';

extension StringExtension on String {
  Locale get locale {
    if (this == AppSupportedLanguage.en.name) {
      return AppSupportedLanguage.en.locale;
    } else if (this == AppSupportedLanguage.vi.name) {
      return AppSupportedLanguage.vi.locale;
    } else {
      return AppSupportedLanguage.vi.locale;
    }
  }

  AppSupportedLanguage get appSupportedLanguage {
    if (this == AppSupportedLanguage.en.name) {
      return AppSupportedLanguage.en;
    } else if (this == AppSupportedLanguage.vi.name) {
      return AppSupportedLanguage.vi;
    } else {
      return AppSupportedLanguage.vi;
    }
  }
}
