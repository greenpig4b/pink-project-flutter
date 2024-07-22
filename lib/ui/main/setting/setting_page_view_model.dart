// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_response.dart';
import 'package:pinkpig_project_flutter/data/repository/setting_repository.dart';

import '../../../data/dtos/response_dto.dart';
import '../../../data/store/session_store.dart';
import '../../../main.dart';

class SettingModel {
  NoticeResponse noticeResponse;

  SettingModel(this.noticeResponse);
}

// 창고
class SettingViewModel extends StateNotifier<SettingModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  SettingViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);

    ResponseDTO responseDTO =
    await SettingRepository().fetchSettingNoticeList(sessionStore.user!.id);

    // print("주문내역 뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = responseDTO.response;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("공지사항 리스트 불러오기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final SettingProvider = StateNotifierProvider.autoDispose<
    SettingViewModel, SettingModel?>((ref) {
  return SettingViewModel(null, ref)..notifyInit();
});