import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TodayNutritionInfo extends StatelessWidget {
  final double totalCarbo;
  final double totalProtein;
  final double totalFat;
  final double targetCarbo;
  final double targetProtein;
  final double targetFat;
  final double totalCalories;
  final double targetCalories;

  const TodayNutritionInfo({
    Key? key,
    required this.totalCarbo,
    required this.totalProtein,
    required this.totalFat,
    required this.targetCarbo,
    required this.targetProtein,
    required this.targetFat,
    required this.totalCalories,
    required this.targetCalories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '오늘의 영양',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Row(
            children: [
              Container(
                height: 170,
                width: 170,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: Colors.deepOrange[200],
                            value: totalCarbo / targetCarbo * 100,
                            title: '${(totalCarbo / targetCarbo * 100).toStringAsFixed(1)}%',
                            radius: 50,
                            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          PieChartSectionData(
                            color: Colors.cyanAccent,
                            value: totalProtein / targetProtein * 100,
                            title: '${(totalProtein / targetProtein * 100).toStringAsFixed(1)}%',
                            radius: 40,
                            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          PieChartSectionData(
                            color: Colors.greenAccent,
                            value: totalFat / targetFat * 100,
                            title: '${(totalFat / targetFat * 100).toStringAsFixed(1)}%',
                            radius: 30,
                            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${totalCalories.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '/${targetCalories.toStringAsFixed(0)} kcal',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNutrientInfo('탄수화물', totalCarbo, targetCarbo, 'g', Colors.deepOrange[200]!),
                  SizedBox(height: 5),
                  _buildNutrientInfo('단백질', totalProtein, targetProtein, 'g', Colors.cyanAccent),
                  SizedBox(height: 5),
                  _buildNutrientInfo('지방', totalFat, targetFat, 'g', Colors.greenAccent),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientInfo(String nutrient, double amount, double target, String unit, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nutrient, style: TextStyle(fontSize: 10)),
            Text('${amount.toStringAsFixed(1)} / ${target.toStringAsFixed(1)} $unit', style: TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }
}