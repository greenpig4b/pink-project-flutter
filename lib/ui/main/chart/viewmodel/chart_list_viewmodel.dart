import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../data/dtos/chart/chart_response.dart';
import '../../../../data/dtos/response_dto.dart';
import '../../../../data/repository/chart_repository.dart';

class ChartListmodel {
  final ChartResponseDTO? monthCount;
  final MonthDTO? chartMonth;
  final WeeklyDTO? chatWeekly;
  final bool isMonthly;

  ChartListmodel({
    this.monthCount,
    this.chartMonth,
    this.chatWeekly,
    this.isMonthly = true,
  });

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

class ChartListViewmodel extends StateNotifier<AsyncValue<ChartListmodel?>> {
  ChartListViewmodel() : super(const AsyncValue.loading());

  Future<void> notifyInit(String selectedDate, String accessToken) async {
    state = const AsyncValue.loading();
    try {
      DateTime parsedDate = DateTime.parse(selectedDate);
      int year = parsedDate.year;
      int month = parsedDate.month;
      int week = _getWeekNumber(parsedDate);

      ChartRepository chartRepository = ChartRepository();
      ResponseDTO responseDTO = await chartRepository.getChatGraph(year, month, week, accessToken);

      if (responseDTO.status == 200) {
        ChartResponseDTO chartResponseDTO = ChartResponseDTO.fromJson(responseDTO.response);

        state = AsyncValue.data(ChartListmodel(
          monthCount: chartResponseDTO,
          chartMonth: chartResponseDTO.chartMonth,
          chatWeekly: chartResponseDTO.chartWeekly,
        ));
      } else {
        state = AsyncValue.error(Exception(responseDTO.errorMessage ?? 'Unknown error'), StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void toggleView() {
    state = state.whenData((value) => value?.copyWith(isMonthly: !(value?.isMonthly ?? true)));
  }

  int _getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int weekNumber = ((dayOfYear - date.weekday + 10) / 7).floor();
    return weekNumber;
  }
}

final chartListProvider = StateNotifierProvider.family<ChartListViewmodel, AsyncValue<ChartListmodel?>, String>(
      (ref, selectedDate) => ChartListViewmodel()..notifyInit(selectedDate, "your_jwt_token_here"),
);
