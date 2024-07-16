// 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/calendar/calendar.dart';
import 'package:pinkpig_project_flutter/data/repository/calendar_repository.dart';

import '../../../../data/dtos/response_dto.dart';
import '../../../../main.dart';

class TransactionCalendarModel {
  Calendar calendar;

  TransactionCalendarModel(this.calendar);
}

// 창고
class TransactionCalendarViewModel extends StateNotifier<TransactionCalendarModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  TransactionCalendarViewModel(super.state, this.ref);

  Future<void> notifyInit(String selectedDate) async {
    DateTime parsedDate = DateTime.parse(selectedDate);
    int year = parsedDate.year;
    int month = parsedDate.month;

    ResponseDTO responseDTO =
    await CalendarRepository().fetchCalendarList(year, month);

    // print("주문내역 뷰모델 : ${responseDTO.status}");
    if (responseDTO.status == 200) {
      state = responseDTO.response;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("달력 데이터 보기 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final TransactionCalendarProvider = StateNotifierProvider.family<
    TransactionCalendarViewModel, TransactionCalendarModel?, String>((ref, selectedDate) {
  return TransactionCalendarViewModel(null, ref)..notifyInit(selectedDate);
});