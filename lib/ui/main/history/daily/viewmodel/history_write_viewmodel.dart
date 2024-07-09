import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryWriteModel {
  final bool isIncomeSelected;
  final bool isExpenseSelected;

  HistoryWriteModel(
      {required this.isIncomeSelected, required this.isExpenseSelected});


  HistoryWriteModel copyWith({
    bool? isIncomeSelected,
    bool? isExpenseSelected,
  }) {
    return HistoryWriteModel(
        isIncomeSelected: isIncomeSelected ?? this.isIncomeSelected,
        isExpenseSelected: isExpenseSelected ?? this.isExpenseSelected);
  }
}

class HistoryWriteViewmodel extends StateNotifier<HistoryWriteModel>{

    HistoryWriteViewmodel(): super(HistoryWriteModel(isIncomeSelected: false, isExpenseSelected: true));

    void selectIncome(){
      state =state.copyWith(isIncomeSelected: true,isExpenseSelected: false);
    }
    void selectExpense(){
      state = state.copyWith(isIncomeSelected: false,isExpenseSelected: true);
    }
}

final historyWriteProvider = StateNotifierProvider<HistoryWriteViewmodel,HistoryWriteModel>(
    (ref) => HistoryWriteViewmodel(),
);
