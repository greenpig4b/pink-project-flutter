import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';

class ResultBodyTop extends StatelessWidget {
  final TransactionListModel? model;

  const ResultBodyTop({Key? key, this.model}) : super(key: key);

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
        SizedBox(height: 8), // 간격 추가
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${model?.totalTransactionDTO?.monthlyIncome}", style: TextStyle(color: Colors.blue)),
            Text("${model?.totalTransactionDTO?.monthlyExpense}", style: TextStyle(color: Colors.redAccent)),
            Text("${model?.totalTransactionDTO?.monthlyTotalAmount}"),
          ],
        ),
        SizedBox(height: 8), // 간격 추가
        Container(
          height: 0.5, // 선의 높이 설정 (굵기)
          color: Colors.grey, // 선의 색상 설정
        ),
      ],
    );
  }
}
