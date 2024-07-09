import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseSection extends StatelessWidget {
  final int touchedIndex;
  final ValueChanged<int> onTouch;

  ExpenseSection({required this.touchedIndex, required this.onTouch});

  List<PieChartSectionData> showingExpenseSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: 66,
            title: '66%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: 34,
            title: '34%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  List<Widget> getExpenseList() {
    return [
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
        ),
        title: Text('패션/미용'),
        trailing: Text('66% 5,000원'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
        ),
        title: Text('주거/통신'),
        trailing: Text('34% 2,582원'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250, // 파이 차트의 높이를 줄임
          margin: EdgeInsets.fromLTRB(0, 50.0, 0, 50.0),
          child: PieChart(
            PieChartData(
              sections: showingExpenseSections(),
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
            children: getExpenseList(),
          ),
        ),
      ],
    );
  }
}
