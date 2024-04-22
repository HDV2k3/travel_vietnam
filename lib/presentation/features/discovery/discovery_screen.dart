import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_state.dart';
import 'package:chandoiqua/presentation/features/discovery/discovery_view_model.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/buttons_tabbar.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscoveryScreen extends BaseScreen {
  const DiscoveryScreen({super.key});

  @override
  BaseScreenState createState() => _DiscoveryState();
}

class _DiscoveryState extends BaseScreenState<DiscoveryScreen,
    DiscoveryViewModel, DiscoverryState> {
  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(ref.appLocalizations.discovery),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.pink,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ref.appLocalizations.title_discovery,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    hintText: ref.appLocalizations.location_search,
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(height: 600, child: ButtonTabbar()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement state
  AsyncValue<DiscoverryState> get state =>
      ref.watch(discoveryViewModelProvider);

  @override
  // TODO: implement viewModel
  DiscoveryViewModel get viewModel =>
      ref.read(discoveryViewModelProvider.notifier);
}
