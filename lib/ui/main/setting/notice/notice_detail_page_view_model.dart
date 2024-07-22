// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_list.dart';
import 'package:pinkpig_project_flutter/data/repository/setting_repository.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../data/dtos/setting/notice_detail.dart';
import '../../../../main.dart';

class NoticeDetailModel {
  NoticeDetail noticeDetail;

  NoticeDetailModel(this.noticeDetail);
}

// 창고
class NoticeDetailViewModel extends StateNotifier<NoticeDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  NoticeDetailViewModel(super.state, this.ref);

  Future<void> notifyInit(int id) async {

    ResponseDTO responseDTO =
    await SettingRepository().fetchNoticeDetail(id);

    // print("주문내역 뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = NoticeDetailModel(responseDTO.response);

    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("공지사항 리스트 불러오기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final NoticeDetailProvider = StateNotifierProvider.autoDispose.family<
    NoticeDetailViewModel, NoticeDetailModel?, int>((ref, id) {
  return NoticeDetailViewModel(null, ref)..notifyInit(id);
});