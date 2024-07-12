import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_edit_app_bar.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/budget/budget_edit_info.dart';

class BudgetEdit extends StatelessWidget {
  final String category;

  const BudgetEdit({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BudgetEditAppBar(category: category), // 카테고리 전달
      body: BudgetEditInfo(),
    );
  }
}