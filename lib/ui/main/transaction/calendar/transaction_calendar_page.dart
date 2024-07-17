// transaction_calendar_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../data/store/calendar_store.dart';
import '../../../components/under_line_widget.dart';
import '../daily/components/transaction_total_account.dart';
import 'components/memo_button.dart';
import 'components/transaction_detail.dart';
import 'components/transaction_detail_memo.dart';
import 'components/transaction_header.dart';

class TransactionCalenderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarStoreProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: MemoButton(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: TransactionTotalAccount(),
          ),
          SliverToBoxAdapter(
            child: UnderLineWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildTableCalendar(ref),
            ),
          ),
          SliverToBoxAdapter(
            child: UnderLineWidget(),
          ),
        ],
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TransactionHeader(
                selectedDayNum: calendarState.selectedDayNum,
                selectedYear: calendarState.selectedYear,
                selectedMonth: calendarState.selectedMonth,
                selectedWeekday: calendarState.selectedWeekday,
              ),
            ),
            UnderLineWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  TransactionDetailMemo(title: "메모1"),
                  TransactionDetailMemo(title: "메모2"),
                  UnderLineWidget(),
                  TransactionDetail(
                    category: "기타",
                    content: "옷사기",
                    property: "카드",
                    price: "30000원",
                    isIncome: false,
                  ),
                  UnderLineWidget(),
                  TransactionDetail(
                    category: "식비",
                    content: "밥",
                    property: "현금",
                    price: "9000원",
                    isIncome: false,
                  ),
                  UnderLineWidget(),
                  TransactionDetail(
                    category: "용돈",
                    content: "용돈",
                    property: "계좌",
                    price: "300000원",
                    isIncome: true,
                  ),
                  UnderLineWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar(WidgetRef ref) {
    final calendarStore = ref.read(calendarStoreProvider.notifier);
    final calendarState = ref.watch(calendarStoreProvider);

    return TableCalendar(
      headerVisible: false,
      focusedDay: calendarState.focusedDay,
      firstDay: DateTime(2024),
      lastDay: DateTime(2027),
      locale: 'ko-KR',
      daysOfWeekHeight: 17,
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) {
        return isSameDay(calendarState.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(calendarState.selectedDay, selectedDay)) {
          calendarStore.updateCalendar(selectedDay);
          print(selectedDay);
        }
      },
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
      ),
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          final text = ['월', '화', '수', '목', '금', '토', '일'][day.weekday - 1];
          if (day.weekday == 7) {
            return Center(child: Text(text, style: TextStyle(color: Colors.red)));
          }
          return Center(child: Text(text));
        },
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.black87),
        weekendTextStyle: TextStyle(color: Colors.redAccent),
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFC7C9A).withOpacity(0.7),
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: DateTime.now().toString().split(' ')[0] != calendarState.focusedDay.toString().split(' ')[0]
              ? Colors.grey.withOpacity(0.7)
              : Color(0xFFFC7C9A).withOpacity(0.7),
        ),
      ),
      rowHeight: 45,
    );
  }
}