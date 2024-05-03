import 'package:flutter/material.dart';

class IconTextBack extends StatelessWidget {
  final VoidCallback onBackPressed;
  const IconTextBack({
    super.key,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        const Text(
          'Số lượng phòng và khách',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
