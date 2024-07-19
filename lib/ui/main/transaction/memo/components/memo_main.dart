import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_components/calender_widget.dart';
import '../viewmodel/memo_list_viewmodel.dart';
import 'memo_list.dart';
import 'memo_write_button.dart';


List<Map<String, dynamic>> recordList = [];

class MemoMain extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);
    final model = ref.watch(memoListProvider(selectedDate.toIso8601String()));
    return Stack(
      children: [
        MemoList(model: model,),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: MemoWriteButton(),
        ),
      ],
    );
  }
}
