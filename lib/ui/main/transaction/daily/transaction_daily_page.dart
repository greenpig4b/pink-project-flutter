import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/_components/calender_widget.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';
import '../../../components/under_line_widget.dart';
import '../../result/viewmodel/calendar_view_model.dart';
import 'components/transaction_record_detail.dart';
import 'components/transaction_total_account.dart';

class TransactionDailyPage extends ConsumerWidget {
  const TransactionDailyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);
    // ref.read(transactionListProvider(selectedDate.toString()).notifier).notifyInit();
    final model = ref.watch(transactionListProvider(selectedDate.toString()));



    if (model == null) {
      return Center(child: CircularProgressIndicator(color: Color(0xFFFC7C9A)));
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TransactionTotalAccount(model: model),
            UnderLineWidget(),
            Expanded(child: TransactionRecordDetail(model: model)),
          ],
        ),
      );
    }
  }
}
