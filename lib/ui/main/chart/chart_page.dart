import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'components/my_chart_page.dart';

void main() => runApp(ChartPage());

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyChartPage(),
    );
  }
}

