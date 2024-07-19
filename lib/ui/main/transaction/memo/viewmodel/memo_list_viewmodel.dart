import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_response.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_app_bar.dart';

import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';
import '../../../../../data/store/session_store.dart';
import '../../../../../main.dart';


class MemoListModel {
  MonthlyMemoDTO? monthlyMemoDTO;
  List<DailyMemoListDTO>? dailyMemoListDTO;
  List<DailyMemoDTO>? dailyMemoDetailDTO;

  MemoListModel({this.monthlyMemoDTO, this.dailyMemoListDTO,
    this.dailyMemoDetailDTO});
}


class MemoListViewModel extends StateNotifier<MemoListModel?> {
  final Ref ref;
  final BuildContext? mContext = navigatorKey.currentContext;
  bool isLoading = false;
  String? lastSelectedMonth;

  MemoListViewModel(this.ref) : super(null);

  Future<void> notifyInit(String selectedMonth) async {
    if (isLoading || lastSelectedMonth == selectedMonth) return; // 이미 로딩 중이거나 동일한 월일 경우 추가 요청 방지
    isLoading = true; // 로딩 시작
    lastSelectedMonth = selectedMonth;

    print('notifyInit called with selectedMonth: $selectedMonth');

    try {
      DateTime parsedDate = DateTime.parse(selectedMonth);
      int year = parsedDate.year;
      int month = parsedDate.month;

      ResponseDTO responseDTO = await MemoRepository().fetchMemoList(year, month);
      if (responseDTO.status == 200) {
        state = responseDTO.response;
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      // 예외 처리
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("예외 발생: $e")),
      );
    } finally {
      isLoading = false; // 로딩 종료
      print('notifyInit finished');
    }
  }
}

final memoListProvider = StateNotifierProvider<MemoListViewModel, MemoListModel?>((ref) {
  return MemoListViewModel(ref);
});
