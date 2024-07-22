// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/faq_list.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_list.dart';
import 'package:pinkpig_project_flutter/data/repository/setting_repository.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../main.dart';

class FaqModel {
  FaqList faqList;

  FaqModel(this.faqList);
}

// 창고
class FaqViewModel extends StateNotifier<FaqModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  FaqViewModel(super.state, this.ref);

  Future<void> notifyInit() async {

    ResponseDTO responseDTO =
    await SettingRepository().fetchSettingFaqList();

    // print("주문내역 뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = FaqModel(responseDTO.response);

    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("faq 리스트 불러오기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final FaqProvider = StateNotifierProvider<
    FaqViewModel, FaqModel?>((ref) {
  return FaqViewModel(null, ref)..notifyInit();
});