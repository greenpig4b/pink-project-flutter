class ChartResponseDTO {
  final int monthCount;
  final MonthDTO chartMonth;
  final WeeklyDTO chartWeekly;

  ChartResponseDTO({
    required this.monthCount,
    required this.chartMonth,
    required this.chartWeekly,
  });

  factory ChartResponseDTO.fromJson(Map<String, dynamic> json) {
    return ChartResponseDTO(
      monthCount: json["monthCount"],
      chartMonth: MonthDTO.fromJson(json["chartMonth"]),
      chartWeekly: WeeklyDTO.fromJson(json["chartWeekly"]),
    );
  }
}

class MonthDTO {
  final List<IncomeDTO> incomeList;
  final List<SpendingDTO> spendingList;

  MonthDTO({
    required this.incomeList,
    required this.spendingList,
  });

  factory MonthDTO.fromJson(Map<String, dynamic> json) {
    var incomeListFromJson = json['incomeList'] as List;
    List<IncomeDTO> incomeList = incomeListFromJson.map((i) => IncomeDTO.fromJson(i)).toList();

    var spendingListFromJson = json['spendingList'] as List;
    List<SpendingDTO> spendingList = spendingListFromJson.map((i) => SpendingDTO.fromJson(i)).toList();

    return MonthDTO(
      incomeList: incomeList,
      spendingList: spendingList,
    );
  }
}

class WeeklyDTO {
  final List<IncomeDTO> incomeList;
  final List<SpendingDTO> spendingList;

  WeeklyDTO({
    required this.incomeList,
    required this.spendingList,
  });

  factory WeeklyDTO.fromJson(Map<String, dynamic> json) {
    var incomeListFromJson = json['incomeList'] as List;
    List<IncomeDTO> incomeList = incomeListFromJson.map((i) => IncomeDTO.fromJson(i)).toList();

    var spendingListFromJson = json['spendingList'] as List;
    List<SpendingDTO> spendingList = spendingListFromJson.map((i) => SpendingDTO.fromJson(i)).toList();

    return WeeklyDTO(
      incomeList: incomeList,
      spendingList: spendingList,
    );
  }
}

class IncomeDTO {
  final int id;
  final String category;
  final String amount;
  final String categoryImagePath;

  IncomeDTO({
    required this.id,
    required this.category,
    required this.amount,
    required this.categoryImagePath,
  });

  factory IncomeDTO.fromJson(Map<String, dynamic> json) {
    return IncomeDTO(
      id: json['id'],
      category: json['category'],
      amount: json['amount'],
      categoryImagePath: json['categoryImagePath'],
    );
  }

}

class SpendingDTO {
  final int id;
  final String category;
  final String amount;
  final String categoryImagePath;

  SpendingDTO({
    required this.id,
    required this.category,
    required this.amount,
    required this.categoryImagePath,
  });

  factory SpendingDTO.fromJson(Map<String, dynamic> json) {
    return SpendingDTO(
      id: json['id'],
      category: json['category'],
      amount: json['amount'],
      categoryImagePath: json['categoryImagePath'],
    );
  }

}
