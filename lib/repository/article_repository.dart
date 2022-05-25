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
  Future<Either<TotalArticles, Failure>> fetchAllArticles({
    String? tag,
    String? author,
    String? favorited,
    int limit = ApiEndpoints.paginationLimit,
  });
  Future<Either<TotalArticles, Failure>> fetchFeedArticles({
    int limit = ApiEndpoints.paginationLimit,
  });
  Future<Either<Article, Failure>> fetchArticle(String slug);
  Future<Either<Article, Failure>> favouriteArticle(String slug,
      {required bool favStatus});
  Future<Either<Unit, Failure>> deleteAricle(String slug);
  Future<Either<Article, Failure>> updateArticle({
    required String slug,
    required Article article,
  });
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
  Future<Either<TotalArticles, Failure>> fetchAllArticles({
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
        queryParameters: {
          'limit': limit,
        },
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
  Future<Either<Article, Failure>> fetchArticle(String slug) async {
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

  @override
  Future<Either<Article, Failure>> updateArticle({
    required String slug,
    required Article article,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.articleFromSlugUrl(slug: slug),
        data: article.toJson(),
      );
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
  Future<Either<Unit, Failure>> deleteAricle(String slug) async {
    try {
      final response =
          await _dio.get(ApiEndpoints.articleFromSlugUrl(slug: slug));
      if (isSuccessfulResponse(response.statusCode!)) {
        return left(unit);
      }
      return right(Failure());
    } on DioError catch (e) {
      String message = DioErrorUtil.handleError(e);
      return right(Failure(message));
    }
  }

  @override
  Future<Either<Article, Failure>> favouriteArticle(
    String slug, {
    required bool favStatus,
  }) async {
    try {
      final Response response;
      if (favStatus) {
        response =
            await _dio.delete(ApiEndpoints.favouritesArticleUrl(slug: slug));
      } else {
        response =
            await _dio.post(ApiEndpoints.favouritesArticleUrl(slug: slug));
      }
      if (isSuccessfulResponse(response.statusCode!)) {
        final article = Article.fromJson(
            (response.data as Map<String, dynamic>)["article"]);
        return left(article);
      }
      return right(Failure());
    } on DioError catch (e) {
      String message = DioErrorUtil.handleError(e);
      return right(Failure(message));
    }
  }
}
