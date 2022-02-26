import 'dart:async';

import 'package:conduit/constants/api_endpoints.dart';
import 'package:conduit/models/articles.dart';
import 'package:conduit/models/failure.dart';
import 'package:conduit/utils/dio_errors.dart';
import 'package:conduit/utils/response_conditions.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class BaseArticleRepository {
  Future<Either<Article, Failure>> postArticle(Article article);
  Future<Either<TotalArticles, Failure>> fetchArticles({
    String? tag,
    String? author,
    String? favorited,
    int limit = ApiEndpoints.paginationLimit,
  });
  Future<Either<TotalArticles, Failure>> fetchFeedArticles({
    int limit = ApiEndpoints.paginationLimit,
  });
  Future<Either<Article, Failure>> getArticleFromSlug(String slug);
}

class ArticleRepository extends BaseArticleRepository {
  final Dio _dio;
  ArticleRepository(this._dio);
  @override
  Future<Either<Article, Failure>> postArticle(Article article) async {
    try {
      final response =
          await _dio.post(ApiEndpoints.articlesUrl, data: article.toJson());
      if (isSuccessfulResponse(response.statusCode!)) {
        final articleJson = response.data as Map<String, dynamic>;
        final article = Article.fromJson(articleJson);
        return left(article);
      }
      return right(Failure());
    } on DioError catch (e) {
      String message = DioErrorUtil.handleError(e);
      return right(Failure(message));
    }
  }

  @override
  Future<Either<TotalArticles, Failure>> fetchArticles({
    String? tag,
    String? author,
    String? favorited,
    int limit = ApiEndpoints.paginationLimit,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.articlesUrl,
        queryParameters: {
          'limit': limit,
          if (tag != null) 'tag': tag,
          if (author != null) 'author': author,
          if (favorited != null) 'favorited': favorited,
        },
      );
      if (isSuccessfulResponse(response.statusCode!)) {
        final articleJson = response.data as Map<String, dynamic>;
        final article = TotalArticles.fromJson(articleJson);
        return left(article);
      }
      return right(Failure());
    } on DioError catch (e) {
      String message = DioErrorUtil.handleError(e);
      return right(Failure(message));
    }
  }

  @override
  Future<Either<TotalArticles, Failure>> fetchFeedArticles({
    int limit = ApiEndpoints.paginationLimit,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.feedArticlesUrl,
        queryParameters: {'limit': limit},
      );
      if (isSuccessfulResponse(response.statusCode!)) {
        final articlesJson = response.data as Map<String, dynamic>;
        final article = TotalArticles.fromJson(articlesJson);
        return left(article);
      }
      return right(Failure());
    } on DioError catch (e) {
      String message = DioErrorUtil.handleError(e);
      return right(Failure(message));
    }
  }

  @override
  Future<Either<Article, Failure>> getArticleFromSlug(String slug) async {
    try {
      final response =
          await _dio.get(ApiEndpoints.articleFromSlugUrl(slug: slug));
      if (isSuccessfulResponse(response.statusCode!)) {
        final articleJson = response.data as Map<String, dynamic>;
        final article = Article.fromJson(articleJson);
        return left(article);
      }
      return right(Failure());
    } on DioError catch (e) {
      String message = DioErrorUtil.handleError(e);
      return right(Failure(message));
    }
  }
}
