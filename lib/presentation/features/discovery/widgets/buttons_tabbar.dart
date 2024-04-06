import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/list_view_discovery.dart';
import 'package:chandoiqua/utilities/extensions/string_extension.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/app_language_provider.dart';

class ButtonTabbar extends ConsumerWidget {
  const ButtonTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSupportedLanguage =
        ref.watch(appLanguageProvider).appSupportedLanguage;

    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            radius: 12,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            borderWidth: 2,
            borderColor: Colors.transparent,
            center: false,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
            height: 56,
            tabs: [
              Tab(text: ref.appLocalizations.all),
              Tab(text: ref.appLocalizations.sai_gon),
              Tab(text: ref.appLocalizations.da_nang),
              Tab(text: ref.appLocalizations.ha_noi),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                const HorizontalListView(),
                Container(child: Text('Content 2')),
                Container(child: Text('Content 3')),
                Container(child: Text('Content 4')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
