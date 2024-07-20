class MonthlyMemoDTO {
  final int userId;
  final String year;
  final String month;
  final List<DailyMemoListDTO> dailyMemoList;

  MonthlyMemoDTO({
    required this.userId,
    required this.year,
    required this.month,
    required this.dailyMemoList,
  });

  factory MonthlyMemoDTO.fromJson(Map<String, dynamic> json) {
    var list = json['dailyMemoRecords'] as List;
    List<DailyMemoListDTO> memoList =
    list.map((i) => DailyMemoListDTO.fromJson(i)).toList();

    return MonthlyMemoDTO(
      userId: json['userId'],
      year: json['year'],
      month: json['month'],
      dailyMemoList: memoList,
    );
  }

  @override
  String toString() {
    return 'MonthlyMemoDTO(userId: $userId, year: $year, month: $month, dailyMemoList: $dailyMemoList)';
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
    var list = json['dailyMemoRecordList'] as List;
    List<DailyMemoDTO> memoDetailList =
    list.map((i) => DailyMemoDTO.fromJson(i)).toList();

    return DailyMemoListDTO(
      date: json['date'],
      dailyMemo: memoDetailList,
    );
  }

  @override
  String toString() {
    return 'DailyMemoListDTO(date: $date, dailyMemo: $dailyMemo)';
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

  @override
  String toString() {
    return 'DailyMemoDTO(id: $id, title: $title, content: $content)';
  }
}

class SaveMemoRespDTO {
  final int id;
  final int userId;
  final String monthDateDay; // "MM.dd(요일)" 형식의 날짜
  final String title;
  final String content;

  SaveMemoRespDTO({
    required this.id,
    required this.userId,
    required this.monthDateDay,
    required this.title,
    required this.content,
  });

  factory SaveMemoRespDTO.fromJson(Map<String, dynamic> json) {
    return SaveMemoRespDTO(
      id: json['id'],
      userId: json['userId'],
      monthDateDay: json['monthDateDay'],
      title: json['title'],
      content: json['content'],
    );
  }

  @override
  String toString() {
    return 'SaveMemoRespDTO(id: $id, userId: $userId, monthDateDay: $monthDateDay, title: $title, content: $content)';
  }
}
class UpdateMemoRespDTO {
  final int id;
  final int userId;
  final String title;
  final String content;

  UpdateMemoRespDTO({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
  });

  factory UpdateMemoRespDTO.fromJson(Map<String, dynamic> json) {
    return UpdateMemoRespDTO(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      content: json['content'],
    );
  }

  @override
  String toString() {
    return 'UpdateMemoRespDTO(id: $id, userId: $userId, title: $title, content: $content)';
  }
}
