import 'daily_summaries.dart';

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
    return Calendar(
        monthlyIcome: json["monthlyIcome"],
        monthlyExpense: json["monthlyExpense"],
        monthlyTotalAmount: json["monthlyTotalAmount"],
        dailySummariesList: List<DailySummaries>.from(
          json["dailySummariesList"].map((x) => DailySummaries.fromJson(x))),
    );
  }
}