import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/dtos/memo/memo_request.dart';
import '../../../../../data/dtos/memo/memo_response.dart';
import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';
import '../../../../../data/store/session_store.dart';
import 'memo_list_viewmodel.dart';

class MemoUpdateViewmodel extends StateNotifier<MemoUpdateDTO> {
  final int id;
  final int userId;
  final Ref ref;

  MemoUpdateViewmodel(this.id, this.userId, this.ref)
      : super(MemoUpdateDTO(userId: userId, id: id, title: '', content: ''));

  Future<void> updateMemo(BuildContext context, MemoUpdateDTO memoUpdateDTO, String memoDate) async {
    try {
      // 서버에 메모 업데이트 요청
      ResponseDTO responseDTO = await MemoRepository().editMemo(id, memoUpdateDTO);
      if (responseDTO.status == 200) {
        UpdateMemoRespDTO updatedMemo = UpdateMemoRespDTO.fromJson(responseDTO.response);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("메모가 성공적으로 수정되었습니다.")),
        );

        // 상태 업데이트를 위한 날짜 찾기
        final memoListNotifier = ref.read(memoListProvider(memoDate).notifier);
        memoListNotifier.updateMemo(updatedMemo,memoDate);

        Navigator.of(context).pop(true); // 메모 수정 후 목록 새로 고침을 위해 true 반환
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
}



final memoUpdateViewmodelProvider = StateNotifierProvider.family<MemoUpdateViewmodel, MemoUpdateDTO, int>((ref, memoId) {
  final userId = ref.watch(sessionProvider).user?.id ?? 0;
  return MemoUpdateViewmodel(memoId, userId, ref);
});
