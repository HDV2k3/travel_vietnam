import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextTittle extends ConsumerWidget {
  const TextTittle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.appLocalizations.category,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
