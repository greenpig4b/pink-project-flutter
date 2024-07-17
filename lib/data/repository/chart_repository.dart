import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/chart/chart_month_response.dart';
import 'package:pinkpig_project_flutter/data/dtos/chart/chart_weekly_response.dart';
import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class ChartRepository {

  Future<ResponseDTO> getChatGraph(int year, int month, int week, String accessToken, bool isMonthly) async {
    print("Sending request to server with year: $year, month: $month, week: $week, isMonthly: $isMonthly");

    try {
      final response = await dio.get("/api/chart",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          queryParameters: {'year': year, 'month': month, 'week': week, 'isMonthly': isMonthly});

      print("Server response: ${response.data}");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      if (responseDTO.status == 200) {
        if (isMonthly) {
          ChartMonthResponse chartMonthResponse = ChartMonthResponse.fromJson(responseDTO.response);
          print("Monthly data received: $chartMonthResponse");
        } else {
          ChartWeeklyResponse chartWeeklyResponse = ChartWeeklyResponse.fromJson(responseDTO.response);
          print("Weekly data received: $chartWeeklyResponse");
        }
      } else {
        print("Error response: ${responseDTO.errorMessage}");
      }

      return responseDTO;
    } catch (e) {
      print("Error during server request: $e");
      rethrow;
    }
  }
}
