import 'package:pinkpig_project_flutter/_core/constants/http.dart';

import '../dtos/response_dto.dart';
import '../dtos/transaction/transaction_request.dart';

class TransactionRepository {
  Future<ResponseDTO> saveTransaction(TransactionSaveDTO requestDTO) async {
    final response = await dio.get("/transactions", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // if(responseDTO.status == 200){
    //
    // }
    return responseDTO;
  }

  Future<ResponseDTO> fetchTransactionList(int year, int month) async {
    final response = await dio.get("/transactions/monthly", queryParameters: {'year': year, 'month': month});
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if(responseDTO.status == 200){

      print("통신 완료 ${responseDTO.status}");
    }

    return responseDTO;
  }
}
