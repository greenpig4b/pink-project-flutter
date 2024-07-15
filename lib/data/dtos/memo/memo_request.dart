class MemoSaveDTO {
  final String title;
  final String content;
  final DateTime createdDate;

  MemoSaveDTO({
    required this.title,
    required this.content,
    required this.createdDate,
    });

  Map<String, dynamic> toJson() =>
      {
        "title": title,
        "content": content,
        "yearMonthDate": createdDate,
      };
}

class MemoUpdateDTO {
  final String title;
  final String content;

  MemoUpdateDTO({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson() =>
      {
        "title": title,
        "content": content,
      };
}