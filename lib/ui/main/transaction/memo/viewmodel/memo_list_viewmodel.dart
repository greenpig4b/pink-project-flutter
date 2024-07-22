import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_response.dart';
import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';
import '../../../../../main.dart';

class MemoListModel {
  MonthlyMemoDTO? monthlyMemoDTO;
  List<DailyMemoListDTO>? dailyMemoListDTO;
  List<DailyMemoDTO>? dailyMemoDetailDTO;

  MemoListModel(
      {this.monthlyMemoDTO, this.dailyMemoListDTO, this.dailyMemoDetailDTO});

  MemoListModel copyWith({
    List<DailyMemoListDTO>? dailyMemoListDTO,
    List<DailyMemoDTO>? dailyMemoDetailDTO,
    MonthlyMemoDTO? monthlyMemoDTO,
  }) {
    return MemoListModel(
      dailyMemoListDTO: dailyMemoListDTO ?? this.dailyMemoListDTO,
      dailyMemoDetailDTO: dailyMemoDetailDTO ?? this.dailyMemoDetailDTO,
      monthlyMemoDTO: monthlyMemoDTO ?? this.monthlyMemoDTO,
    );
  }
}

class MemoListViewModel extends StateNotifier<MemoListModel?> {
  final Ref ref;
  final BuildContext mContext;

  MemoListViewModel(this.ref, this.mContext) : super(null) {
    // 상태 초기화
    notifyInit(DateTime.now().toIso8601String());
  }

  Future<void> notifyInit(String selectedMonth) async {
    DateTime? parsedDate = DateTime.tryParse(selectedMonth);
    if (parsedDate == null) {
      print("날짜 형식이 잘못되었습니다: $selectedMonth");
      return;
    }

    int year = parsedDate.year;
    int month = parsedDate.month;

    ResponseDTO responseDTO = await MemoRepository().fetchMemoList(year, month);

    if (responseDTO.status == 200) {
      if (responseDTO.response is MemoListModel) {
        state = responseDTO.response as MemoListModel;
      } else {
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
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  void updateMemo(UpdateMemoRespDTO updatedMemo, String memoDate) {
    if (state == null) {
      print("현재 상태가 null입니다. 메모를 업데이트할 수 없습니다.");
      return;
    }

    final updatedDailyMemoListDTO =
    state!.dailyMemoListDTO!.map((dailyMemoListDTO) {
      if (dailyMemoListDTO.date == memoDate) {
        final updatedDailyMemo = dailyMemoListDTO.dailyMemo.map((memo) {
          return memo.id == updatedMemo.id
              ? DailyMemoDTO(
            id: updatedMemo.id,
            title: updatedMemo.title,
            content: updatedMemo.content,
          )
              : memo;
        }).toList();
        return DailyMemoListDTO(
          date: dailyMemoListDTO.date,
          dailyMemo: updatedDailyMemo,
        );
      } else {
        return dailyMemoListDTO;
      }
    }).toList();

    state = state!.copyWith(dailyMemoListDTO: updatedDailyMemoListDTO);
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


final memoListProvider = StateNotifierProvider.family<MemoListViewModel, MemoListModel?, String>((ref, selectedDate) {
  // Provider 생성 시 초기화 작업을 별도로 수행합니다.
  final context = navigatorKey.currentContext!;
  final viewModel = MemoListViewModel(ref, context);

  // 상태 초기화를 위한 notifyInit 호출
  Future.microtask(() => viewModel.notifyInit(selectedDate));

  return viewModel;
});

