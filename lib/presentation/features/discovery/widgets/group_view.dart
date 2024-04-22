import 'package:chandoiqua/presentation/features/discovery/widgets/list_view_discovery_all.dart';
import 'package:chandoiqua/presentation/features/discovery/widgets/text_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'list_view_hotel.dart';

class Group extends ConsumerWidget {
  const Group({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const listViewDiscovery = ListViewAll();
    const listViewHotel = ListViewHotel();

    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: listViewDiscovery,
          ),
          TextTittle(),
          Expanded(
            child: listViewHotel,
          ),
        ],
      ),
    );
  }
}
