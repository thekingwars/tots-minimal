class UserLoggedIn {
  final int id;
  final String email;
  final String tokenType;
  final String accessToken;

  UserLoggedIn({
    required this.id,
    required this.email,
    required this.tokenType,
    required this.accessToken,
  });

  factory UserLoggedIn.fromJson(Map<String, dynamic> json) => UserLoggedIn(
        id: json["id"],
        email: json["email"],
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "token_type": tokenType,
        "access_token": accessToken,
      };
}
