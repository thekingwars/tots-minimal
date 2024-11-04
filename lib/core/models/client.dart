class Client {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String? address;
  final String? photo;
  final String? caption;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;

  Client({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    this.address,
    this.photo,
    this.caption,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"] ?? 0,
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        address: json["address"] ?? '',
        photo: json["photo"] ?? '',
        caption: json["caption"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
