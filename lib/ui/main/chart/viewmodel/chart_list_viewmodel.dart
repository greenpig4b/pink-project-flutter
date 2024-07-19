import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../data/dtos/chart/chart_month_response.dart';
import '../../../../data/dtos/chart/chart_weekly_response.dart';
import '../../../../data/dtos/response_dto.dart';
import '../../../../data/repository/chart_repository.dart';

class ChartListModel {
  final ChartMonthResponse? chartMonth;
  final ChartWeeklyResponse? chartWeekly;
  final bool isMonthly;

  ChartListModel({
    this.chartMonth,
    this.chartWeekly,
    this.isMonthly = true,
  });

  ChartListModel copyWith({
    ChartMonthResponse? chartMonth,
    ChartWeeklyResponse? chartWeekly,
    bool? isMonthly,
  }) {
    return ChartListModel(
      chartMonth: chartMonth ?? this.chartMonth,
      chartWeekly: chartWeekly ?? this.chartWeekly,
      isMonthly: isMonthly ?? this.isMonthly,
    );
  }
}

class ChartListViewModel extends StateNotifier<AsyncValue<ChartListModel?>> {
  ChartListViewModel() : super(const AsyncValue.loading());

  Future<void> notifyInitMonthly(String accessToken, int year, int month) async {
    state = const AsyncValue.loading();
    try {
      ChartRepository chartRepository = ChartRepository();
      ResponseDTO responseDTO = await chartRepository.fetchMonthlyChartGraph(year, month, accessToken);

      if (responseDTO.status == 200) {
        ChartMonthResponse chartMonthResponse = ChartMonthResponse.fromJson(responseDTO.response);
        state = AsyncValue.data(ChartListModel(
          chartMonth: chartMonthResponse,
          isMonthly: true,
        ));
      } else {
        state = AsyncValue.error(Exception(responseDTO.errorMessage ?? 'Unknown error'), StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> notifyInitWeekly(String accessToken, int year, int month, String startDate, String endDate) async {
    state = const AsyncValue.loading();
    try {
      ChartRepository chartRepository = ChartRepository();
      ResponseDTO responseDTO = await chartRepository.fetchWeeklyChartGraph(year, month, accessToken, startDate, endDate);

      if (responseDTO.status == 200) {
        ChartWeeklyResponse chartWeeklyResponse = ChartWeeklyResponse.fromJson(responseDTO.response);
        state = AsyncValue.data(ChartListModel(
          chartWeekly: chartWeeklyResponse,
          isMonthly: false,
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
}

final chartListProvider = StateNotifierProvider.family<ChartListViewModel, AsyncValue<ChartListModel?>, String>(
      (ref, selectedDate) => ChartListViewModel(),
);
