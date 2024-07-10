import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/_components/calender_widget.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';
import '../../../components/under_line_widget.dart';
import 'components/transaction_record_detail.dart';
import 'components/transaction_total_account.dart';

class TransactionDailyPage extends ConsumerWidget {
  const TransactionDailyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);
    ref.watch(transactionListProvider(selectedDate.toString()).notifier);

    return Column(
      children: [
        TransactionTotalAccount(),
        UnderLineWidget(),
        Expanded(child: TransactionRecordDetail()),
      ],
    );
  }
}
