import 'daily_detail.dart';

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