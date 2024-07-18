class ChartWeeklyResponse {
  final List<WeeklyIncomeDTO> incomeList;
  final List<WeeklySpendingDTO> spendingList;

  ChartWeeklyResponse({
    required this.incomeList,
    required this.spendingList,
  });

  factory ChartWeeklyResponse.fromJson(Map<String, dynamic> json) {
    return ChartWeeklyResponse(
      incomeList: (json['incomeList'] as List)
          .map((item) => WeeklyIncomeDTO.fromJson(item))
          .toList(),
      spendingList: (json['spendingList'] as List)
          .map((item) => WeeklySpendingDTO.fromJson(item))
          .toList(),
    );
  }
}

class WeeklyIncomeDTO {
  final int id;
  final String category;
  final String amount;

  WeeklyIncomeDTO({
    required this.id,
    required this.category,
    required this.amount,

  });

  factory WeeklyIncomeDTO.fromJson(Map<String, dynamic> json) {
    return WeeklyIncomeDTO(
      id: json['id'],
      category: json['category'],
      amount: json['amount'],

    );
  }
}

class WeeklySpendingDTO {
  final int id;
  final String category;
  final String amount;


  WeeklySpendingDTO({
    required this.id,
    required this.category,
    required this.amount,

  });

  factory WeeklySpendingDTO.fromJson(Map<String, dynamic> json) {
    return WeeklySpendingDTO(
      id: json['id'],
      category: json['category'],
      amount: json['amount'],

    );
  }
}
