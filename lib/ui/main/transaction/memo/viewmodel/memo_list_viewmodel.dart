import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_response.dart';

import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';
import '../../../../../data/store/session_store.dart';


class MemoListViewmodel {
  MonthlyMemoDTO? monthlyMemoDTO;
  List<DailyMemoListDTO>? dailyMemoListDTO;
  List<DailyMemoDTO>? dailyMemoDetailDTO;

  MemoListViewmodel({this.monthlyMemoDTO, this.dailyMemoListDTO,
    this.dailyMemoDetailDTO});
}


class MemoListmodel extends StateNotifier<AsyncValue<MemoListViewmodel>> {
  final Ref ref;

  MemoListmodel(this.ref) : super(const AsyncLoading());

  Future<void> notifyInit(BuildContext context, String selectedDate) async {

    DateTime parsedDate = DateTime.parse(selectedDate);
    int year = parsedDate.year;
    int month = parsedDate.month;


    ResponseDTO responseDTO = await MemoRepository().fetchMemoList(year, month);
    if (responseDTO.status == 200) {
      state = AsyncValue.data(responseDTO.response);
    } else {
      // 에러 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }
}
