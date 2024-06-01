import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utilities/extensions/widget_ref_extension.dart';
import 'order_status.dart';

class OrderStatusItem extends ConsumerWidget {
  const OrderStatusItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        // Bọc Container trong InkWell
        onTap: () {
          // Chuyển trang khi được tap
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrderStatusPage(),
            ),
          );
        },
        borderRadius:
            BorderRadius.circular(16), // Để hiệu ứng gợn sóng cũng bo tròn
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            color: ref.colors.cellBackground,
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Icon(
                Icons.offline_bolt_outlined,
                color: ref.colors.mainText,
              ),
              const SizedBox(width: 8),
              Text(
                'Order Status',
                style: TextStyle(color: ref.colors.mainText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
