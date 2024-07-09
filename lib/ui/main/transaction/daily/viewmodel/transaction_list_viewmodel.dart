import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/repository/transaction_repository.dart';

import '../../../../../data/dtos/transaction/transaction_response.dart';
import '../../../../../main.dart';

class TransactionListModel {
  final int? userId;
  final String? year;
  final String? month;
  final String? monthlyIncome;
  final String? monthlyExpense;
  final String? monthlyTotalAmount;
  List<DailyRecordDTO>? dailyRecordDTO;
  List<DailyTransactionDetailDTO>? dailyTransactionDetailDTO;

  TransactionListModel(
  { this.userId,
      this.year,
      this.month,
      this.monthlyIncome,
      this.monthlyExpense,
      this.monthlyTotalAmount,
      this.dailyRecordDTO,
      this.dailyTransactionDetailDTO});
}


class TransactionListViewmodel extends StateNotifier<TransactionListModel?>{
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  TransactionListViewmodel(super.state, this.ref);

Future<void> notifyInit(String selectedDate) async {
  DateTime parsedDate = DateTime.parse(selectedDate);
  int year = parsedDate.year;
  int month = parsedDate.month;


  print("날짜 잘 들어왔나? : ${selectedDate}");
  print("년 잘 들어왔나? : ${year}");
  print("월 잘 들어왔나? : ${month}");
  ResponseDTO responseDTO = await TransactionRepository().fetchTransactionList(year,month);
}


}

final transactionListProvider = StateNotifierProvider.family<TransactionListViewmodel, TransactionListModel?, String>((ref, selectedDate) {
  return TransactionListViewmodel(null, ref)..notifyInit(selectedDate);
});
