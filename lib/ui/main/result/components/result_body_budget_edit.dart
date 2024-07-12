import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body_budget_app_bar.dart';

class ResultBodyBudgetEdit extends StatelessWidget {
  const ResultBodyBudgetEdit({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultBodyBudgetAppBar(title: "예산"),
      body: Placeholder(),
    );
  }
}
