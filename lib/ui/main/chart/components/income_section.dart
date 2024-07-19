import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeSection<T> extends StatelessWidget {
  final int touchedIndex;
  final ValueChanged<int> onTouch;
  final List<T> incomes;
  final DateTime selectedDate;

  IncomeSection({
    required this.touchedIndex,
    required this.onTouch,
    required this.incomes,
    required this.selectedDate,
  });

  String getCategoryEmoji(String category) {
    switch (category) {
      case '월급':
        return '💰';
      case '부수입':
        return '💸';
      case '용돈':
        return '🤑';
      case '상여':
        return '🏅';
      case '금융소득':
        return '🏦';
      case '기타':
        return '🎸';
      default:
        return '❓';
    }
  }

  List<Color> getColorPalette(int length) {
    final List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    // 반복해서 색상을 할당
    List<Color> palette = [];
    for (int i = 0; i < length; i++) {
      palette.add(colors[i % colors.length]);
    }
    return palette;
  }

  List<ChartData> getChartData(List<T> filteredIncomes) {
    final Map<String, double> categorySums = {};
    double totalAmount = filteredIncomes.fold(0, (sum, item) => sum + int.parse((item as dynamic).amount.replaceAll(',', '')));

    for (var income in filteredIncomes) {
      final category = (income as dynamic).category;
      final amount = int.parse(income.amount.replaceAll(',', ''));
      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount.toDouble();
      }
    }

    List<ChartData> chartData = categorySums.entries.map((entry) {
      final percentage = (entry.value / totalAmount * 100).toStringAsFixed(1) + '%';
      return ChartData(entry.key, entry.value, Colors.blue, percentage);
    }).toList();

    // 퍼센트 순으로 정렬
    chartData.sort((a, b) => b.value.compareTo(a.value));

    // 색상 할당
    List<Color> colors = getColorPalette(chartData.length);
    for (int i = 0; i < chartData.length; i++) {
      chartData[i].color = colors[i];
    }

    return chartData;
  }

  List<Widget> getIncomeList(List<T> filteredIncomes, List<ChartData> chartData) {
    if (filteredIncomes.isEmpty) {
      return [
        Center(child: Text('데이터가 없습니다')),
      ];
    }

    final formatter = NumberFormat('#,###');

    return List.generate(chartData.length, (i) {
      final data = chartData[i];
      final category = data.category;
      final amount = data.value.toInt();
      final formattedAmount = formatter.format(amount);
      final percentage = data.percentage;

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
              color: data.color,
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
                getCategoryEmoji(category),
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(width: 8.0),
              Text(
                category,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: Text('${formattedAmount}원'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = getChartData(incomes);

    return Column(
      children: [
        Container(
          height: 300,
          margin: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
          child: SfCircularChart(
            title: ChartTitle(text: '수입현황'),
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.category,
                yValueMapper: (ChartData data, _) => data.value,
                pointColorMapper: (ChartData data, _) => data.color,
                dataLabelMapper: (ChartData data, _) => data.percentage,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.line,
                    length: '10%',
                  ),
                ),
                innerRadius: '20%',
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: getIncomeList(incomes, chartData),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.category, this.value, this.color, this.percentage);
  final String category;
  final double value;
  Color color;
  final String percentage;
}
