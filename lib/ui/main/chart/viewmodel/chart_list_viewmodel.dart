import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/data/dtos/chart/chart_response.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/repository/chart_repository.dart';
import 'package:pinkpig_project_flutter/main.dart';

import '../../../../data/store/session_store.dart';

class ChartListmodel {
  ChartResponseDTO? monthCount;
  MonthDTO? chartMonth;
  WeeklyDTO? chatWeekly;
  bool isMonthly;

  ChartListmodel({
    this.monthCount,
    this.chartMonth,
    this.chatWeekly,
    this.isMonthly = true,
  });
}

class ChartListViewmodel extends StateNotifier<AsyncValue<ChartListmodel?>> {
  final nContext = navigatorKey.currentContext;
  final Ref ref;

  ChartListViewmodel(this.ref) : super(const AsyncValue.loading());

  void toggleView() {
    if (state is AsyncData) {
      final currentState = (state as AsyncData<ChartListmodel?>).value;
      state = AsyncValue.data(currentState?.copyWith(isMonthly: !(currentState?.isMonthly ?? true)));
    }
  }

  Future<void> notifyInit(String selectedDate) async {
    state = const AsyncValue.loading();
    try {
      DateTime parsedDate = DateTime.parse(selectedDate);
      int year = parsedDate.year;
      int month = parsedDate.month;
      int week = _getWeekNumber(parsedDate);

      SessionStore sessionStore = ref.read(sessionProvider);
      String jwt = sessionStore.accessToken!;

      ResponseDTO responseDTO = await ChartRepository().getChatGraph(year, month, week, jwt);

      if (responseDTO.status == 200) {
        ChartResponseDTO chartResponseDTO = ChartResponseDTO.fromJson(responseDTO.response);
        state = AsyncValue.data(ChartListmodel(
          monthCount: chartResponseDTO,
          chartMonth: chartResponseDTO.chartMonth,
          chatWeekly: chartResponseDTO.chartWeekly,
        ));
      } else {
        state = AsyncValue.error(Exception(responseDTO.errorMessage ?? 'Unknown error'), StackTrace.current);
        ScaffoldMessenger.of(nContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
        );
      }
    } catch (e, stack) {
      print('Error: $e');
      print('Stack trace: $stack');
      state = AsyncValue.error(e, stack);
    }
  }

  int _getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int weekNumber = ((dayOfYear - date.weekday + 10) / 7).floor();
    return weekNumber;
  }
}

extension on ChartListmodel {
  ChartListmodel copyWith({
    ChartResponseDTO? monthCount,
    MonthDTO? chartMonth,
    WeeklyDTO? chatWeekly,
    bool? isMonthly,
  }) {
    return ChartListmodel(
      monthCount: monthCount ?? this.monthCount,
      chartMonth: chartMonth ?? this.chartMonth,
      chatWeekly: chatWeekly ?? this.chatWeekly,
      isMonthly: isMonthly ?? this.isMonthly,
    );
  }
}

final chartListProvider = StateNotifierProvider.family<ChartListViewmodel, AsyncValue<ChartListmodel?>, String>(
      (ref, selectedDate) {
    return ChartListViewmodel(ref)..notifyInit(selectedDate);
  },
);
