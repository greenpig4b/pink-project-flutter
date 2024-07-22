// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_list.dart';
import 'package:pinkpig_project_flutter/data/repository/setting_repository.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../main.dart';

class NoticeModel {
  NoticeList noticeList;

  NoticeModel(this.noticeList);
}

// 창고
class NoticeViewModel extends StateNotifier<NoticeModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  NoticeViewModel(super.state, this.ref);

  Future<void> notifyInit() async {

    ResponseDTO responseDTO =
    await SettingRepository().fetchSettingNoticeList();

    // print("주문내역 뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = NoticeModel(responseDTO.response);

    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("공지사항 리스트 불러오기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final NoticeProvider = StateNotifierProvider<
    NoticeViewModel, NoticeModel?>((ref) {
  return NoticeViewModel(null, ref)..notifyInit();
});