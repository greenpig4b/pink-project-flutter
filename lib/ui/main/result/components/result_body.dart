import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/data/dtos/result/result_response.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/property/property_expense_content.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/property/property_income_content.dart';
import '../viewmodel/result_list_view_model.dart';
import 'property/property_title.dart';


class ResultBody extends StatelessWidget {
  final ResultListModel? model;

  const ResultBody({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PropertyTitle(model: model), // Existing widget for the title
        PropertyExpenseContent(expenseSummary: model?.monthlyExpenseSummary),
        SizedBox(height: 10),
        PropertyIncomeContent(incomeSummary: model?.monthlyIncomeSummary),
      ],
    );
  }
}
