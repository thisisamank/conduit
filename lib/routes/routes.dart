import 'package:conduit/routes/route_names.dart';
import 'package:conduit/view/auth/login_screen.dart';
import 'package:conduit/view/onboarding/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: appRoutes);

final appRoutes = <GoRoute>[
  _generateGoRoute(AppRouteNames.splashScreen, const SplashScreen()),
  _generateGoRoute(AppRouteNames.loginScreen, const LoginScreen())
];

GoRoute _generateGoRoute(
  String path,
  Widget child,
) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
