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
  final mContext = navigatorKey.currentContext;

  MemoListViewModel(this.ref) : super(null);

  Future<void> notifyInit(String selectedMonth) async {

    DateTime parsedDate = DateTime.parse(selectedMonth);
    int year = parsedDate.year;
    int month = parsedDate.month;


    ResponseDTO responseDTO = await MemoRepository().fetchMemoList(year, month);
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
