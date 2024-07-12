import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_app_bar.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_edit_info.dart';

class BudgetEdit extends StatelessWidget {
  const BudgetEdit({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BudgetAppBar(title: "예산"),
      body: Column(
        children: [
          BudgetEditInfo(),
          Container(
            height: 0.5, // 선의 높이 설정 (굵기)
            color: Colors.grey, // 선의 색상 설정
          ),
        ],
      ),
    );
  }
}
