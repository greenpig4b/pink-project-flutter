class FaqList{
  final List<Faqs> faqList;

  FaqList({
    required this.faqList
});

  factory FaqList.fromJson(Map<String, dynamic> json) {
    List<dynamic> faqListJson = json["faqs"] ?? [];
    List<Faqs> newFaqListJson = faqListJson.map((e) => Faqs.fromJson(e)).toList();

    return FaqList(
      faqList: newFaqListJson
    );
  }
//
}

class Faqs{
  final int? id;
  final String? title;
  final String? content;
  final String? username;
  final String? classification;
  final String? createdAt;

  Faqs({
    this.id,
    this.title,
    this.content,
    this.username,
    this.classification,
    this.createdAt
  });

  factory Faqs.fromJson(Map<String, dynamic> json) {
    return Faqs(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      content: json["content"] ?? "",
      username: json["username"] ?? "",
      classification: json["classification"] ?? "",
      createdAt: json["createdAt"] ?? "",
    );
  }
}