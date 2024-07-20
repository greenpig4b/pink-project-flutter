import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_response.dart';
import '../../../../../data/dtos/memo/memo_request.dart';
import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';
import '../../../../../main.dart';

class MemoListModel {
  MonthlyMemoDTO? monthlyMemoDTO;
  List<DailyMemoListDTO>? dailyMemoListDTO;
  List<DailyMemoDTO>? dailyMemoDetailDTO;

  MemoListModel({this.monthlyMemoDTO, this.dailyMemoListDTO, this.dailyMemoDetailDTO});
}

class MemoListViewModel extends StateNotifier<MemoListModel?> {
  final Ref ref;
  final BuildContext? mContext = navigatorKey.currentContext;

  MemoListViewModel(this.ref) : super(null);

  Future<void> notifyInit(String selectedMonth) async {
      DateTime parsedDate = DateTime.parse(selectedMonth);
      int year = parsedDate.year;
      int month = parsedDate.month;

      ResponseDTO responseDTO = await MemoRepository().fetchMemoList(year, month);
      if (responseDTO.status == 200) {
        state = MemoListModel(
          monthlyMemoDTO: responseDTO.response['monthlyMemoDTO'],
          dailyMemoListDTO: responseDTO.response['dailyMemoListDTO'],
          dailyMemoDetailDTO: responseDTO.response['dailyMemoDetailDTO'],
        );
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
        );
      }
  }

  Future<void> notifySave(MemoSaveDTO requestDTO) async {
    ResponseDTO responseDTO = await MemoRepository().saveMemo(requestDTO);
    if (responseDTO.status == 200) {
      SaveMemoRespDTO saveMemoRespDTO = SaveMemoRespDTO.fromJson(responseDTO.response);

      DailyMemoDTO newDailyMemoDTO = DailyMemoDTO(
        id: saveMemoRespDTO.id,
        title: saveMemoRespDTO.title,
        content: saveMemoRespDTO.content,
      );

      // Add the new memo to the list
      List<DailyMemoDTO> saveDailyMemoDetailDTOs = [newDailyMemoDTO, ...?state?.dailyMemoDetailDTO];

      MemoListModel model = MemoListModel(
        monthlyMemoDTO: state?.monthlyMemoDTO,
        dailyMemoListDTO: state?.dailyMemoListDTO,
        dailyMemoDetailDTO: saveDailyMemoDetailDTOs,
      );

      state = model;
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("저장 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }
}

final memoListProvider = StateNotifierProvider.family<MemoListViewModel, MemoListModel?, String>((ref, selectedDate) {
  return MemoListViewModel(ref)..notifyInit(selectedDate);
});
