import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_request.dart';

import '../../_core/constants/http.dart';
import '../../ui/main/transaction/memo/viewmodel/memo_list_viewmodel.dart';
import '../dtos/memo/memo_response.dart';
import '../dtos/response_dto.dart';

class MemoRepository {
  Future<ResponseDTO> saveMemo(MemoSaveDTO requestDTO) async {
    final response = await dio.post("/api/memos", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
  Future<ResponseDTO> editMemo(int memoId, MemoUpdateDTO requestDTO) async {
    final response = await dio.put("/api/memos/$memoId", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }
  Future<ResponseDTO> deleteMemo(int memoId) async {
    try {
      final response = await dio.delete("/api/memos/$memoId");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      // 예외 처리
      print("메모 삭제 중 오류 발생: $e");
      rethrow; // 예외를 다시 던져서 상위 코드에서 처리할 수 있도록 함
    }
  }
  Future<ResponseDTO> fetchMemoList(int year, int month,String accessToken) async {
    final response = await dio.get("/api/memos/monthly",
        options: Options(headers: {"Authorization": "${accessToken}"}),
        queryParameters: {'year': year, 'month': month});
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    if (responseDTO.status == 200) {
      MonthlyMemoDTO monthlyMemoDTO =
      MonthlyMemoDTO.fromJson(responseDTO.response);

      List<DailyMemoListDTO> dailyMemoListDTO =
          monthlyMemoDTO.dailyMemoList;

      List<DailyMemoDTO> dailyMemoDetailDTO =
      dailyMemoListDTO.expand((e) => e.dailyMemo).toList();

      MemoListModel model = MemoListModel(
          monthlyMemoDTO: monthlyMemoDTO,
          dailyMemoListDTO: dailyMemoListDTO,
          dailyMemoDetailDTO: dailyMemoDetailDTO);

      responseDTO.response = model;
    }

    return responseDTO;
  }
}