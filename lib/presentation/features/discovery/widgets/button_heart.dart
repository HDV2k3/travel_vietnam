import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButtonIcon extends StateNotifier<bool> {
  FavoriteButtonIcon() : super(false);

  void toggleFavorite() {
    state = !state;
  }
}

final favoriteButtonIconProvider =
    StateNotifierProvider<FavoriteButtonIcon, bool>((ref) {
  return FavoriteButtonIcon();
});

class FavoriteIconButton extends ConsumerWidget {
  const FavoriteIconButton({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteButtonIconProvider);

    return ElevatedButton.icon(
      onPressed: () {
        ref.read(favoriteButtonIconProvider.notifier).toggleFavorite();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
        color: isFavorite ? Colors.red : null,
      ),
      label: const Text(''),
    );
  }
}
