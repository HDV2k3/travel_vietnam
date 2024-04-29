import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_view_model.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/buttons_tabbar.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/list_view_discovery_all.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/list_view_hotel.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/search.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/slider.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/text_category.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscoveryScreen extends BaseScreen {
  const DiscoveryScreen({super.key});

  @override
  BaseScreenState createState() => _DiscoveryState();
}

class _DiscoveryState extends BaseScreenState<DiscoveryScreen,
    DiscoveryViewModel, DiscoveryState> {
  bool typing = true;
  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: SearchWidget(),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.yellow,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              child: ButtonTabbar(),
            ),
            const SizedBox(
              child: SliderImage(),
            ),
            const SizedBox(
              width: double.maxFinite,
              height: 300, // Set a fixed height for the SliderImage widget
              child: ListViewLocation(),
            ),
            Container(
              color: Colors.white,
              child: const SizedBox(
                width: double.maxFinite,
                child: TextTittle(),
              ),
            ),
            const SizedBox(
              width: double.maxFinite,
              height: 300, // Set a fixed height for the SliderImage widget
              child: ListViewHotel(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement state
  AsyncValue<DiscoveryState> get state => ref.watch(discoveryViewModelProvider);

  @override
  // TODO: implement viewModel
  DiscoveryViewModel get viewModel =>
      ref.read(discoveryViewModelProvider.notifier);
}

// @override
// Widget buildBody(BuildContext context) {
//   return SafeArea(
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.blue,
//                   Colors.white,
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Expanded(
//                   child: SearchWidget(),
//                 ),
//                 IconButton(
//                   icon: const Icon(
//                     Icons.notifications,
//                     color: Colors.yellow,
//                   ),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//           // SizedBox(
//           //   height: 750,
//           //   child: Container(
//           //     decoration: const BoxDecoration(
//           //       gradient: LinearGradient(
//           //         colors: [
//           //           Colors.white,
//           //           Colors.blue,
//           //         ],
//           //         begin: Alignment.topCenter,
//           //         end: Alignment.bottomCenter,
//           //       ),
//           //     ),
//           //     child: const ButtonTabbar(),
//           //   ),
//           // ),
//         ],
//       ),
//     ),
//   );
// }
