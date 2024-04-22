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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ElevatedButton.icon(
      onPressed: () {
        ref.read(favoriteButtonIconProvider.notifier).toggleFavorite();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onSurface,
        backgroundColor: colorScheme.surface, // Màu chữ giống màu của hệ thống
        side: BorderSide.none, // Xóa màu viền
      ),
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
        color: isFavorite
            ? Colors.red
            : colorScheme.onSurface, // Màu icon giống màu của hệ thống
        size: 25,
      ),
      label: const Text(''),
    );
  }
}
