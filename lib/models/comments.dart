import 'dart:convert';

import 'package:conduit/models/author.dart';

class TotalComments {
  TotalComments({
    required this.comments,
  });

  final List<Comment> comments;

  factory TotalComments.fromRawJson(String str) =>
      TotalComments.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalComments.fromJson(Map<String, dynamic> json) => TotalComments(
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.body,
    required this.author,
  });

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String body;
  final Author author;

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('comment')) {
      json = json['comment'];
    }
    return Comment(
      id: json["id"] as int,
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      body: json["body"].toString(),
      author: Author.fromJson(json["author"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "body": body,
        "author": author.toJson(),
      };
}
