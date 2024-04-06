import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/extensions/widget_ref_extension.dart';
import '../../common_widgets/base/base_screen.dart';
import '../discovery/discovery_screen.dart';
import '../settings/setting_screen.dart';
import 'home_state.dart';
import 'home_view_model.dart';
import 'models/home_tab.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  BaseScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseScreenState<HomeScreen, HomeViewModel, HomeState> {
  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    final selectedTabIndex =
        state.value?.selectedTabIndex ?? HomeTab.home.index;
    if (selectedTabIndex == HomeTab.home.index) {
      return const DiscoveryScreen();
    } else if (selectedTabIndex == HomeTab.explore.index) {
      return const SizedBox();
    } else if (selectedTabIndex == HomeTab.heart.index) {
      return const SizedBox();
    } else if (selectedTabIndex == HomeTab.profile.index) {
      return const SettingScreen();
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    final selectedTabIndex =
        state.value?.selectedTabIndex ?? HomeTab.home.index;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedTabIndex,
      onTap: viewModel.onTabChanged,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          label: ref.appLocalizations.home,
          icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              selectedTabIndex == HomeTab.home.index
                  ? Icons.home
                  : Icons.home_outlined,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: ref.appLocalizations.explore,
          icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              selectedTabIndex == HomeTab.explore.index
                  ? Icons.explore
                  : Icons.explore_outlined,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: ref.appLocalizations.heart,
          icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              selectedTabIndex == HomeTab.heart.index
                  ? Icons.favorite
                  : Icons.favorite_outline,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: ref.appLocalizations.profile,
          icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Icon(
              selectedTabIndex == HomeTab.profile.index
                  ? Icons.person
                  : Icons.person_outline,
            ),
          ),
        ),
      ],
    );
  }

  @override
  AsyncValue<HomeState> get state => ref.watch(homeViewModelProvider);

  @override
  HomeViewModel get viewModel => ref.read(homeViewModelProvider.notifier);
}
