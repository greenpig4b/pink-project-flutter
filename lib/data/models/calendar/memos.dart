class Memos{
  final id;
  final content;

  Memos({
    required this.id,
    required this.content
  });

  factory Memos.fromJson(Map<String, dynamic> json) {
    return Memos(
      id: json["id"],
      content: json["content"],
    );
  }
//
}