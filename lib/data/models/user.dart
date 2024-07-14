class User {
  final int id;
  final String email;
  final String password;

  User(this.id, this.email, this.password);

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
  };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        password = json["password"];
}
