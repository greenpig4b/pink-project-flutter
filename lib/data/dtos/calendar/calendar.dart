class Calendar {
  final String? monthlyIncome;
  final String? monthlyExpense;
  final String? monthlyTotalAmount;
  final List<DailySummaries> dailySummariesList;

  Calendar({
    this.monthlyIncome,
    this.monthlyExpense,
    this.monthlyTotalAmount,
    required this.dailySummariesList
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    List<dynamic> dailySummariesJson = json["dailySummariesList"] ?? [];
    List<DailySummaries> newDailySummariesList = dailySummariesJson.map((e) => DailySummaries.fromJson(e)).toList();
    return Calendar(
        monthlyIncome: json["monthlyIncome"] ?? "",
        monthlyExpense: json["monthlyExpense"] ?? "",
        monthlyTotalAmount: json["monthlyTotalAmount"] ?? "",
        dailySummariesList: newDailySummariesList
    );
  }
}

class DailySummaries {
  final String? date;
  final bool? hasMemo;
  final String? dailyIncome;
  final String? dailyExpense;
  final String? dailyTotalAmount;
  final DailyDetail? dailyDetail;

  DailySummaries({
    this.date,
    this.hasMemo,
    this.dailyIncome,
    this.dailyExpense,
    this.dailyTotalAmount,
    this.dailyDetail
  });

  factory DailySummaries.fromJson(Map<String, dynamic> json) {
    return DailySummaries(
      date: json["date"] ?? "",
      hasMemo: json["hasMemo"],
      dailyIncome: json["dailyIncome"] ?? "",
      dailyExpense: json["dailyExpense"] ?? "",
      dailyTotalAmount: json["dailyTotalAmount"] ?? "",
      dailyDetail: json["dailyDetail"] != null ? DailyDetail.fromJson(json["dailyDetail"]) : null,
    );
  }
}

class DailyDetail {
  final String? date;
  final String? yearMonth;
  final String? day;
  final List<Memos> memoList;
  final List<TransactionDetails> transactionDetailsList;

  DailyDetail({
    this.date,
    this.yearMonth,
    this.day,
    required this.memoList,
    required this.transactionDetailsList
  });

  factory DailyDetail.fromJson(Map<String, dynamic> json) {
    List<dynamic> memoJson = json["memoList"] ?? [];
    List<dynamic> transactionDetailsJson = json["transactionDetailsList"] ?? [];

    List<Memos> newMemoList = memoJson.map((e) => Memos.fromJson(e)).toList();
    List<TransactionDetails> newTransactionDetailsList = transactionDetailsJson.map((e) => TransactionDetails.fromJson(e)).toList();

    return DailyDetail(
        date: json["date"] ?? "",
        yearMonth: json["yearMonth"] ?? "",
        day: json["day"] ?? "",
        memoList: newMemoList,
        transactionDetailsList: newTransactionDetailsList
    );
  }
}

class Memos {
  final int? id;
  final String? content;

  Memos({
    this.id,
    this.content
  });

  factory Memos.fromJson(Map<String, dynamic> json) {
    return Memos(
      id: json["id"] ?? 0,
      content: json["content"] ?? "",
    );
  }
}

class TransactionDetails {
  final int? id;
  final String? transactionType;
  final String? category;
  final String? description;
  final String? assets;
  final String? amount;

  TransactionDetails({
    this.id,
    this.transactionType,
    this.category,
    this.description,
    this.assets,
    this.amount
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      id: json["id"] ?? 0,
      transactionType: json["transactionType"] ?? "",
      category: json["category"] ?? "",
      description: json["description"] ?? "",
      assets: json["assets"] ?? "",
      amount: json["amount"] ?? "",
    );
  }
}