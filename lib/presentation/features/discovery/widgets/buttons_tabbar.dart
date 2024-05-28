import 'package:buttons_tabbar/buttons_tabbar.dart';
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
            radius: 30,
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            borderWidth: 0, // Remove the border
            borderColor: Colors.transparent,
            unselectedBackgroundColor: Colors.lightBlue,
            center: false,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.yellow.shade900, // Change the background color
                  Colors.yellowAccent,
                  Colors.blueAccent,
                ],
              ),
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), // Set the unselected label color to white
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            height: 40,
            tabs: [
              Tab(text: ref.appLocalizations.tatCa),
              Tab(text: ref.appLocalizations.sai_gon),
              Tab(text: ref.appLocalizations.da_nang),
              Tab(text: ref.appLocalizations.ha_noi),
            ],
          ),
        ],
      ),
    );
  }
}
