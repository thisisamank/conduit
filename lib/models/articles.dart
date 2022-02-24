import 'dart:convert';

import 'package:conduit/models/credentials.dart';

class TotalArticles {
  TotalArticles({
    required this.articles,
    required this.articlesCount,
  });

  final List<Article> articles;
  final int articlesCount;

  factory TotalArticles.fromRawJson(String str) =>
      TotalArticles.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalArticles.fromJson(Map<String, dynamic> json) => TotalArticles(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
        articlesCount: json["articlesCount"],
      );

  Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "articlesCount": articlesCount,
      };
}

class Article {
  Article({
    required this.title,
    required this.description,
    required this.body,
    required this.tagList,
    this.createdAt,
    this.slug = "",
    this.updatedAt,
    this.author,
    this.favoritesCount = 0,
    this.favorited = false,
  });

  final String title;
  final String description;
  final String body;
  final List<String> tagList;
  String slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? author;
  int favoritesCount;
  bool favorited;

  factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        body: json["body"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tagList: List<String>.from(json["tagList"].map((x) => x)),
        author: User.fromJson(json["author"]),
        favoritesCount: json["favoritesCount"],
        favorited: json["favorited"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "body": body,
        "tagList": List<dynamic>.from(tagList.map((x) => x)),
      };
}
