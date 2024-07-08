
import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/history/calender/history_calender_page.dart';
import '_components/calender_widget.dart';
import 'daily/history_daily_page.dart';
import 'memo/history_memo_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          CalendarWidget(),
          TabBar(
            tabs: const [
              Tab(text: "일일"),
              Tab(text: "달력"),
              Tab(text: "메모")
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                HistoryDailyPage(),
                HistoryCalenderPage(),
                HistoryMemoPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}