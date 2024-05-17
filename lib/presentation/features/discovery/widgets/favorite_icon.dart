// import 'package:flutter/material.dart';
//
// class FavoriteIcon extends StatefulWidget {
//   final bool isFavorite;
//   final VoidCallback onPressed;
//   const FavoriteIcon(
//       {required this.isFavorite, super.key, required this.onPressed});
//
//   @override
//   _FavoriteIconState createState() => _FavoriteIconState();
// }
//
// class _FavoriteIconState extends State<FavoriteIcon> {
//   bool _isFavorite = true;
//   @override
//   void initState() {
//     super.initState();
//     // _isFavorite = widget.isFavorite;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isFavorite = !_isFavorite;
//         });
//         // widget.onPressed();
//       },
//       child: Icon(
//         _isFavorite ? Icons.favorite_outline_outlined : Icons.favorite,
//         color: _isFavorite ? Colors.blueGrey : Colors.red,
//         size: 24.0,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/providers/favorite_provider.dart';

class FavoriteIcon extends ConsumerWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const FavoriteIcon(
      {required this.isFavorite, super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(favoriteProvider);
    return GestureDetector(
      onTap: () {
        ref.read(favoriteProvider.notifier).onToggle();
        onPressed();
      },
      child: Icon(
        favorite ? Icons.favorite_outline_outlined : Icons.favorite,
        color: favorite ? Colors.yellowAccent : Colors.red,
        size: 24.0,
      ),
    );
  }
}
