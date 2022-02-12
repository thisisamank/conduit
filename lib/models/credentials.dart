import 'dart:convert';

class Credentials {
  Credentials({
    required this.user,
  });

  final User user;

  factory Credentials.fromRawJson(String str) =>
      Credentials.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.email,
    required this.token,
    required this.username,
    required this.bio,
    required this.image,
  });

  final String email;
  final String token;
  final String username;
  final String bio;
  final String image;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        token: json["token"],
        username: json["username"],
        bio: json["bio"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "username": username,
        "bio": bio,
        "image": image,
      };
}
