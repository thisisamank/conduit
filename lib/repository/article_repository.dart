import 'package:conduit/models/articles.dart';
import 'package:dio/dio.dart';

abstract class BaseArticleRepository {
  Future<Article> postArticle(Article article);
}

class ArticleRepository extends BaseArticleRepository {
  final Dio _dio;
  ArticleRepository(this._dio);
  @override
  Future<Article> postArticle(Article article) {
    throw UnimplementedError();
  }
}
