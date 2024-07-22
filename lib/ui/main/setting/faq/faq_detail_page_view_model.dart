// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/faq_detail.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_list.dart';
import 'package:pinkpig_project_flutter/data/repository/setting_repository.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../data/dtos/setting/notice_detail.dart';
import '../../../../main.dart';

class FaqDetailModel {
  FaqDetail faqDetail;

  FaqDetailModel(this.faqDetail);
}

// 창고
class FaqDetailViewModel extends StateNotifier<FaqDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  FaqDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int id) async {

    ResponseDTO responseDTO =
    await SettingRepository().fetchFaqDetail(id);

    // print("주문내역 뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = FaqDetailModel(responseDTO.response);

    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("faq 상세보기 불러오기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final FaqDetailProvider = StateNotifierProvider.autoDispose.family<
    FaqDetailViewModel, FaqDetailModel?, int>((ref, id) {
  return FaqDetailViewModel(null, ref)..notifyInit(id);
});