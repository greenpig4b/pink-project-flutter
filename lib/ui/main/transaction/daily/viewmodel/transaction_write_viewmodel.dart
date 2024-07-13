import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/transaction/transaction_request.dart';
import 'package:pinkpig_project_flutter/data/repository/transaction_repository.dart';

import '../../../../../data/dtos/transaction/transaction_response.dart';
import '../../../../../main.dart';

class TransactionWriteModel {
  TransactionSaveRespDTO transactionSaveRespDTO;

  TransactionWriteModel(this.transactionSaveRespDTO);
}

class TransactionWriteViewmodel extends StateNotifier<TransactionWriteModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  TransactionWriteViewmodel(super.state, this.ref);

  Future<void> notifySave(TransactionSaveDTO requestDTO) async {
    ResponseDTO responseDTO = await TransactionRepository().saveTransaction(requestDTO);

    if(responseDTO.status == 200){



      Navigator.pop(mContext!);
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.errorMessage}")),
      );

    }

  }


}

final transactionWriteProvider =
StateNotifierProvider<TransactionWriteViewmodel, TransactionWriteModel?>((ref) {
  return TransactionWriteViewmodel(null, ref);
});
