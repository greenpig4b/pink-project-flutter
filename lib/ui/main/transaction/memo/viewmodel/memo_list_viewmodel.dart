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

    final sessionStore = ref.watch(
        sessionProvider); // sessionProvider로부터 SessionStore 인스턴스 가져오기
    String? jwt = sessionStore.accessToken;
    if (jwt != null) {
      // JWT 토큰이 유효한 경우 처리
      ResponseDTO responseDTO = await MemoRepository().fetchMemoList(
          year, month, jwt);
      if (responseDTO.status == 200) {
        state = responseDTO.response;
      }
      // 나머지 로직 처리
    } else {
      // JWT 토큰이 없는 경우 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인이 필요합니다.")),
      );
    }


  }
}