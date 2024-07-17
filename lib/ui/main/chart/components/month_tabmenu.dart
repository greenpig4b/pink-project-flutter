import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/dtos/chart/chart_month_response.dart';
import 'income_section.dart';
import 'expense_section.dart';
import '../viewmodel/chart_list_viewmodel.dart';

class MonthTabmenu extends ConsumerWidget {
  final DateTime selectedDate;
  final String jwtToken;

  MonthTabmenu({required this.selectedDate, required this.jwtToken});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDateString = '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-01';
    print("Watching chartListState for date: $selectedDateString");
    final chartListState = ref.watch(chartListProvider(selectedDateString));

    return chartListState.when(
      data: (chartList) {
        if (chartList == null) {
          print("chartList is null");
          return Center(child: Text('No data available'));
        }

        final monthData = chartList.chartMonth;
        if (monthData == null) {
          print("Month data is null");
          return Center(child: Text('No data available'));
        }

        double totalIncome = getTotalAmount(monthData.incomeList);
        double totalExpense = getTotalExpense(monthData.spendingList);

        print("Total Income: $totalIncome, Total Expense: $totalExpense");

        return Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  IncomeSection<MonthIncomeDTO>(
                    touchedIndex: -1,
                    onTouch: (index) {
                      ref.read(chartListProvider(selectedDateString).notifier).notifyInit(selectedDateString, jwtToken, true);
                    },
                    incomes: monthData.incomeList,
                    selectedDate: selectedDate,
                  ),
                  ExpenseSection<MonthSpendingDTO>(
                    touchedIndex: -1,
                    onTouch: (index) {
                      ref.read(chartListProvider(selectedDateString).notifier).notifyInit(selectedDateString, jwtToken, true);
                    },
                    expenses: monthData.spendingList,
                    selectedDate: selectedDate,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () {
        print("Loading data...");
        return Center(child: CircularProgressIndicator());
      },
      error: (error, stack) {
        print('Error: $error');
        print('Stack trace: $stack');
        return Center(child: Text('Error: $error'));
      },
    );
  }

  double getTotalAmount(List<MonthIncomeDTO> incomes) {
    if (incomes.isEmpty) {
      return 0.0;
    }
    return incomes.fold(0, (sum, item) {
      try {
        return sum + int.parse(item.amount.replaceAll(',', ''));
      } catch (e) {
        print("Error parsing income amount: $e");
        return sum;
      }
    });
  }

  double getTotalExpense(List<MonthSpendingDTO> expenses) {
    if (expenses.isEmpty) {
      return 0.0;
    }
    return expenses.fold(0, (sum, item) {
      try {
        return sum + int.parse(item.amount.replaceAll(',', ''));
      } catch (e) {
        print("Error parsing expense amount: $e");
        return sum;
      }
    });
  }
}
