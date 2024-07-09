import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/history/calender/history_calender_page.dart';
import '_components/calender_widget.dart';
import '_components/daily_list_appbar.dart';
import 'daily/history_daily_page.dart';
import 'memo/history_memo_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DailyListAppbar(title: "가계부"),  // DailyListAppbar 설정
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            CalendarWidget(),
            const TabBar(

              tabs: [
                Tab(text: "일일"),
                Tab(text: "달력"),
                Tab(text: "메모")
              ],
            ),
            const Expanded(
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
      ),
    );
  }
}
