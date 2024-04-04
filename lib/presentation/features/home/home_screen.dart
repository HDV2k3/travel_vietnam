// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../utilities/extensions/widget_ref_extension.dart';
// import '../../common_widgets/base/base_screen.dart';
// import '../settings/setting_screen.dart';
// import 'home_state.dart';
// import 'home_view_model.dart';
// import 'models/home_tab.dart';
//
// class HomeScreen extends BaseScreen {
//   const HomeScreen({super.key});
//
//   @override
//   BaseScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState
//     extends BaseScreenState<HomeScreen, HomeViewModel, HomeState> {
//   @override
//   Color? get backgroundColor => ref.colors.background;
//
//   @override
//   PreferredSizeWidget? buildAppBar(BuildContext context) {
//     return null;
//   }
//
//   @override
//   Widget buildBody(BuildContext context) {
//     final selectedTabIndex =
//         state.value?.selectedTabIndex ?? HomeTab.input.index;
//     if (selectedTabIndex == HomeTab.input.index) {
//       return const SizedBox();
//     } else if (selectedTabIndex == HomeTab.calendar.index) {
//       return const SizedBox();
//     } else if (selectedTabIndex == HomeTab.report.index) {
//       return const SizedBox();
//     } else if (selectedTabIndex == HomeTab.setting.index) {
//       return const SettingScreen();
//     } else {
//       return const SizedBox();
//     }
//   }
//
//   @override
//   Widget? buildBottomNavigationBar(BuildContext context) {
//     final selectedTabIndex =
//         state.value?.selectedTabIndex ?? HomeTab.input.index;
//
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: selectedTabIndex,
//       onTap: viewModel.onTabChanged,
//       elevation: 0,
//       items: [
//         BottomNavigationBarItem(
//           label: ref.appLocalizations.input,
//           icon: Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 4),
//             child: Icon(
//               selectedTabIndex == HomeTab.input.index
//                   ? Icons.add_box
//                   : Icons.add_box_outlined,
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: ref.appLocalizations.calendar,
//           icon: Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 4),
//             child: Icon(
//               selectedTabIndex == HomeTab.calendar.index
//                   ? Icons.calendar_month
//                   : Icons.calendar_month_outlined,
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: ref.appLocalizations.report,
//           icon: Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 4),
//             child: Icon(
//               selectedTabIndex == HomeTab.report.index
//                   ? Icons.pie_chart
//                   : Icons.pie_chart_outline,
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: ref.appLocalizations.setting,
//           icon: Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 4),
//             child: Icon(
//               selectedTabIndex == HomeTab.setting.index
//                   ? Icons.settings
//                   : Icons.settings_outlined,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   AsyncValue<HomeState> get state => ref.watch(homeViewModelProvider);
//
//   @override
//   HomeViewModel get viewModel => ref.read(homeViewModelProvider.notifier);
// }
