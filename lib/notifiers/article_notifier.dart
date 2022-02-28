import 'package:conduit/constants/api_endpoints.dart';
import 'package:conduit/models/articles.dart';
import 'package:conduit/notifiers/states/custom_async_value.dart';
import 'package:conduit/repository/article_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlesNotifier extends StateNotifier<AsyncValue<TotalArticles>> {
  ArticlesNotifier(this._articleRepository) : super(const AsyncValue.loading());
  final BaseArticleRepository _articleRepository;

  Future<void> fetchAllArticles({
    String? tag,
    String? author,
    String? favorited,
    int limit = ApiEndpoints.paginationLimit,
  }) async {
    final articleStatus = await _articleRepository.fetchAllArticles(
      tag: tag,
      author: author,
      favorited: favorited,
      limit: limit,
    );
    state = articleStatus.fold(
      (articles) => AsyncValue.data(articles),
      (failure) => AsyncValue.error(failure),
    );
  }

  Future<void> fetchFeedArticles({
    int limit = ApiEndpoints.paginationLimit,
  }) async {
    final articleStatus =
        await _articleRepository.fetchFeedArticles(limit: limit);
    state = articleStatus.fold(
      (articles) => AsyncValue.data(articles),
      (failure) => AsyncValue.error(failure),
    );
  }
}

class ArticleCrudNotifier extends StateNotifier<CustomAsyncValue<Article>> {
  ArticleCrudNotifier(this._articleRepository)
      : super(const CustomAsyncValue.loading());
  final BaseArticleRepository _articleRepository;

  Future<void> fetchArticle(String slug) async {
    state = const CustomAsyncValue.loading();
    final articleStatus = await _articleRepository.fetchArticle(slug);
    state = articleStatus.fold(
      (article) => CustomAsyncValue.data(article),
      (failure) => CustomAsyncValue.error(failure),
    );
  }

  Future<void> postArticle(Article article) async {
    state = const CustomAsyncValue.loading();
    final articleStatus = await _articleRepository.postArticle(article);
    state = articleStatus.fold(
      (article) => CustomAsyncValue.data(article),
      (failure) => CustomAsyncValue.error(failure),
    );
  }

  Future<void> deleteArticle(String slug) async {
    state = const CustomAsyncValue.loading();
    final articleStatus = await _articleRepository.deletAricle(slug);
    state = articleStatus.fold(
      (article) => const CustomAsyncValue.success(),
      (failure) => CustomAsyncValue.error(failure),
    );
  }

  Future<void> updateArticle({
    required String slug,
    required Article article,
  }) async {
    state = const CustomAsyncValue.loading();
    final articleStatus = await _articleRepository.updateArticle(
      article: article,
      slug: slug,
    );
    state = articleStatus.fold(
      (article) => CustomAsyncValue.data(article),
      (failure) => CustomAsyncValue.error(failure),
    );
  }
}
