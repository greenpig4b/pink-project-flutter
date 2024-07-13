class TotalTransactionDTO {
  final int userId;
  final String year;
  final String month;
  final String monthlyIncome;
  final String monthlyExpense;
  final String monthlyTotalAmount;
  final List<DailyTransactionDTO> dailyTransactionRecord;

  TotalTransactionDTO({
    required this.userId,
    required this.year,
    required this.month,
    required this.monthlyIncome,
    required this.monthlyExpense,
    required this.monthlyTotalAmount,
    required this.dailyTransactionRecord,
  });

  factory TotalTransactionDTO.fromJson(Map<String, dynamic> json) {
    var list = json['dailyTransactionRecord'] as List;
    List<DailyTransactionDTO> recordList = list.map((i) =>
        DailyTransactionDTO.fromJson(i)).toList();

    return TotalTransactionDTO(
      userId: json['userId'],
      year: json['year'],
      month: json['month'],
      monthlyIncome: json['monthlyIncome'],
      monthlyExpense: json['monthlyExpense'],
      monthlyTotalAmount: json['monthlyTotalAmount'],
      dailyTransactionRecord: recordList,
    );
  }
}

class DailyTransactionDTO {
  final String date;
  final String dailyIncome;
  final String dailyExpense;
  final String dailyTotalAmount;
  final List<DailyTransactionDetailDTO> dailyTransactionDetailDTO;

  DailyTransactionDTO({
    required this.date,
    required this.dailyIncome,
    required this.dailyExpense,
    required this.dailyTotalAmount,
    required this.dailyTransactionDetailDTO,
  });

  factory DailyTransactionDTO.fromJson(Map<String, dynamic> json) {
    var list = json['dailyTransactionDetailRecord'] as List;
    List<DailyTransactionDetailDTO> detailList = list.map((i) =>
        DailyTransactionDetailDTO.fromJson(i)).toList();

    return DailyTransactionDTO(
      date: json['date'],
      dailyIncome: json['dailyIncome'],
      dailyExpense: json['dailyExpense'],
      dailyTotalAmount: json['dailyTotalAmount'],
      dailyTransactionDetailDTO: detailList,
    );
  }
}

class DailyTransactionDetailDTO {
  final int id;
  final String transactionType;
  final String? categoryIn;
  final String? categoryOut;
  final String description;
  final String time;
  final String assets;
  final String amount;

  DailyTransactionDetailDTO({
    required this.id,
    required this.transactionType,
    this.categoryIn,
    this.categoryOut,
    required this.description,
    required this.time,
    required this.assets,
    required this.amount,
  });

  factory DailyTransactionDetailDTO.fromJson(Map<String, dynamic> json) {
    return DailyTransactionDetailDTO(
      id: json['id'],
      transactionType: json['transactionType'],
      categoryIn: json['categoryIn'],
      categoryOut: json['categoryOut'],
      description: json['description'],
      time: json['time'],
      assets: json['assets'],
      amount: json['amount'],
    );
  }
}

class TransactionSaveRespDTO {
  // final int id;
  final int userId;
  final String transactionType;
  final String? categoryIn;
  final String? categoryOut;
  final String description;
  final String time;
  final String assets;
  final String amount;

  TransactionSaveRespDTO({
    // required this.id,
    required this.userId,
    required this.transactionType,
    this.categoryIn,
    this.categoryOut,
    required this.description,
    required this.time,
    required this.assets,
    required this.amount});

  factory TransactionSaveRespDTO.fromJson(Map<String, dynamic> json) {
    return TransactionSaveRespDTO(
      // id: json['id'],
      userId:json['userId'],
      transactionType: json['transactionType'],
      categoryIn: json['categoryIn'],
      categoryOut: json['categoryOut'],
      description: json['description'],
      time: json['time'],
      assets: json['assets'],
      amount: json['amount'],
    );
  }
}