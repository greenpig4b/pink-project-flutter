import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_request.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_response.dart';

import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';


class MemoListModel {
  MonthlyMemoDTO? monthlyMemoDTO;
  List<DailyMemoListDTO>? dailyMemoListDTO;
  List<DailyMemoDTO>? dailyMemoDetailDTO;

  MemoListModel({this.monthlyMemoDTO, this.dailyMemoListDTO,
    this.dailyMemoDetailDTO});
}


class MemoListViewmodel extends StateNotifier<MemoListModel?> {
  final BuildContext context;
  final Ref ref;

  MemoListViewmodel(this.context, this.ref) : super(null);

  Future<void> notifyInit(String selectedDate) async {
    DateTime parsedDate = DateTime.parse(selectedDate);
    int year = parsedDate.year;
    int month = parsedDate.month;

    // 여기서 실제 세션 관리 로직으로 교체하세요
    String jwt = ''; // 세션 스토어나 다른 곳에서 JWT 토큰을 가져오세요

    ResponseDTO responseDTO =
    await MemoRepository().fetchMemoList(year, month, jwt);

    if (responseDTO.status == 200) {
      state = responseDTO.response;
    }
    ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")));
  }
}


