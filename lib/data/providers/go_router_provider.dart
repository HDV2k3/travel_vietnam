// import 'package:chandoiqua/presentation/features/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/route.dart';
import '../../presentation/features/discovery/discovery_screen.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: RoutePaths.root,
        builder: (context, state) {
          // return const OnBoardingScreen();
          return const DiscoveryScreen();
        },
        routes: const [],
      ),
    ],
  );
}
