import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';

class TransactionTotalAccount extends StatelessWidget {
  final TransactionListModel? model;

  const TransactionTotalAccount({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("수입"),
              Text("지출"),
              Text("합계"),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${model?.totalTransactionDTO?.monthlyIncome}", style: TextStyle(color: Colors.blue),
            ),
            Text("${model?.totalTransactionDTO?.monthlyExpense}", style: TextStyle(color: Colors.redAccent),
            ),
            Text("${model?.totalTransactionDTO?.monthlyTotalAmount}"),
          ],
        ),
      ],
    );
  }
}