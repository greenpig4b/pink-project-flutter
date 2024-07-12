import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_app_bar.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_detail_info.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_edit.dart'; // BudgetEdit 페이지 import
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(category, style: TextStyle(fontSize: 16.0)),
                          Row(
                            children: [
                              Text("${budget.toStringAsFixed(0)}원",
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BudgetEdit(category: category),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 0.5,
                      thickness: 0.5,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
