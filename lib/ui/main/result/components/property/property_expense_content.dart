import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/data/dtos/result/result_response.dart';

class PropertyExpenseContent extends StatelessWidget {
  final MonthlyExpenseSummary? expenseSummary;

  const PropertyExpenseContent({Key? key, this.expenseSummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8.0), // 모서리를 둥글게 설정
        ),
        padding: const EdgeInsets.all(16.0), // 내용물과 경계선 사이의 패딩
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("지출", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("전월대비 지출 (당월/전월)"),
                Text("${expenseSummary?.previousMonthExpenseComparison}"),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("지출 (현금, 은행, 카드)"),
                Text("${expenseSummary?.totalMonthlyExpense}"),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("현금"),
                Text("${expenseSummary?.monthlyCashExpense}"),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("은행"),
                Text("${expenseSummary?.monthlyBankExpense}"),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("카드"),
                Text("${expenseSummary?.monthlyCardExpense}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
