import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_language_provider.dart';
import '../../../../utilities/extensions/string_extension.dart';
import '../../../../utilities/extensions/widget_ref_extension.dart';
import '../models/app_language.dart';

class SettingLanguageItem extends ConsumerWidget {
  const SettingLanguageItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSupportedLanguage =
        ref.watch(appLanguageProvider).appSupportedLanguage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: ref.colors.cellBackground,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Icon(
              Icons.color_lens_outlined,
              color: ref.colors.mainText,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              ref.appLocalizations.language,
              style: TextStyle(color: ref.colors.mainText),
            ),
            const SizedBox(
              width: 8,
            ),
            const Spacer(),
            SegmentedButton<AppSupportedLanguage>(
              segments: const [
                ButtonSegment(
                  value: AppSupportedLanguage.vi,
                  label: Text('VI'),
                ),
                ButtonSegment(
                  value: AppSupportedLanguage.en,
                  label: Text('EN'),
                ),
              ],
              onSelectionChanged: (appSupportedLanguages) {
                ref
                    .read(appLanguageProvider.notifier)
                    .onChanged(appSupportedLanguages.first.name);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ref.colors.mainText),
              ),
              selected: {appSupportedLanguage},
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
