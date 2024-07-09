import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionWriteModel {
  final bool isIncomeSelected;
  final bool isExpenseSelected;

  TransactionWriteModel(
      {required this.isIncomeSelected, required this.isExpenseSelected});


  TransactionWriteModel copyWith({
    bool? isIncomeSelected,
    bool? isExpenseSelected,
  }) {
    return TransactionWriteModel(
        isIncomeSelected: isIncomeSelected ?? this.isIncomeSelected,
        isExpenseSelected: isExpenseSelected ?? this.isExpenseSelected);
  }
}

class TransactionWriteViewmodel extends StateNotifier<TransactionWriteModel>{

  TransactionWriteViewmodel(): super(TransactionWriteModel(isIncomeSelected: false, isExpenseSelected: true));

    void selectIncome(){
      state =state.copyWith(isIncomeSelected: true,isExpenseSelected: false);
    }
    void selectExpense(){
      state = state.copyWith(isIncomeSelected: false,isExpenseSelected: true);
    }
}

final transactionWriteProvider = StateNotifierProvider<TransactionWriteViewmodel,TransactionWriteModel>(
    (ref) => TransactionWriteViewmodel(),
);
