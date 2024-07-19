import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_request.dart';

import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';

class MemoSaveViewmodel extends StateNotifier<MemoSaveDTO> {
  final int userId;

  MemoSaveViewmodel(this.userId)
      : super(MemoSaveDTO(
      userId: userId,
      title: '',
      content: '',
      createdDate: DateTime.now()));

  Future<void> saveMemo(BuildContext context, MemoSaveDTO memoSaveDTO) async {
    try {
      ResponseDTO responseDTO = await MemoRepository().saveMemo(memoSaveDTO);
      if (responseDTO.status == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("메모가 성공적으로 저장되었습니다.")),
        );
        // 성공적으로 저장된 후 추가 로직을 수행하거나 UI를 업데이트합니다.
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
