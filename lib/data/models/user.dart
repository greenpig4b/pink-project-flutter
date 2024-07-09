class User {
  final int id;
  final String oauthProvider;

  User({required this.id, required this.oauthProvider});



  // Map<String, dynamic> toJson() => {
//   "id": id,
// };

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        oauthProvider = json["oauthProvider"];
}



