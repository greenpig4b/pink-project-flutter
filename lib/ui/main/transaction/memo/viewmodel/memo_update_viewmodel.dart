import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_request.dart';

import '../../../../../data/dtos/response_dto.dart';
import '../../../../../data/repository/memo_repository.dart';

class MemoUpdateViewmodel extends StateNotifier<MemoUpdateDTO> {
  MemoUpdateViewmodel() : super(MemoUpdateDTO(userId: , id: ,title: '', content: ''));

  Future<void> updateMemo(BuildContext context, MemoUpdateDTO memoUpdateDTO) async {
    try {
      ResponseDTO responseDTO = await MemoRepository().editMemo(memoUpdateDTO);
      if (responseDTO.status == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("메모가 성공적으로 수정되었습니다.")),
        );
        // 성공적으로 저장되면 필요한 추가 로직을 수행할 수 있습니다.
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
