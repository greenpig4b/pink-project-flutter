class MonthlyMemoDTO {
  final int userId;
  final List<DailyMemoListDTO> dailyMemoList;

  MonthlyMemoDTO({
    required this.userId,
    required this.dailyMemoList,
  });

  factory MonthlyMemoDTO.fromJson(Map<String, dynamic> json) {
    var list = json['DailyMemoRecords'] as List;
    List<DailyMemoListDTO> memoList =
        list.map((i) => DailyMemoListDTO.fromJson(i)).toList();

    return MonthlyMemoDTO(
      userId: json['userId'],
      dailyMemoList: memoList,
    );
  }
}

class DailyMemoListDTO {
  final String date;
  final List<DailyMemoDTO> dailyMemo;

  DailyMemoListDTO({
    required this.date,
    required this.dailyMemo,
  });

  factory DailyMemoListDTO.fromJson(Map<String, dynamic> json) {
    var list = json['DailyMemoRecord'] as List;
    List<DailyMemoDTO> memoDetailList =
        list.map((i) => DailyMemoDTO.fromJson(i)).toList();

    return DailyMemoListDTO(
      date: json['date'],
      dailyMemo: memoDetailList,
    );
  }
}

class DailyMemoDTO {
  final int id;
  final String title;
  final String content;

  DailyMemoDTO({
    required this.id,
    required this.title,
    required this.content,
  });

  factory DailyMemoDTO.fromJson(Map<String, dynamic> json) {
    return DailyMemoDTO(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}
