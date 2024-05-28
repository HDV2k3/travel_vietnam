import 'package:chandoiqua/presentation/features/discovery/widgets/search_delegate.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: TextField(
          decoration: InputDecoration(
            hintText: ref.appLocalizations.timKiem,
            hintStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              // Remove border style when not focused
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              // Border style when focused
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 12), // Adjust padding for height
          ),
          style: const TextStyle(fontSize: 14),
          onTap: () {
            showSearch(context: context, delegate: SearchProducts(ref));
          },
        ),
        //     IconButton(
        //       icon: const Icon(
        //         Icons.account_circle,
        //         color: Colors.yellowAccent,
        //       ),
        //       onPressed: () {},
        //     ),
      ),
    );
  }
}
