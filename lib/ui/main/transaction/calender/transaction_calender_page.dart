import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/under_line_widget.dart';
import '../daily/components/transaction_total_account.dart';

class TransactionCalenderPage extends StatefulWidget {
  @override
  State<TransactionCalenderPage> createState() => _TransactionCalenderPageState();
}

class _TransactionCalenderPageState extends State<TransactionCalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month; // 달력의 기본 형식을 월별로 설정
  DateTime _focusedDay = DateTime.now(); // 현재 포커스된 날짜를 현재 날짜로 설정
  DateTime? _selectedDay; // 선택된 날짜, 초기값은 null
  String _selectedDateInfo = ""; // 선택된 날짜의 정보를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TransactionTotalAccount(),
          UnderLineWidget(),
          Container(
            height: 250,
            child: TableCalendar(
              headerVisible: false,
              focusedDay: _focusedDay,
              firstDay: DateTime(2024),
              lastDay: DateTime(2027),
              locale: 'ko-KR',
              daysOfWeekHeight: 17,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);  // 선택된 날짜와 같은 날짜 인지 확인
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;  // 선택된 날짜 업데이트
                    _focusedDay = focusedDay;  // 포커스된 날짜 업데이트
                    _selectedDateInfo = "선택된 날짜: ${_selectedDay?.toString().split(' ')[0]}"; // 선택된 날짜 정보 업데이트

                    print('${_selectedDay} 선택된 날짜');
                    print('${_focusedDay} 포커스된 날짜');
                  });
                }
              },

              // 달력 헤더의 스타일 설정
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // 헤더에 있는 버튼 숨김
              ),

              // 요일 한글화
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  switch(day.weekday){
                    case 1:
                      return Center(child: Text('월'),);
                    case 2:
                      return Center(child: Text('화'),);
                    case 3:
                      return Center(child: Text('수'),);
                    case 4:
                      return Center(child: Text('목'),);
                    case 5:
                      return Center(child: Text('금'),);
                    case 6:
                      return Center(child: Text('토'),);
                    case 7:
                      return Center(child: Text('일', style: TextStyle(color: Colors.red),),);
                  }
                },
                //defaultBuilder: (context, day, focusedDay)
              ),

              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.black87),
                weekendTextStyle: TextStyle(color: Colors.redAccent),
              ),
              rowHeight: 45,
            ),
          ),

          UnderLineWidget(),

          // 선택된 날짜의 정보를 표시하는 위젯 추가
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _selectedDateInfo,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
