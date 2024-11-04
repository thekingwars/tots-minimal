class Client {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? address;
  final String? photo;
  final String? caption;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;

  Client({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.address,
    this.photo,
    this.caption,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"] ?? 0,
        firstname: json["firstname"] ?? 'Jhon',
        lastname: json["lastname"] ?? 'Doe',
        email: json["email"] ?? 'alguiencoloconull@gmail.com',
        address: json["address"] ?? '',
        photo: json["photo"] ?? '',
        caption: json["caption"] ?? '',
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        userId: json["user_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "photo": photo,
      };
}
