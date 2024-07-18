import 'package:flutter/material.dart';
import '../viewmodel/result_list_view_model.dart';

class ResultBodyTop extends StatelessWidget {
  final ResultListModel? model;

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
            Text("${model?.monthlyFinancialReport?.monthlyIncome}", style: TextStyle(color: Colors.blue)),
            Text("${model?.monthlyFinancialReport?.monthlyExpense}", style: TextStyle(color: Colors.redAccent)),
            Text("${model?.monthlyFinancialReport?.monthlyTotalAmount}"),
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
