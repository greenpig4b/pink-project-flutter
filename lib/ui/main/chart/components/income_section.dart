import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeSection extends StatelessWidget {
  final int touchedIndex;
  final ValueChanged<int> onTouch;

  IncomeSection({required this.touchedIndex, required this.onTouch});

  List<PieChartSectionData> showingIncomeSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 50,
            title: '50%',
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
            color: Colors.green,
            value: 50,
            title: '50%',
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

  List<Widget> getIncomeList() {
    return [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
              )
            ],
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: ListTile(
          leading: Container(
            width: 45.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              '50%',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          title: Text(
            '용돈',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          trailing: Text('3,500원'),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffdddddd), // 테두리 색상
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: ListTile(
          leading: Container(
            width: 45.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              '50%',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
          title: Text(
            '월급',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          trailing: Text('3,500원'),
        ),
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
              sections: showingIncomeSections(),
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
            children: getIncomeList(),
          ),
        ),
      ],
    );
  }
}
