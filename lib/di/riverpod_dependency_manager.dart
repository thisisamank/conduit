import 'package:conduit/di/dependency_manager.dart';
import 'package:conduit/models/articles.dart';
import 'package:conduit/notifiers/article_notifier.dart';
import 'package:conduit/notifiers/auth_notifier.dart';
import 'package:conduit/notifiers/states/auth_states.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthStates>(
  (ref) => AuthNotifier(authRepository),
);

final articleNotifer =
    StateNotifierProvider<ArticlesNotifier, AsyncValue<TotalArticles>>(
  (ref) => ArticlesNotifier(articleRepository),
);
