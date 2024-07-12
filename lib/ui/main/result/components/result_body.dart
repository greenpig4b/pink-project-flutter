import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body_budget.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body_budget_button.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultBodyBudgetButton(),
        ResultBodyBudget(),
      ],
    );
  }
}
