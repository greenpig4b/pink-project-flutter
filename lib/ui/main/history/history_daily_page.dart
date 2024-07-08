import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/history/components/daily_list_appbar.dart';

import '../../components/under_line_widget.dart';
import 'components/history_record_detail.dart';
import 'components/history_total_account.dart';

class HistoryDailyPage extends StatelessWidget {
  const HistoryDailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HistoryTotalAccount(),
        UnderLineWidget(),
        Expanded(child: HistoryRecordDetail())
      ],
    );
  }
}
