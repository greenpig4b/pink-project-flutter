import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';  // Random 클래스를 사용하기 위해 추가
import '../data/model/graphdummy.dart';

class ExpenseSection extends StatelessWidget {
  final int touchedIndex;
  final ValueChanged<int> onTouch;
  final List<TransactionOutGoing> expenses;
  final DateTime selectedDate; // 선택된 날짜

  ExpenseSection({required this.touchedIndex, required this.onTouch, required this.expenses, required this.selectedDate});

  // 특정 날짜에 해당하는 데이터를 필터링합니다.
  List<TransactionOutGoing> getFilteredExpenses() {
    return expenses.where((expense) =>
    expense.createdAt.year == selectedDate.year && expense.createdAt.month == selectedDate.month).toList();
  }

  // 카테고리별 색상 매핑을 위한 맵
  final Map<String, Color> _categoryColors = {};

  // 색상 목록
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];

  // 카테고리에 색상을 랜덤하게 할당합니다.
  Color getColorForCategory(String category) {
    if (!_categoryColors.containsKey(category)) {
      final randomColor = _colors[Random().nextInt(_colors.length)];
      _categoryColors[category] = randomColor;
    }
    return _categoryColors[category]!;
  }

  List<PieChartSectionData> showingExpenseSections(List<TransactionOutGoing> filteredExpenses, List<String> percentages) {
    double totalAmount = filteredExpenses.fold(0, (sum, item) => sum + int.parse(item.amount.replaceAll(',', '')));

    return List.generate(filteredExpenses.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final value = int.parse(filteredExpenses[i].amount.replaceAll(',', ''));
      final percentage = (value / totalAmount * 100).toStringAsFixed(1) + '%';
      percentages.add(percentage); // 퍼센티지를 리스트에 추가
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: getColorForCategory(filteredExpenses[i].category), // 카테고리별 색상 할당
        value: value.toDouble(),
        title: percentage,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
      );
    });
  }

  List<Widget> getExpenseList(List<TransactionOutGoing> filteredExpenses, List<String> percentages) {
    return List.generate(filteredExpenses.length, (i) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: ListTile(
          leading: Container(
            width: 45.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: getColorForCategory(filteredExpenses[i].category), // 카테고리별 색상 할당
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              percentages[i],
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          title: Text(
            filteredExpenses[i].category,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          trailing: Text('${filteredExpenses[i].amount}원'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> percentages = [];
    List<TransactionOutGoing> filteredExpenses = getFilteredExpenses();

    return Column(
      children: [
        Container(
          height: 250, // 파이 차트의 높이를 줄임
          margin: EdgeInsets.fromLTRB(0, 50.0, 0, 50.0),
          child: PieChart(
            PieChartData(
              sections: showingExpenseSections(filteredExpenses, percentages),
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    onTouch(-1);
                    return;
                  }
                  onTouch(pieTouchResponse.touchedSection!.touchedSectionIndex);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: getExpenseList(filteredExpenses, percentages),
          ),
        ),
      ],
    );
  }
}
