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

  Future<void> notifySave(MemoSaveDTO requestDTO) async {
    try {
      ResponseDTO responseDTO = await MemoRepository().saveMemo(requestDTO);
      if (responseDTO.status == 200) {
        // 성공적으로 저장되었을 때 처리 로직 추가
        // 예를 들어, 저장 후 UI 갱신 등을 수행할 수 있습니다.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("저장 실패 : ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      print("메모 저장 중 오류 발생: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("저장 중 오류 발생")),
      );
    }
  }

  Future<void> notifyUpdate(int memoId, MemoUpdateDTO requestDTO) async {
    try {
      ResponseDTO responseDTO = await MemoRepository().editMemo(memoId, requestDTO);
      if (responseDTO.status == 200) {
        // 성공적으로 업데이트되었을 때 처리 로직 추가
        // 예를 들어, 업데이트 후 UI 갱신 등을 수행할 수 있습니다.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("업데이트 실패 : ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      print("메모 업데이트 중 오류 발생: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("업데이트 중 오류 발생")),
      );
    }
  }

  Future<void> notifyDelete(int memoId) async {
    try {
      ResponseDTO responseDTO = await MemoRepository().deleteMemo(memoId);
      if (responseDTO.status == 200) {
        // 성공적으로 삭제되었을 때 처리 로직 추가
        // 예를 들어, 삭제 후 UI 갱신 등을 수행할 수 있습니다.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("삭제 실패 : ${responseDTO.errorMessage}")),
        );
      }
    } catch (e) {
      print("메모 삭제 중 오류 발생: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("삭제 중 오류 발생")),
      );
    }
  }
}


