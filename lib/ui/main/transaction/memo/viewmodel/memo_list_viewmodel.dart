import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/repository/transaction_repository.dart';
import 'package:pinkpig_project_flutter/data/dtos/transaction/transaction_request.dart';

import '../../../../../main.dart';
import '../components/memo_provider.dart';

class MemoListModel {
  final List<Map<String, dynamic>> memoList;

  MemoListModel({required this.memoList});
}

class MemoListViewmodel extends StateNotifier<MemoListModel?> {
  final BuildContext context;
  final Ref ref;

  MemoListViewmodel(this.context, this.ref) : super(null);

  Future<void> notifyInit(String selectedDate) async {
    DateTime parsedDate = DateTime.parse(selectedDate);
    int year = parsedDate.year;
    int month = parsedDate.month;

    // 여기서 실제 세션 관리 로직으로 교체하세요
    String jwt = ''; // 세션 스토어나 다른 곳에서 JWT 토큰을 가져오세요

    print("날짜 잘 들어왔나? : ${selectedDate}");
    print("년 잘 들어왔나? : ${year}");
    print("월 잘 들어왔나? : ${month}");

    ResponseDTO responseDTO =
    await TransactionRepository().fetchTransactionList(year, month, jwt);

    if (responseDTO.status == 200) {
      state = MemoListModel(memoList: responseDTO.response.transactionList);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("불러오기 실패 : ${responseDTO.errorMessage}")),
      );
    }
  }

  Future<void> notifySave(TransactionSaveDTO requestDTO) async {
    ResponseDTO responseDTO = await TransactionRepository().saveTransaction(requestDTO);
    // 필요에 따라 저장 응답 처리를 합니다
  }
}


