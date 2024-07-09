import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/under_line_widget.dart';
import '../daily/components/transaction_total_account.dart';

class TransactionCalenderPage extends StatelessWidget {
  const TransactionCalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TransactionTotalAccount(),
          UnderLineWidget(),
          TableCalendar(
            focusedDay: DateTime.now(), firstDay: DateTime(2024), lastDay: DateTime(2027),
            // 달력 헤더의 스타일 설정
            headerStyle: HeaderStyle(
              titleCentered: true, // 타이틀을 가운데 정렬
              formatButtonVisible: false, // 헤더에 있는 버튼 숨김


              // 타이틀 텍스트 스타일 설정
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700, // 타이틀 텍스트 두께
                fontSize: 20.0, // 타이틀 텍스트 크기
              ),
            ),

            // 선택한 날짜를 인식하는 함수
            selectedDayPredicate: (DateTime day){
              final now = DateTime.now();
              return DateTime(day.year, day.month, day.day).isAtSameMomentAs(
                DateTime(now.year,now.month,now.day),
              );
            },

            // 날짜 선택 시
            onDaySelected: (DateTime selectedDay, DateTime focusedDay){
              print('${selectedDay}onDaySelected');
            },


          ),
        ],
      ),
    );
  }
}
