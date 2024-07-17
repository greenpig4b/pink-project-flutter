import '../../../_core/enum/transaction_enum.dart';

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
    List<DailyTransactionDTO> recordList =
    list.map((i) => DailyTransactionDTO.fromJson(i)).toList();

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

  @override
  String toString() {
    return 'TotalTransactionDTO(userId: $userId, year: $year, month: $month, monthlyIncome: $monthlyIncome, monthlyExpense: $monthlyExpense, monthlyTotalAmount: $monthlyTotalAmount, dailyTransactionRecord: $dailyTransactionRecord)';
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
    List<DailyTransactionDetailDTO> detailList =
    list.map((i) => DailyTransactionDetailDTO.fromJson(i)).toList();

    return DailyTransactionDTO(
      date: json['date'],
      dailyIncome: json['dailyIncome'],
      dailyExpense: json['dailyExpense'],
      dailyTotalAmount: json['dailyTotalAmount'],
      dailyTransactionDetailDTO: detailList,
    );
  }

  @override
  String toString() {
    return 'DailyTransactionDTO(date: $date, dailyIncome: $dailyIncome, dailyExpense: $dailyExpense, dailyTotalAmount: $dailyTotalAmount, dailyTransactionDetailDTO: $dailyTransactionDetailDTO)';
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
  final String? categoryInImage;
  final String? categoryOutImage;

  DailyTransactionDetailDTO({
    required this.id,
    required this.transactionType,
    this.categoryIn,
    this.categoryOut,
    required this.description,
    required this.time,
    required this.assets,
    required this.amount,
    this.categoryInImage,
    this.categoryOutImage,
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
      categoryInImage: json['categoryInImage'],
      categoryOutImage: json['categoryOutImage'],
    );
  }

  @override
  String toString() {
    return 'DailyTransactionDetailDTO(id: $id, transactionType: $transactionType, categoryIn: $categoryIn, categoryOut: $categoryOut, description: $description, time: $time, assets: $assets, amount: $amount, categoryOutImage: $categoryOutImage, categoryInImage: $categoryInImage})';
  }
}

class SaveTransactionRespRecord {
  final int userId;
  final String year;
  final String month;
  final String monthlyIncome;
  final String monthlyExpense;
  final String monthlyTotalAmount;
  final DailySaveTransactionRecord dailySaveTransactionRecord;

  SaveTransactionRespRecord(
      {required this.userId,
        required this.year,
        required this.month,
        required this.monthlyIncome,
        required this.monthlyExpense,
        required this.monthlyTotalAmount,
        required this.dailySaveTransactionRecord});

  factory SaveTransactionRespRecord.fromJson(Map<String, dynamic> json) {
    return SaveTransactionRespRecord(
      userId: json['userId'],
      year: json['year'],
      month: json['month'],
      monthlyIncome: json['monthlyIncome'],
      monthlyExpense: json['monthlyExpense'],
      monthlyTotalAmount: json['monthlyTotalAmount'],
      dailySaveTransactionRecord: DailySaveTransactionRecord.fromJson(json['dailySaveTransactionRecord']),
    );
  }

  @override
  String toString() {
    return 'SaveTransactionRespRecord(userId: $userId, year: $year, month: $month, monthlyIncome: $monthlyIncome, monthlyExpense: $monthlyExpense, monthlyTotalAmount: $monthlyTotalAmount, dailySaveTransactionRecord: $dailySaveTransactionRecord)';
  }
}

class DailySaveTransactionRecord {
  final String date;
  final String dailyIncome;
  final String dailyExpense;
  final String dailyTotalAmount;
  final DailySaveTransactionDetailRecord dailySaveTransactionDetailRecord;

  DailySaveTransactionRecord({required this.date, required this.dailyIncome, required this.dailyExpense,
    required this.dailyTotalAmount, required this.dailySaveTransactionDetailRecord});

  factory DailySaveTransactionRecord.fromJson(Map<String, dynamic> json) {
    return DailySaveTransactionRecord(
      date: json['date'],
      dailyIncome: json['dailyIncome'],
      dailyExpense: json['dailyExpense'],
      dailyTotalAmount: json['dailyTotalAmount'],
      dailySaveTransactionDetailRecord: DailySaveTransactionDetailRecord.fromJson(json['dailySaveTransactionDetailRecord']),
    );
  }

  @override
  String toString() {
    return 'DailySaveTransactionRecord(date: $date, dailyIncome: $dailyIncome, dailyExpense: $dailyExpense, dailyTotalAmount: $dailyTotalAmount, dailySaveTransactionDetailRecord: $dailySaveTransactionDetailRecord)';
  }
}

class DailySaveTransactionDetailRecord {
  final int id;
  final String transactionType;
  final String categoryIn;
  final String categoryInImage;
  final String categoryOut;
  final String categoryOutImage;
  final String description;
  final String time;
  final String assets;
  final String amount;

  DailySaveTransactionDetailRecord({
    required this.id,
    required this.transactionType,
    required this.categoryIn,
    required this.categoryInImage,
    required this.categoryOut,
    required this.categoryOutImage,
    required this.description,
    required this.time,
    required this.assets,
    required this.amount,
  });

  factory DailySaveTransactionDetailRecord.fromJson(Map<String, dynamic> json) {
    return DailySaveTransactionDetailRecord(
      id: json['id'],
      transactionType: json['transactionType'],
      categoryIn: json['categoryIn'] ?? "",
      categoryInImage: json['categoryInImage'] ?? "",
      categoryOut: json['categoryOut'] ?? "",
      categoryOutImage: json['categoryOutImage'] ??"",
      description: json['description'],
      time: json['time'],
      assets: json['assets'],
      amount: json['amount'],
    );
  }

  @override
  String toString() {
    return 'DailySaveTransactionDetailRecord(id: $id, transactionType: $transactionType, categoryIn: $categoryIn, categoryInImage: $categoryInImage, categoryOut: $categoryOut, categoryOutImage: $categoryOutImage, description: $description, time: $time, assets: $assets, amount: $amount)';
  }
}
