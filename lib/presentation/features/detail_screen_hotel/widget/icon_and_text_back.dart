import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconTextBack extends ConsumerWidget {
  final VoidCallback onBackPressed;
  const IconTextBack({
    super.key,
    required this.onBackPressed,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        Text(
          ref.appLocalizations.soLuongPhongVaKhach,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Opacity(
          opacity: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
