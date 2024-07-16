import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/_core/constants/http.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';

import '../dtos/response_dto.dart';
import '../dtos/transaction/transaction_request.dart';
import '../dtos/transaction/transaction_response.dart';

class TransactionRepository {
  Future<ResponseDTO> saveTransaction(TransactionSaveDTO requestDTO) async {
    final response = await dio.post("/api/transactions", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // if(responseDTO.status == 200){
    //
    // }
    return responseDTO;
  }

  Future<ResponseDTO> fetchTransactionList(int year, int month,String accessToken) async {
    final response = await dio.get("/api/transactions/monthly",
        options: Options(headers: {"Authorization": "${accessToken}"}),
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
