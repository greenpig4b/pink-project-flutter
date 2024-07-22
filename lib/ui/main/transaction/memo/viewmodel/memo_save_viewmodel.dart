import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_request.dart';
import '../../../../../data/dtos/memo/memo_response.dart';
import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';
import 'memo_list_viewmodel.dart';
final memoSaveViewmodelProvider = Provider((ref) => MemoSaveViewModel(ref));

class MemoSaveViewModel {
  final Ref ref;

  MemoSaveViewModel(this.ref);

  Future<void> saveMemo(BuildContext context, MemoSaveDTO memoSaveDTO) async {
    try {
      ResponseDTO responseDTO = await MemoRepository().saveMemo(memoSaveDTO);
      if (responseDTO.status == 200) {
        SaveMemoRespDTO saveMemoRespDTO = SaveMemoRespDTO.fromJson(responseDTO.response);

        DailyMemoDTO newDailyMemoDTO = DailyMemoDTO(
          id: saveMemoRespDTO.id,
          title: saveMemoRespDTO.title,
          content: saveMemoRespDTO.content,
        );

        final memoListNotifier = ref.read(memoListProvider(memoSaveDTO.createdDate).notifier);
        memoListNotifier.addMemo(newDailyMemoDTO, memoSaveDTO.createdDate);

        Navigator.of(context).pop(true); // true를 반환하여 메모 목록 페이지에서 새로 고침을 트리거합니다.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("저장 실패 : ${responseDTO.errorMessage}")),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("저장 중 오류가 발생했습니다: $error")),
      );
    }
  }
}