import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseSection<T> extends StatelessWidget {
  final int touchedIndex;
  final ValueChanged<int> onTouch;
  final List<T> expenses;
  final DateTime selectedDate;

  ExpenseSection({
    required this.touchedIndex,
    required this.onTouch,
    required this.expenses,
    required this.selectedDate,
  });

  List<PieChartSectionData> showingExpenseSections(
      List<T> filteredExpenses, List<String> percentages) {
    final Map<String, int> categorySums = {};
    for (var expense in filteredExpenses) {
      final item = expense as dynamic;
      final category = item.category;
      final amount = int.parse(item.amount.replaceAll(',', ''));
      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount;
      }
    }

    double totalAmount = categorySums.values.fold(0, (sum, amount) => sum + amount);

    return List.generate(categorySums.length, (i) {
      final category = categorySums.keys.elementAt(i);
      final value = categorySums[category]!;
      final percentage = (value / totalAmount * 100).toStringAsFixed(1) + '%';
      percentages.add(percentage);
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: Colors.red,
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

  List<Widget> getExpenseList(
      List<T> filteredExpenses, List<String> percentages) {
    final Map<String, int> categorySums = {};
    for (var expense in filteredExpenses) {
      final item = expense as dynamic;
      final category = item.category;
      final amount = int.parse(item.amount.replaceAll(',', ''));
      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount;
      }
    }

    return List.generate(categorySums.length, (i) {
      final category = categorySums.keys.elementAt(i);
      final amount = categorySums[category]!;
      final percentage = percentages[i];

      final T? matchingExpense = filteredExpenses.cast<T?>().firstWhere(
            (expense) => (expense as dynamic).category == category,
        orElse: () => null,
      );

      final categoryImagePath = matchingExpense != null
          ? (matchingExpense as dynamic).categoryImagePath
          : '';

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
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              percentage,
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          title: Row(
            children: [
              Text(
                categoryImagePath,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(width: 8.0),
              Text(
                category,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: Text('${amount}원'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> percentages = [];
    return Column(
      children: [
        Container(
          height: 250,
          margin: EdgeInsets.fromLTRB(0, 50.0, 0, 50.0),
          child: PieChart(
            PieChartData(
              sections: showingExpenseSections(expenses, percentages),
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
            children: getExpenseList(expenses, percentages),
          ),
        ),
      ],
    );
  }
}
