import 'package:chandoiqua/presentation/features/onboarding/OnboardingScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/route.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: RoutePaths.root,
        builder: (context, state) {
          return const OnboardingScreen();
        },
        routes: const [],
      ),
    ],
  );
}
