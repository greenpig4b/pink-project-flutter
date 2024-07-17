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

  Future<void> notifyInit(String selectedDate, String accessToken, bool isMonthly) async {
    print("notifyInit called with selectedDate: $selectedDate, isMonthly: $isMonthly");
    state = const AsyncValue.loading();
    try {
      DateTime parsedDate = DateTime.parse(selectedDate);
      int year = parsedDate.year;
      int month = parsedDate.month;
      int week = _getWeekNumber(parsedDate);

      ChartRepository chartRepository = ChartRepository();
      ResponseDTO responseDTO = await chartRepository.getChatGraph(year, month, week, accessToken, isMonthly);

      print("ResponseDTO: ${responseDTO.toString()}");

      if (responseDTO.status == 200) {
        if (isMonthly) {
          ChartMonthResponse chartMonthResponse = ChartMonthResponse.fromJson(responseDTO.response);
          print("Monthly data: ${chartMonthResponse.toString()}");
          state = AsyncValue.data(ChartListModel(
            chartMonth: chartMonthResponse,
            isMonthly: isMonthly,
          ));
        } else {
          ChartWeeklyResponse chartWeeklyResponse = ChartWeeklyResponse.fromJson(responseDTO.response);
          print("Weekly data: ${chartWeeklyResponse.toString()}");
          state = AsyncValue.data(ChartListModel(
            chartWeekly: chartWeeklyResponse,
            isMonthly: isMonthly,
          ));
        }
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