import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/viewmodel/memo_list_viewmodel.dart';
import '../_components/calender_widget.dart';
import 'components/memo_main.dart';

class TransactionMemoPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);
    final model = ref.watch(memoListProvider(selectedDate.toIso8601String()));
    return Scaffold(
      backgroundColor: Colors.white,
      body: MemoMain(model: model),
    );
  }
}