import 'package:conduit/models/articles.dart';
import 'package:conduit/routes/route_names.dart';
import 'package:conduit/view/auth/sign_in_screen.dart';
import 'package:conduit/view/auth/sign_up_screen.dart';
import 'package:conduit/view/feed/article_screen.dart';
import 'package:conduit/view/feed/feed_screen.dart';
import 'package:conduit/view/home_screen.dart';
import 'package:conduit/view/onboarding/splash_screen.dart';
import 'package:conduit/view/profile/profile_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: appRoutes);

final appRoutes = <GoRoute>[
  _generateGoRoute(AppRouteNames.splashScreen, const SplashScreen()),
  _generateGoRoute(AppRouteNames.loginScreen, SignInScreen()),
  _generateGoRoute(AppRouteNames.signUpScreen, SignUpScreen()),
  _generateGoRoute(AppRouteNames.homeScreen, const HomeScreen()),
  _generateGoRoute(
      AppRouteNames.prfileUpdateScreen, const ProfileUpdateScreen()),
  _generateGoRoute(AppRouteNames.feedScreen, const FeedScreen()),
  GoRoute(
    path: AppRouteNames.articleScreen,
    pageBuilder: (context, state) {
      final article = state.extra as Article;
      return CustomTransitionPage<void>(
        child: ArticleScreen(article),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      );
    },
  ),
];

GoRoute _generateGoRoute(String path, Widget child) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
