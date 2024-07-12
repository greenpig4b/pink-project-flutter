import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_app_bar.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_detail_info.dart';

import '../../data/result_budget_dummy.dart';

class BudgetDetail extends StatelessWidget {
  const BudgetDetail({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BudgetAppBar(title: "예산"),
      body: Column(
        children: [
          BudgetDetailInfo(),
          Container(
            height: 0.5,
            color: Colors.grey,
          ),
          Expanded(
            // ListView.builder를 Expanded로 감싸서 확장 가능하도록 설정
            child: ListView.builder(
              itemCount: budgetData.length,
              itemBuilder: (context, index) {
                final category = budgetData[index]["category"];
                final budget = budgetData[index]["budget"];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category, style: TextStyle(fontSize: 16.0)),
                      Text("${budget.toStringAsFixed(0)}원",
                          style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
