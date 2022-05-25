import 'dart:convert';

class Author {
  Author({
    required this.username,
    required this.bio,
    required this.image,
    required this.following,
  });

  final String username;
  final String bio;
  final String image;
  final bool following;

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        username: json["username"],
        bio: json["bio"] ?? "",
        image: json["image"] ?? "",
        following: json["following"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "bio": bio,
        "image": image,
        "following": following,
      };
}
