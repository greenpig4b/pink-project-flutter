import '../../_core/constants/http.dart';
import '../../ui/main/result/viewmodel/result_list_view_model.dart';
import '../dtos/response_dto.dart';
import '../dtos/result/result_response.dart';

class ResultRepository {
  Future<ResponseDTO> fetchResultList(int year, int month) async {
    final response = await dio.get("/api/financial-report",
        queryParameters: {'year': year, 'month': month});

    // Debugging: Print the raw response data
    print("API Response Data: ${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      MonthlyFinancialReport monthlyFinancialReport =
      MonthlyFinancialReport.fromJson(responseDTO.response);

      // Debugging: Print the parsed MonthlyFinancialReport
      print("Parsed MonthlyFinancialReport: $monthlyFinancialReport");

      ResultListModel model = ResultListModel(
          monthlyFinancialReport: monthlyFinancialReport,
          monthlyExpenseSummary: monthlyFinancialReport.monthlyExpenseSummary,
          monthlyIncomeSummary: monthlyFinancialReport.monthlyIncomeSummary);

      responseDTO.response = model;
    }

    return responseDTO;
  }
}
