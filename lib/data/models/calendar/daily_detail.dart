import 'package:pinkpig_project_flutter/data/models/calendar/transaction_details.dart';

import 'memos.dart';

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
    return DailyDetail(
      date: json["date"],
      yearMonth: json["yearMonth"],
      day: json["day"],
      memoList: List<Memos>.from(
          json["memoList"].map((x) => Memos.fromJson(x))),
      transactionDetailsList: List<TransactionDetails>.from(
          json["transactionDetailsList"].map((x) => TransactionDetails.fromJson(x))),
    );
  }
//
}