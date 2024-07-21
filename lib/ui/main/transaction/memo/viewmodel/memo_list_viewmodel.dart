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

  MemoListModel(
      {this.monthlyMemoDTO, this.dailyMemoListDTO, this.dailyMemoDetailDTO});
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
      // Check if response is already of type MemoListModel
      if (responseDTO.response is MemoListModel) {
        state = responseDTO.response as MemoListModel;
      } else {
        // If response is not MemoListModel, handle the case appropriately
        var responseMap = responseDTO.response as Map<String, dynamic>;

        state = MemoListModel(
          monthlyMemoDTO: responseMap.containsKey('monthlyMemo')
              ? MonthlyMemoDTO.fromJson(responseMap['monthlyMemo'])
              : null,
          dailyMemoListDTO: responseMap.containsKey('dailyMemoRecords')
              ? (responseMap['dailyMemoRecords'] as List)
                  .map((record) => DailyMemoListDTO.fromJson(record))
                  .toList()
              : [],
          dailyMemoDetailDTO: [],
        );
      }
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  void updateMemo(DailyMemoDTO updatedMemo) {
    if (state != null) {
      List<DailyMemoListDTO> updatedDailyMemoListDTO =
          state!.dailyMemoListDTO!.map((dailyMemoListDTO) {
        if (dailyMemoListDTO.date == updatedMemo) {
          List<DailyMemoDTO> updatedDailyMemo =
              dailyMemoListDTO.dailyMemo.map((memo) {
            return memo.id == updatedMemo.id ? updatedMemo : memo;
          }).toList();
          return DailyMemoListDTO(
              date: dailyMemoListDTO.date, dailyMemo: updatedDailyMemo);
        } else {
          return dailyMemoListDTO;
        }
      }).toList();

      state = MemoListModel(
        monthlyMemoDTO: state!.monthlyMemoDTO,
        dailyMemoListDTO: updatedDailyMemoListDTO,
        dailyMemoDetailDTO: state!.dailyMemoDetailDTO,
      );
    }
  }

  void addMemo(DailyMemoDTO newMemo, String date) {
    final currentState = state;
    if (currentState != null) {
      List<DailyMemoListDTO> updatedDailyMemoListDTO =
          currentState.dailyMemoListDTO!.map((dailyMemoListDTO) {
        if (dailyMemoListDTO.date == date) {
          List<DailyMemoDTO> updatedDailyMemo = [
            newMemo,
            ...dailyMemoListDTO.dailyMemo
          ];
          return DailyMemoListDTO(
              date: dailyMemoListDTO.date, dailyMemo: updatedDailyMemo);
        } else {
          return dailyMemoListDTO;
        }
      }).toList();

      // 만약 해당 날짜에 메모가 없었다면, 새로 추가
      if (!updatedDailyMemoListDTO
          .any((dailyMemoListDTO) => dailyMemoListDTO.date == date)) {
        updatedDailyMemoListDTO.insert(
            0, DailyMemoListDTO(date: date, dailyMemo: [newMemo]));
      }

      state = MemoListModel(
        monthlyMemoDTO: currentState.monthlyMemoDTO,
        dailyMemoListDTO: updatedDailyMemoListDTO,
        dailyMemoDetailDTO: currentState.dailyMemoDetailDTO,
      );
    } else {
      state = MemoListModel(
        monthlyMemoDTO: null,
        dailyMemoListDTO: [
          DailyMemoListDTO(date: date, dailyMemo: [newMemo])
        ],
        dailyMemoDetailDTO: [],
      );
    }
  }
}

final memoListProvider =
    StateNotifierProvider.family<MemoListViewModel, MemoListModel?, String>(
        (ref, selectedDate) {
  return MemoListViewModel(ref)..notifyInit(selectedDate);
});
