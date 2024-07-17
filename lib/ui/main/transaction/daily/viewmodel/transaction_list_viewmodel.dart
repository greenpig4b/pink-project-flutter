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
  final Ref ref;

  TransactionListViewmodel(super.state, this.ref);

  Future<void> notifyInit(String selectedDate) async {
    DateTime parsedDate = DateTime.parse(selectedDate);
    int year = parsedDate.year;
    int month = parsedDate.month;


    ResponseDTO responseDTO =
        await TransactionRepository().fetchTransactionList(year, month);

    if(responseDTO.status == 200){
      state = responseDTO.response;
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")));

    }
  }

  Future<void> notifySave(TransactionSaveDTO requestDTO) async {
    ResponseDTO responseDTO = await TransactionRepository().saveTransaction(requestDTO);
    if(responseDTO.status == 200){

      SaveTransactionRespRecord saveTransactionRespRecord = SaveTransactionRespRecord.fromJson(responseDTO.response);
      // print("saveTransactionRespRecord : ${saveTransactionRespRecord.userId}");
      // print("saveTransactionRespRecord : ${saveTransactionRespRecord.monthlyIncome}");
      // print("saveTransactionRespRecord : ${saveTransactionRespRecord.monthlyExpense}");
      // print("saveTransactionRespRecord : ${saveTransactionRespRecord.monthlyTotalAmount}");
      // print("saveTransactionRespRecord : ${saveTransactionRespRecord.dailySaveTransactionRecord}");

      DailySaveTransactionRecord dailySaveTransactionRecord = saveTransactionRespRecord.dailySaveTransactionRecord;
      // print("dailySaveTransactionRecord : ${dailySaveTransactionRecord.date}");
      // print("dailySaveTransactionRecord : ${dailySaveTransactionRecord.dailyIncome}");
      // print("dailySaveTransactionRecord : ${dailySaveTransactionRecord.dailyExpense}");
      // print("dailySaveTransactionRecord : ${dailySaveTransactionRecord.dailyTotalAmount}");
      // print("dailySaveTransactionRecord : ${dailySaveTransactionRecord.dailySaveTransactionDetailRecord}");

      DailySaveTransactionDetailRecord dailySaveTransactionDetailRecord = dailySaveTransactionRecord.dailySaveTransactionDetailRecord;
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.time}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.categoryInImage}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.categoryIn}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.categoryOut}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.description}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.amount}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.assets}");
      // print("dailySaveTransactionDetailRecord : ${dailySaveTransactionDetailRecord.transactionType}");

      DailyTransactionDetailDTO newDailyTransactionDetailDTO = DailyTransactionDetailDTO(id: dailySaveTransactionDetailRecord.id,
          transactionType: dailySaveTransactionDetailRecord.transactionType, categoryIn: dailySaveTransactionDetailRecord.categoryIn, categoryInImage: dailySaveTransactionDetailRecord.categoryInImage,
          categoryOut: dailySaveTransactionDetailRecord.categoryOut, categoryOutImage: dailySaveTransactionDetailRecord.categoryOutImage, description: dailySaveTransactionDetailRecord.description,
          time: dailySaveTransactionDetailRecord.time, assets: dailySaveTransactionDetailRecord.assets, amount: dailySaveTransactionDetailRecord.amount);

      List<DailyTransactionDetailDTO> newDailyTransactionDetailDTOs = [newDailyTransactionDetailDTO,...?state!.dailyTransactionDetailDTO];

      DailyTransactionDTO newDailyTransactionDTO = DailyTransactionDTO(date: dailySaveTransactionRecord.date, dailyIncome: dailySaveTransactionRecord.dailyIncome,
          dailyExpense: dailySaveTransactionRecord.dailyExpense, dailyTotalAmount: dailySaveTransactionRecord.dailyTotalAmount, dailyTransactionDetailDTO: newDailyTransactionDetailDTOs);

      List<DailyTransactionDTO> newDailyTransactionDTOs = [newDailyTransactionDTO,...?state!.dailyTransactionDTO];


      TotalTransactionDTO newTotalTransactionDTO = TotalTransactionDTO(userId: saveTransactionRespRecord.userId,
          year: saveTransactionRespRecord.year, month: saveTransactionRespRecord.month, monthlyIncome: saveTransactionRespRecord.monthlyIncome,
          monthlyExpense: saveTransactionRespRecord.monthlyExpense, monthlyTotalAmount: saveTransactionRespRecord.monthlyTotalAmount,
          dailyTransactionRecord: newDailyTransactionDTOs);

      TransactionListModel model = TransactionListModel(totalTransactionDTO: newTotalTransactionDTO,dailyTransactionDTO: newDailyTransactionDTOs,dailyTransactionDetailDTO: newDailyTransactionDetailDTOs);

      state = model ;
      Navigator.pop(mContext!);

    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")));

    }

  }
}

final transactionListProvider = StateNotifierProvider.family<
    TransactionListViewmodel,
    TransactionListModel?,
    String>((ref, selectedDate) {
  return TransactionListViewmodel(null, ref)..notifyInit(selectedDate);
});
