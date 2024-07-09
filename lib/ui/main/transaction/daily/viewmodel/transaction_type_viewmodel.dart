import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionTypeModel {
  final bool isIncomeSelected;
  final bool isExpenseSelected;

  TransactionTypeModel(
      {required this.isIncomeSelected, required this.isExpenseSelected});


  TransactionTypeModel copyWith({
    bool? isIncomeSelected,
    bool? isExpenseSelected,
  }) {
    return TransactionTypeModel(
        isIncomeSelected: isIncomeSelected ?? this.isIncomeSelected,
        isExpenseSelected: isExpenseSelected ?? this.isExpenseSelected);
  }
}

class TransactionTypeViewmodel extends StateNotifier<TransactionTypeModel>{

  TransactionTypeViewmodel(): super(TransactionTypeModel(isIncomeSelected: false, isExpenseSelected: true));

    void selectIncome(){
      state =state.copyWith(isIncomeSelected: true,isExpenseSelected: false);
    }
    void selectExpense(){
      state = state.copyWith(isIncomeSelected: false,isExpenseSelected: true);
    }
}

final transactionTypeProvider = StateNotifierProvider<TransactionTypeViewmodel,TransactionTypeModel>(
    (ref) => TransactionTypeViewmodel(),
);
