import 'package:flutter/material.dart';

import '_components/calender_widget.dart';
import '_components/daily_list_appbar.dart';
import 'calender/transaction_calender_page.dart';
import 'daily/transaction_daily_page.dart';
import 'memo/transaction_memo_page.dart';

class TransactionPage extends StatelessWidget {
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
                  TransactionDailyPage(),
                  TransactionCalenderPage(),
                  TransactionMemoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
