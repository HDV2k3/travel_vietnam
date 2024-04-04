import 'package:chandoiqua/presentation/features/settings/widgets/setting_language_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/extensions/widget_ref_extension.dart';
import '../../common_widgets/base/base_screen.dart';
import 'setting_state.dart';
import 'setting_view_model.dart';
import 'widgets/setting_theme_item.dart';

class SettingScreen extends BaseScreen {
  const SettingScreen({super.key});

  @override
  BaseScreenState createState() => _SettingScreenState();
}

class _SettingScreenState
    extends BaseScreenState<SettingScreen, SettingViewModel, SettingState> {
  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(ref.appLocalizations.setting),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 16,
        ),
        SettingThemeItem(),
        SizedBox(
          height: 16,
        ),
        SettingLanguageItem(),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  @override
  AsyncValue<SettingState> get state => ref.watch(settingViewModelProvider);

  @override
  SettingViewModel get viewModel => ref.read(settingViewModelProvider.notifier);
}
