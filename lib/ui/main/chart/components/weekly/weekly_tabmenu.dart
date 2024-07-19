import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../data/dtos/chart/chart_weekly_response.dart';
import '../income_section.dart';
import '../expense_section.dart';
import '../../viewmodel/chart_list_viewmodel.dart';

class WeeklyTabmenu extends ConsumerWidget {
  final DateTime selectedDate;
  final String jwtToken;

  WeeklyTabmenu({required this.selectedDate, required this.jwtToken});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
    final endDate = startDate.add(Duration(days: 6));
    final startDateString = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(startDate);
    final endDateString = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(endDate);
    final selectedDateString = DateFormat('yyyy-MM-dd').format(selectedDate);

    print("WeeklyTabmenu: startDate=$startDateString, endDate=$endDateString");

    ref.listen<AsyncValue<ChartListModel?>>(
      chartListProvider('weekly'),
          (previous, next) {
        if (previous?.isLoading == false && next?.isLoading == true) {
          return;
        }

        if (next?.isLoading == false && next?.value == null) {
          ref.read(chartListProvider('weekly').notifier).notifyInitWeekly(
              jwtToken,
              selectedDate.year,
              selectedDate.month,
              startDateString,
              endDateString
          );
        }
      },
    );

    final chartListState = ref.watch(chartListProvider('weekly'));

    return chartListState.when(
      data: (chartList) {
        if (chartList == null) {
          print("chartList is null");
          return Center(child: Text('No data available'));
        }

        final weekData = chartList.chartWeekly;
        if (weekData == null) {
          print("Weekly data is null");
          return Center(child: Text('No data available'));
        }

        double totalIncome = getTotalAmount(weekData.incomeList);
        double totalExpense = getTotalExpense(weekData.spendingList);

        print("Total Income: $totalIncome, Total Expense: $totalExpense");

        return Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  IncomeSection<WeeklyIncomeDTO>(
                    touchedIndex: -1,
                    onTouch: (index) {
                      ref.read(chartListProvider('weekly').notifier).notifyInitWeekly(
                          jwtToken,
                          selectedDate.year,
                          selectedDate.month,
                          startDateString,
                          endDateString
                      );
                    },
                    incomes: weekData.incomeList,
                    selectedDate: selectedDate,
                  ),
                  ExpenseSection<WeeklySpendingDTO>(
                    touchedIndex: -1,
                    onTouch: (index) {
                      ref.read(chartListProvider('weekly').notifier).notifyInitWeekly(
                          jwtToken,
                          selectedDate.year,
                          selectedDate.month,
                          startDateString,
                          endDateString
                      );
                    },
                    expenses: weekData.spendingList,
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

  double getTotalAmount(List<WeeklyIncomeDTO> incomes) {
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

  double getTotalExpense(List<WeeklySpendingDTO> expenses) {
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
