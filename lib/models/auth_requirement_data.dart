import 'dart:convert';

class AuthRequirementData {
  AuthRequirementData({
    this.username = "",
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "user": {
          "username": username,
          "email": email,
          "password": password,
        },
      };
}
