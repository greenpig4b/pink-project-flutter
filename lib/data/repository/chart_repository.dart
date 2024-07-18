import 'package:dio/dio.dart';
import '../../_core/constants/http.dart';
import '../dtos/response_dto.dart';

class ChartRepository {
  Future<ResponseDTO> getMonthlyChartGraph(int year, int month, String accessToken) async {
    print("Sending request to server for monthly data with year: $year, month: $month");

    final response = await dio.get("/api/chart/monthly",
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
        queryParameters: {'year': year, 'month': month, 'isMonthly': true}
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<ResponseDTO> getWeeklyChartGraph(int year, int month, String accessToken, String startDate, String endDate) async {
    print("Sending request to server for weekly data with year: $year, month: $month, startDate: $startDate, endDate: $endDate");

    final response = await dio.get("/api/chart/weekly",
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
        queryParameters: {'year': year, 'month': month, 'isMonthly': false, 'startDate': startDate, 'endDate': endDate}
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
}
