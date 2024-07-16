class Calendar {
  final monthlyIcome;
  final monthlyExpense;
  final monthlyTotalAmount;
  final List<DailySummaries> dailySummariesList;

  Calendar({
    required this.monthlyIcome,
    required this.monthlyExpense,
    required this.monthlyTotalAmount,
    required this. dailySummariesList
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    // 파싱
    List<dynamic> dailySummariesList = json["dailySummariesList"];
    List<DailySummaries> newDailySummariesList = dailySummariesList.map((e) => DailySummaries.fromJson(e)).toList();
    return Calendar(
        monthlyIcome: json["monthlyIcome"],
        monthlyExpense: json["monthlyExpense"],
        monthlyTotalAmount: json["monthlyTotalAmount"],
        dailySummariesList: newDailySummariesList
    );
  }
}

class DailySummaries{
  final date;
  final hasMemo;
  final dailyIncome;
  final dailyExpense;
  final dailyTotalAmount;
  final DailyDetail dailyDetail;

  DailySummaries({
    required this.date,
    required this.hasMemo,
    required this.dailyIncome,
    required this.dailyExpense,
    required this.dailyTotalAmount,
    required this.dailyDetail
  });

  factory DailySummaries.fromJson(Map<String, dynamic> json) {
    return DailySummaries(
      date: json["date"],
      hasMemo: json["hasMemo"],
      dailyIncome: json["dailyIncome"],
      dailyExpense: json["dailyExpense"],
      dailyTotalAmount: json["dailyTotalAmount"],
      dailyDetail: json["dailyDetail"],
    );
  }
//
}

class DailyDetail{
  final date;
  final yearMonth;
  final day;
  final List<Memos> memoList;
  final List<TransactionDetails> transactionDetailsList;

  DailyDetail({
    required this.date,
    required this.yearMonth,
    required this.day,
    required this.memoList,
    required this.transactionDetailsList
  });

  factory DailyDetail.fromJson(Map<String, dynamic> json) {
    // 파싱
    List<dynamic> memoList = json["memoList"];
    List<dynamic> transactionDetailsList = json["transactionDetailsList"];

    List<Memos> newMemoList = memoList.map((e) => Memos.fromJson(e)).toList();
    List<TransactionDetails> newTransactionDetailsList = transactionDetailsList.map((e) => TransactionDetails.fromJson(e)).toList();

    return DailyDetail(
      date: json["date"],
      yearMonth: json["yearMonth"],
      day: json["day"],
      memoList: newMemoList,
      transactionDetailsList: newTransactionDetailsList
    );
  }
//
}

class Memos{
  final id;
  final content;

  Memos({
    required this.id,
    required this.content
  });

  factory Memos.fromJson(Map<String, dynamic> json) {
    return Memos(
      id: json["id"],
      content: json["content"],
    );
  }
//
}

class TransactionDetails{
  final id;
  final transactionType;
  final category;
  final description;
  final assets;
  final amount;

  TransactionDetails({
    required this.id,
    required this.transactionType,
    required this.category,
    required this.description,
    required this.assets,
    required this.amount
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      id: json["id"],
      transactionType: json["transactionType"],
      category: json["category"],
      description: json["description"],
      assets: json["assets"],
      amount: json["amount"],
    );
  }
//
}