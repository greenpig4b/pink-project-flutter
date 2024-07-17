
import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/chart/chart_response.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';


class ChartRepository {


  Future<ResponseDTO> getChatGraph(int year, int month, int week, String accessToken) async {
    print("Sending request to server with year: $year, month: $month, week: $week");

    final response = await dio.get("/api/chart",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        queryParameters: {'year': year, 'month': month, 'week': week});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      ChartResponseDTO chartResponseDTO =
      ChartResponseDTO.fromJson(responseDTO.response);

      MonthDTO? monthDTO = chartResponseDTO.chartMonth;
      WeeklyDTO? weeklyDTO = chartResponseDTO.chartWeekly;

      List<MonthIncomeDTO>? monthIncomeList = monthDTO?.incomeList;
      List<WeeklyIncomeDTO>? weeklyIncomeList = weeklyDTO?.incomeList;

      List<MonthSpendingDTO>? monthSpendingList = monthDTO?.spendingList;
      List<WeeklySpendingDTO>? weeklySpendingList = weeklyDTO?.spendingList;


    }

    return responseDTO;
  }

}