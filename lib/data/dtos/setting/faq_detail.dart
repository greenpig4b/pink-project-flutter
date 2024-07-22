class FaqDetail{
  final Faq? faq;

  FaqDetail({
    this.faq
  });

  factory FaqDetail.fromJson(Map<String, dynamic> json) {
    return FaqDetail(
      faq: json["faq"] != null ? Faq.fromJson(json["faq"]) : null,
    );
  }
//
}

class Faq {
  final int? id;
  final String? title;
  final String? content;
  final String? username;
  final String? classification;
  final String? createdAt;

  Faq({
    this.id,
    this.title,
    this.content,
    this.username,
    this.classification,
    this.createdAt
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      username: json["username"] ?? "",
      classification: json["classification"] ?? "",
      createdAt: json["createdAt"] ?? "",
    );
  }
//
}