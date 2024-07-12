import 'package:flutter/material.dart';

import '../data/result_budget_dummy.dart';

class ResultBodyBudget extends StatelessWidget {
  const ResultBodyBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: budgetData.map((data) {
        double budget = data["budget"];
        double spent = data["spent"];
        double progress = spent / budget;
        double remaining = budget - spent;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["category"]),
                        Text("${budget.toStringAsFixed(0)}원"),
                      ],
                    ),
                  ),
                  SizedBox(width: 20), // 간격 추가
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  height: 20,
                                  width: constraints.maxWidth * progress, // 진행도에 따른 너비 설정
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "${(progress * 100).toStringAsFixed(1)}%",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10), // 간격 추가
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${spent.toStringAsFixed(0)}원",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Text("${remaining.toStringAsFixed(0)}원"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 0.5, // 선의 높이 설정 (굵기)
                color: Colors.grey, // 선의 색상 설정
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
