import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/transaction/transaction_request.dart';
import 'package:pinkpig_project_flutter/data/repository/transaction_repository.dart';

import '../../../../../data/dtos/transaction/transaction_response.dart';
import '../../../../../main.dart';

class TransactionListModel {
  TotalTransactionDTO? totalTransactionDTO;
  List<DailyTransactionDTO>? dailyTransactionDTO;
  List<DailyTransactionDetailDTO>? dailyTransactionDetailDTO;

  TransactionListModel({this.totalTransactionDTO, this.dailyTransactionDTO,
      this.dailyTransactionDetailDTO});
}

class TransactionListViewmodel extends StateNotifier<TransactionListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  TransactionListViewmodel(super.state, this.ref);

  Future<void> notifyInit(String selectedDate) async {
    DateTime parsedDate = DateTime.parse(selectedDate);
    int year = parsedDate.year;
    int month = parsedDate.month;

    print("날짜 잘 들어왔나? : ${selectedDate}");
    print("년 잘 들어왔나? : ${year}");
    print("월 잘 들어왔나? : ${month}");
    ResponseDTO responseDTO =
        await TransactionRepository().fetchTransactionList(year, month);

    if(responseDTO.status == 200){
      state = responseDTO.response;
    }
    ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")));

  }


  Future<void> notifySave(TransactionSaveDTO requestDTO) async {
    ResponseDTO responseDTO = await TransactionRepository().saveTransaction(requestDTO);

    Navigator.pop(mContext!);
    // if(responseDTO.status == 200){
    //
    //
    //
    // }else{
    //
    //   ScaffoldMessenger.of(mContext!).showSnackBar(
    //     SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.errorMessage}")),
    //   );
    //
    // }

  }


}

final transactionListProvider = StateNotifierProvider.family<
    TransactionListViewmodel,
    TransactionListModel?,
    String>((ref, selectedDate) {
  return TransactionListViewmodel(null, ref)..notifyInit(selectedDate);
});
