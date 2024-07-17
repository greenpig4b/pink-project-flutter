class ChartResponseDTO {
  final int? monthCount;
  final MonthDTO? chartMonth;
  final WeeklyDTO? chartWeekly;

  ChartResponseDTO({
    this.monthCount,
    this.chartMonth,
    this.chartWeekly,
  });

  factory ChartResponseDTO.fromJson(Map<String, dynamic> json) {
    return ChartResponseDTO(
      monthCount: json["monthCount"],
      chartMonth: json["chartMonth"] != null ? MonthDTO.fromJson(json["chartMonth"]) : null,
      chartWeekly: json["chartWeekly"] != null ? WeeklyDTO.fromJson(json["chartWeekly"]) : null,
    );
  }
}

class MonthDTO {
  final List<MonthIncomeDTO>? incomeList;
  final List<MonthSpendingDTO>? spendingList;

  MonthDTO({
    this.incomeList,
    this.spendingList,
  });

  factory MonthDTO.fromJson(Map<String, dynamic> json) {
    var incomeListFromJson = json['incomeList'] as List? ?? [];
    List<MonthIncomeDTO> incomeList = incomeListFromJson.map((i) => MonthIncomeDTO.fromJson(i)).toList();

    var spendingListFromJson = json['spendingList'] as List? ?? [];
    List<MonthSpendingDTO> spendingList = spendingListFromJson.map((i) => MonthSpendingDTO.fromJson(i)).toList();

    return MonthDTO(
      incomeList: incomeList,
      spendingList: spendingList,
    );
  }
}

class WeeklyDTO {
  final List<WeeklyIncomeDTO>? incomeList;
  final List<WeeklySpendingDTO>? spendingList;

  WeeklyDTO({
    this.incomeList,
    this.spendingList,
  });

  factory WeeklyDTO.fromJson(Map<String, dynamic> json) {
    var incomeListFromJson = json['incomeList'] as List? ?? [];
    List<WeeklyIncomeDTO> incomeList = incomeListFromJson.map((i) => WeeklyIncomeDTO.fromJson(i)).toList();

    var spendingListFromJson = json['spendingList'] as List? ?? [];
    List<WeeklySpendingDTO> spendingList = spendingListFromJson.map((i) => WeeklySpendingDTO.fromJson(i)).toList();

    return WeeklyDTO(
      incomeList: incomeList,
      spendingList: spendingList,
    );
  }
}

class MonthIncomeDTO {
  final int? id;
  final String? category;
  final String? amount;
  final categoryImagePath;
  final DateTime? date;

  MonthIncomeDTO({
    this.id,
    this.category,
    this.amount,
    String? categoryImagePath,
    this.date,
  }): categoryImagePath = _getEmojiForCategory(category);

  factory MonthIncomeDTO.fromJson(Map<String, dynamic> json) {
    return MonthIncomeDTO(
      id: json['id'],
      category: json['category'] ?? '',
      amount: json['amount'],
      categoryImagePath: '',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  static String _getEmojiForCategory(String? category) {
    switch (category) {
      case '월급':
        return '💰';
      case '부수입':
        return '💸';
      case '용돈':
        return '🤑';
      case '상여':
        return '🏅';
      case '금융소득':
        return '🏦';
      case '기타':
        return '🎸';
      default:
        return '';
    }
  }

}

class MonthSpendingDTO {
  final int? id;
  final String? category;
  final String? amount;
  final String? categoryImagePath;
  final DateTime? date;

  MonthSpendingDTO({
    this.id,
    this.category,
    this.amount,
    String? categoryImagePath,
    this.date,
  }): categoryImagePath = _getEmojiForCategory(category);


  factory MonthSpendingDTO.fromJson(Map<String, dynamic> json) {
    return MonthSpendingDTO(
      id: json['id'],
      category: json['category'] ?? '',
      amount: json['amount'],
      categoryImagePath: '',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  static String _getEmojiForCategory(String? category) {
    switch (category) {
      case '식비':
        return '🍱';
      case '교통/차량':
        return '🖼️';
      case '마트/편의점':
        return '🛒';
      case '패션/미용':
        return '🧥';
      case '생활용품':
        return '🪑';
      case '주거/통신':
        return '🏠';
      case '건강':
        return '🧘';
      case '교육':
        return '📖';
      case '경조사/회비':
        return '🎁';
      case '부모님':
        return '👵';
      default:
        return '💰';
    }
  }

}

class WeeklyIncomeDTO {
  final int? id;
  final String? category;
  final String? amount;
  final categoryImagePath;
  final DateTime? date;

  WeeklyIncomeDTO({
    this.id,
    this.category,
    this.amount,
    String? categoryImagePath,
    this.date,
  }): categoryImagePath = _getEmojiForCategory(category);

  factory WeeklyIncomeDTO.fromJson(Map<String, dynamic> json) {
    return WeeklyIncomeDTO(
      id: json['id'],
      category: json['category'] ?? '',
      amount: json['amount'],
      categoryImagePath:'',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  static String _getEmojiForCategory(String? category) {
    switch (category) {
      case '월급':
        return '💰';
      case '부수입':
        return '💸';
      case '용돈':
        return '🤑';
      case '상여':
        return '🏅';
      case '금융소득':
        return '🏦';
      case '기타':
        return '🎸';
      default:
        return '';
    }
  }


}

class WeeklySpendingDTO {
  final int? id;
  final String? category;
  final String? amount;
  final categoryImagePath;
  final DateTime? date;

  WeeklySpendingDTO({
    this.id,
    this.category,
    this.amount,
    String? categoryImagePath,
    this.date,
  }): categoryImagePath = _getEmojiForCategory(category);

  factory WeeklySpendingDTO.fromJson(Map<String, dynamic> json) {
    return WeeklySpendingDTO(
      id: json['id'],
      category: json['category'] ?? '',
      amount: json['amount'],
      categoryImagePath: '',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  static String _getEmojiForCategory(String? category) {
    switch (category) {
      case '식비':
        return '🍱';
      case '교통/차량':
        return '🖼️';
      case '마트/편의점':
        return '🛒';
      case '패션/미용':
        return '🧥';
      case '생활용품':
        return '🪑';
      case '주거/통신':
        return '🏠';
      case '건강':
        return '🧘';
      case '교육':
        return '📖';
      case '경조사/회비':
        return '🎁';
      case '부모님':
        return '👵';
      default:
        return '💰';
    }
  }
}
