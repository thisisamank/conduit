import 'package:conduit/di/dependency_manager.dart';
import 'package:conduit/di/riverpod_dependency_manager.dart';
import 'package:conduit/notifiers/states/auth_states.dart';
import 'package:conduit/routes/route_names.dart';
import 'package:conduit/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  final auth = ref.watch(authNotifierProvider.notifier);
  await auth.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    ref.watch(initializationProvider);
    ref.listen<AuthStates>(
      authNotifierProvider,
      ((previous, next) {
        next.maybeWhen(
          initial: () => appRouter.go(AppRouteNames.splashScreen),
          unAuthenticated: () => appRouter.go(AppRouteNames.loginScreen),
          authenticated: (value) {
            userManager.init(value.user);

            // if (user?.bio == "") {
            //   appRouter.go(AppRouteNames.prfileUpdateScreen);
            // } else {
            //   appRouter.go(AppRouteNames.homeScreen);
            // }
            appRouter.go(AppRouteNames.feedScreen);
          },
          orElse: () {},
        );
      }),
    );
    return MaterialApp.router(
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
