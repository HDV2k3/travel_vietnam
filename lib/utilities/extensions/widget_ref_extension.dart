import 'package:chandoiqua/utilities/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/resources/colors.dart';
import '../../data/providers/app_language_provider.dart';
import '../../data/providers/app_theme_provider.dart';

extension WidgetRefExtension on WidgetRef {
  AppColors get colors {
    return watch(appThemeProvider) ? AppColors.dark : AppColors.light;
  }

  ThemeMode get themeMode {
    return watch(appThemeProvider) ? ThemeMode.dark : ThemeMode.light;
  }

  AppLocalizations get appLocalizations {
    return lookupAppLocalizations(watch(appLanguageProvider).locale);
  }
}
