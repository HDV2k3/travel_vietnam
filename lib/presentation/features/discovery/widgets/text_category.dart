import 'package:chandoiqua/utilities/extensions/string_extension.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_language_provider.dart';

class TextTittle extends ConsumerWidget {
  const TextTittle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSupportedLanguage =
        ref.watch(appLanguageProvider).appSupportedLanguage;
    return Text(
      ref.appLocalizations.category,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
