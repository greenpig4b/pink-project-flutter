class ChartMonthResponse {
  final List<MonthIncomeDTO> incomeList;
  final List<MonthSpendingDTO> spendingList;

  ChartMonthResponse({
    required this.incomeList,
    required this.spendingList,
  });

  factory ChartMonthResponse.fromJson(Map<String, dynamic> json) {
    return ChartMonthResponse(
      incomeList: (json['incomeList'] as List)
          .map((item) => MonthIncomeDTO.fromJson(item))
          .toList(),
      spendingList: (json['spendingList'] as List)
          .map((item) => MonthSpendingDTO.fromJson(item))
          .toList(),
    );
  }
}

class MonthIncomeDTO {
  final int id;
  final String category;
  final String amount;


  MonthIncomeDTO({
    required this.id,
    required this.category,
    required this.amount,

  });

  factory MonthIncomeDTO.fromJson(Map<String, dynamic> json) {
    return MonthIncomeDTO(
      id: json['id'],
      category: json['category'],
      amount: json['amount'],

    );
  }
}

class MonthSpendingDTO {
  final int id;
  final String category;
  final String amount;


  MonthSpendingDTO({
    required this.id,
    required this.category,
    required this.amount,

  });

  factory MonthSpendingDTO.fromJson(Map<String, dynamic> json) {
    return MonthSpendingDTO(
      id: json['id'],
      category: json['category'],
      amount: json['amount'],

    );
  }
}
