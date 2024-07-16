
import 'package:pinkpig_project_flutter/data/dtos/chart/chart_response.dart';

import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';


class ChartRepository {

  Future<ResponseDTO> saveTransaction(int year, int month, int week) async {
    final response = await dio.post("/api/chart",
        // options: Options(headers: {"Authorization": "${accessToken}"}),
        queryParameters: {'year': year, 'month': month, 'week': week});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      ChartResponseDTO chartResponseDTO =
      ChartResponseDTO.fromJson(responseDTO.response);

      MonthDTO monthDTO = chartResponseDTO.chartMonth;
      WeeklyDTO weeklyDTO = chartResponseDTO.chartWeekly;

      List<IncomeDTO> monthIncomeList = monthDTO.incomeList;
      List<IncomeDTO> weeklyIncomeList = weeklyDTO.incomeList;

      List<SpendingDTO> monthSpendingList = monthDTO.spendingList;
      List<SpendingDTO> weeklySpendingList = weeklyDTO.spendingList;


    }

    return responseDTO;
  }

}