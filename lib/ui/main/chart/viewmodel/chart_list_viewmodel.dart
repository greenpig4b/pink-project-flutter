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

  Future<void> notifyInitMonthly(String selectedDate, String accessToken, int year, int month) async {
    print("notifyInitMonthly called with selectedDate: $selectedDate");
    state = const AsyncValue.loading();
    try {
      ChartRepository chartRepository = ChartRepository();
      ResponseDTO responseDTO = await chartRepository.getMonthlyChartGraph(year, month, accessToken);

      print("ResponseDTO: ${responseDTO.toString()}");

      if (responseDTO.status == 200) {
        ChartMonthResponse chartMonthResponse = ChartMonthResponse.fromJson(responseDTO.response);
        print("Monthly data: ${chartMonthResponse.toString()}");
        state = AsyncValue.data(ChartListModel(
          chartMonth: chartMonthResponse,
          isMonthly: true,
        ));
      } else {
        print("Error: ${responseDTO.errorMessage ?? 'Unknown error'}");
        state = AsyncValue.error(Exception(responseDTO.errorMessage ?? 'Unknown error'), StackTrace.current);
      }
    } catch (e) {
      print("Exception: $e");
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> notifyInitWeekly(String selectedDate, String accessToken, int year, int month, String startDate, String endDate) async {
    print("notifyInitWeekly called with selectedDate: $selectedDate, startDate: $startDate, endDate: $endDate");
    state = const AsyncValue.loading();
    try {
      ChartRepository chartRepository = ChartRepository();
      ResponseDTO responseDTO = await chartRepository.getWeeklyChartGraph(year, month, accessToken, startDate, endDate);

      print("ResponseDTO: ${responseDTO.toString()}");

      if (responseDTO.status == 200) {
        ChartWeeklyResponse chartWeeklyResponse = ChartWeeklyResponse.fromJson(responseDTO.response);
        print("Weekly data: ${chartWeeklyResponse.toString()}");
        state = AsyncValue.data(ChartListModel(
          chartWeekly: chartWeeklyResponse,
          isMonthly: false,
        ));
      } else {
        print("Error: ${responseDTO.errorMessage ?? 'Unknown error'}");
        state = AsyncValue.error(Exception(responseDTO.errorMessage ?? 'Unknown error'), StackTrace.current);
      }
    } catch (e) {
      print("Exception: $e");
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

final chartListProvider = StateNotifierProvider.family<ChartListViewModel, AsyncValue<ChartListModel?>, String>(
      (ref, selectedDate) => ChartListViewModel(),
);
