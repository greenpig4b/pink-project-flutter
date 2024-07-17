import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../data/dtos/chart/chart_response.dart';
import 'income_section.dart';
import 'expense_section.dart';
import '../viewmodel/chart_list_viewmodel.dart';

class MyChartPage extends ConsumerWidget {
  MyChartPage({Key? key}) : super(key: key);

  DateTime _selectedDate = DateTime.now();
  final int touchedIncomeIndex = -1;
  final int touchedExpenseIndex = -1;

  double getTotalAmount(List<dynamic> incomes) {
    return incomes.fold(0, (sum, item) => sum + int.parse(item.amount.replaceAll(',', '')));
  }

  double getTotalExpense(List<dynamic> expenses) {
    return expenses.fold(0, (sum, item) => sum + int.parse(item.amount.replaceAll(',', '')));
  }

  String formatCurrency(double amount) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDateString = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-01';
    final chartListState = ref.watch(chartListProvider(selectedDateString));
    final chartViewModel = ref.read(chartListProvider(selectedDateString).notifier);
    final String jwtToken = "your_jwt_token_here";

    void _nextMonth() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
      ref.read(chartListProvider(_selectedDate.toString()).notifier).notifyInit(_selectedDate.toString(), jwtToken);
    }

    void _previousMonth() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
      ref.read(chartListProvider(_selectedDate.toString()).notifier).notifyInit(_selectedDate.toString(), jwtToken);
    }

    void _onIncomeTap() {
      print('수입 탭 클릭됨');
    }

    void _onExpenseTap() {
      print('지출 탭 클릭됨');
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                _nextMonth();
              } else if (details.primaryVelocity! > 0) {
                _previousMonth();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: _previousMonth,
                ),
                Text(
                  '${_selectedDate.year}년 ${_selectedDate.month}월',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white,),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFFC7C9A),
          actions: [
            TextButton(
              onPressed: () {
                chartViewModel.toggleView();
                ref.read(chartListProvider(selectedDateString).notifier).notifyInit(_selectedDate.toString(), jwtToken);
              },
              child: Text(
                '월간',
                style: TextStyle(
                  color: chartViewModel.state.value?.isMonthly == true ? Colors.white : Colors.white70,
                  fontWeight: chartViewModel.state.value?.isMonthly == true ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                chartViewModel.toggleView();
                ref.read(chartListProvider(selectedDateString).notifier).notifyInit(_selectedDate.toString(), jwtToken);
              },
              child: Text(
                '주간',
                style: TextStyle(
                  color: chartViewModel.state.value?.isMonthly == false ? Colors.white : Colors.white70,
                  fontWeight: chartViewModel.state.value?.isMonthly == false ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              if (index == 0) {
                _onIncomeTap();
              } else if (index == 1) {
                _onExpenseTap();
              }
            },
            tabs: [
              Tab(text: '수입'),
              Tab(text: '지출'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 4.0),
              insets: EdgeInsets.zero,
            ),
            indicatorPadding: EdgeInsets.zero,
          ),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              _nextMonth();
            } else if (details.primaryVelocity! > 0) {
              _previousMonth();
            }
          },
          child: chartListState.when(
            data: (chartList) {
              if (chartList == null) {
                return Center(child: Text('No data available'));
              }

              if (chartList.isMonthly) {
                double totalIncome = getTotalAmount(chartList.chartMonth?.incomeList ?? []);
                double totalExpense = getTotalExpense(chartList.chartMonth?.spendingList ?? []);

                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    IncomeSection<MonthIncomeDTO>(
                      touchedIndex: touchedIncomeIndex,
                      onTouch: (index) {
                        ref.read(chartListProvider(selectedDateString).notifier).notifyInit(_selectedDate.toString(), jwtToken);
                      },
                      incomes: chartList.chartMonth?.incomeList ?? [], // 데이터를 전달
                      selectedDate: _selectedDate,
                    ),
                    ExpenseSection<MonthSpendingDTO>(
                      touchedIndex: touchedExpenseIndex,
                      onTouch: (index) {
                        ref.read(chartListProvider(selectedDateString).notifier).notifyInit(_selectedDate.toString(), jwtToken);
                      },
                      expenses: chartList.chartMonth?.spendingList ?? [], // 데이터를 전달
                      selectedDate: _selectedDate,
                    ),
                  ],
                );
              } else {
                double totalIncome = getTotalAmount(chartList.chatWeekly?.incomeList ?? []);
                double totalExpense = getTotalExpense(chartList.chatWeekly?.spendingList ?? []);

                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    IncomeSection<WeeklyIncomeDTO>(
                      touchedIndex: touchedIncomeIndex,
                      onTouch: (index) {
                        ref.read(chartListProvider(selectedDateString).notifier).notifyInit(_selectedDate.toString(), jwtToken);
                      },
                      incomes: chartList.chatWeekly?.incomeList ?? [], // 데이터를 전달
                      selectedDate: _selectedDate,
                    ),
                    ExpenseSection<WeeklySpendingDTO>(
                      touchedIndex: touchedExpenseIndex,
                      onTouch: (index) {
                        ref.read(chartListProvider(selectedDateString).notifier).notifyInit(_selectedDate.toString(), jwtToken);
                      },
                      expenses: chartList.chatWeekly?.spendingList ?? [], // 데이터를 전달
                      selectedDate: _selectedDate,
                    ),
                  ],
                );
              }
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stack) {
              print('Error: $error');
              print('Stack trace: $stack');
              return Center(child: Text('Error: $error'));
            },
          ),
        ),
      ),
    );
  }
}
