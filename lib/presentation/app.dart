import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/resources/theme.dart';
import '../data/providers/app_theme_provider.dart';
import '../data/providers/go_router_provider.dart';
import '../utilities/extensions/widget_ref_extension.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(appThemeProvider);

    return MaterialApp.router(
      title: 'Travel VietNam',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme(isDarkTheme),
      darkTheme: AppThemes.appTheme(isDarkTheme),
      themeMode: ref.themeMode,
      routerConfig: ref.read(goRouterProvider),
    );
  }
}
