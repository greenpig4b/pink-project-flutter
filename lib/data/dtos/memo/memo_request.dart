import 'package:intl/intl.dart';

class MemoSaveDTO {
  final int userId;
  final String title;
  final String content;
  final String createdDate;

  MemoSaveDTO({
    required this.userId,
    required this.title,
    required this.content,
    required DateTime createdDate,
  }) : createdDate = DateFormat('yyyy-MM-dd').format(createdDate);

  Map<String, dynamic> toJson() =>
      {
        "userId":userId,
        "title": title,
        "content": content,
        "yearMonthDate": createdDate,
      };
}

class MemoUpdateDTO {
  final int id;
  final int userId;
  final String title;
  final String content;

  MemoUpdateDTO({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson() =>
      {
        "id":id,
        "userId":userId,
        "title": title,
        "content": content,
      };
}