import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_theme_provider.dart';
import '../../../../utilities/extensions/widget_ref_extension.dart';

class SettingThemeItem extends ConsumerWidget {
  const SettingThemeItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(appThemeProvider);

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
              ref.appLocalizations.darkAppearance,
              style: TextStyle(color: ref.colors.mainText),
            ),
            const SizedBox(
              width: 8,
            ),
            const Spacer(),
            Switch(
              value: isDarkTheme,
              onChanged: (value) {
                ref.read(appThemeProvider.notifier).onToggle();
              },
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
