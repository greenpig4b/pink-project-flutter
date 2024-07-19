import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/repository/result_repository.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/result/result_response.dart';
import 'package:pinkpig_project_flutter/main.dart';

class ResultListModel {
  MonthlyFinancialReport? monthlyFinancialReport;
  MonthlyExpenseSummary? monthlyExpenseSummary;
  MonthlyIncomeSummary? monthlyIncomeSummary;

  ResultListModel({
    this.monthlyFinancialReport,
    this.monthlyExpenseSummary,
    this.monthlyIncomeSummary,
  });
}

class ResultListViewModel extends StateNotifier<ResultListModel?> {
  final Ref ref;
  final mContext = navigatorKey.currentContext;

  ResultListViewModel(this.ref) : super(null);

  Future<void> notifyInit(String selectedMonth) async {
    DateTime parsedDate = DateTime.parse(selectedMonth);
    int year = parsedDate.year;
    int month = parsedDate.month;

    ResponseDTO responseDTO = await ResultRepository().fetchResultList(year, month);
    if (responseDTO.status == 200) {
      state = responseDTO.response;
    } else {
      // 에러 처리
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }
}

final resultListProvider = StateNotifierProvider.family<
    ResultListViewModel,
    ResultListModel?,
    String>((ref, selectedDate) {
  return ResultListViewModel(ref)..notifyInit(selectedDate);
});
