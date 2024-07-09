import 'package:flutter/material.dart';
import '../../../components/under_line_widget.dart';
import 'components/transaction_record_detail.dart';
import 'components/transaction_total_account.dart';


class TransactionDailyPage extends StatelessWidget {
  const TransactionDailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionTotalAccount(),
        UnderLineWidget(),
        Expanded(child: TransactionRecordDetail())
      ],
    );
  }
}
