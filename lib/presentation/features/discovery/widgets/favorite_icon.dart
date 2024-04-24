import 'package:flutter/material.dart';


class FavoriteIcon extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  const FavoriteIcon({required this.isFavorite, super.key, required this.onPressed});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorite = false;
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        widget.onPressed();
      },
      child:
      Icon(
        _isFavorite ? Icons.favorite_outline_outlined : Icons.favorite,
        color: _isFavorite ? Colors.blueGrey : Colors.red,
        size: 24.0,
      ),
    );
  }
}