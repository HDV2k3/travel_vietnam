import 'package:chandoiqua/presentation/features/cart_screen/cart_screen.dart';
import 'package:chandoiqua/presentation/features/favorite_screen/favorite_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/extensions/widget_ref_extension.dart';
import '../../common_widgets/base/base_screen.dart';
import '../discovery/discovery_screen.dart';
import '../map/map.dart';
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
      return const GGMap();
    } else if (selectedTabIndex == HomeTab.heart.index) {
      return const FavoriteScreen();
    } else if (selectedTabIndex == HomeTab.cart.index) {
      return const CartScreen();
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

    return CustomNavigationBar(
      strokeColor: Colors.transparent,
      scaleFactor: 0.5,
      elevation: 0,
      backgroundColor: Colors.white,
      iconSize: 24.0,
      selectedColor: Colors.blue,
      unSelectedColor: Colors.grey,
      items: [
        CustomNavigationBarItem(
          icon: Icon(
            selectedTabIndex == HomeTab.home.index
                ? Icons.home
                : Icons.home_outlined,
          ),
          title: Text(ref.appLocalizations.home),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            selectedTabIndex == HomeTab.explore.index
                ? Icons.explore
                : Icons.explore_outlined,
          ),
          title: Text(ref.appLocalizations.explore),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            selectedTabIndex == HomeTab.heart.index
                ? Icons.favorite
                : Icons.favorite_outline,
          ),
          title: Text(ref.appLocalizations.heart),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            selectedTabIndex == HomeTab.cart.index
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
          ),
          title: Text(ref.appLocalizations.cart),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            selectedTabIndex == HomeTab.profile.index
                ? Icons.person
                : Icons.person_outline,
          ),
          title: Text(ref.appLocalizations.profile),
        ),
      ],
      currentIndex: selectedTabIndex,
      onTap: viewModel.onTabChanged,
    );
  }

  @override
  AsyncValue<HomeState> get state => ref.watch(homeViewModelProvider);

  @override
  HomeViewModel get viewModel => ref.read(homeViewModelProvider.notifier);
}
