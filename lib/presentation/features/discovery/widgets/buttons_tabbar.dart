import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/GroupView.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonTabbar extends ConsumerWidget {
  const ButtonTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            radius: 12,
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            borderWidth: 1,
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
            height: 50,
            tabs: [
              Tab(text: ref.appLocalizations.all),
              Tab(text: ref.appLocalizations.sai_gon),
              Tab(text: ref.appLocalizations.da_nang),
              Tab(text: ref.appLocalizations.ha_noi),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                GroupViewAll(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
