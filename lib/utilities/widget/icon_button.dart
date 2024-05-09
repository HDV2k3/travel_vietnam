import 'package:flutter/material.dart';

class IconButtonBar extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onSharePressed;

  const IconButtonBar({
    super.key,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        buttonBarTheme: const ButtonBarThemeData(
          buttonMinWidth: 0,
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
        ),
      ),
      child: ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          const SizedBox(
            width: 250,
          ),
          IconButton(
            onPressed: onFavoritePressed,
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
          IconButton(
            onPressed: onSharePressed,
            icon: const Icon(Icons.share),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
