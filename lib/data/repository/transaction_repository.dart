import 'package:pinkpig_project_flutter/_core/constants/http.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';

import '../dtos/response_dto.dart';
import '../dtos/transaction/transaction_request.dart';
import '../dtos/transaction/transaction_response.dart';

class TransactionRepository {
  Future<ResponseDTO> saveTransaction(TransactionSaveDTO requestDTO) async {
    final response = await dio.post("/api/transactions", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print("responseDTO : ${responseDTO.success}");
    print("responseDTO : ${responseDTO.response}");
    print("responseDTO : ${responseDTO.status}");

    if(responseDTO.status == 200){
      responseDTO.response = DailyTransactionDetailDTO.fromJson(responseDTO.response);

    }
    return responseDTO;
  }

  Future<ResponseDTO> fetchTransactionList(int year, int month) async {
    final response = await dio.get("/api/transactions/monthly",
        queryParameters: {'year': year, 'month': month});
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      TotalTransactionDTO totalTransactionDTO =
          TotalTransactionDTO.fromJson(responseDTO.response);

      List<DailyTransactionDTO> dailyTransactionDTO =
          totalTransactionDTO.dailyTransactionRecord;

      List<DailyTransactionDetailDTO> dailyTransactionDetailDTO =
          dailyTransactionDTO.expand((e) => e.dailyTransactionDetailDTO).toList();

      TransactionListModel model = TransactionListModel(
          totalTransactionDTO: totalTransactionDTO,
          dailyTransactionDTO: dailyTransactionDTO,
          dailyTransactionDetailDTO: dailyTransactionDetailDTO);

      responseDTO.response = model;
    }

    return responseDTO;
  }
}
