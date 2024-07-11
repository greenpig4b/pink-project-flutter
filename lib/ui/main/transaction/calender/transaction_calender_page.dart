import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/under_line_widget.dart';
import '../daily/components/transaction_total_account.dart';
import 'components/transaction_detail.dart';

class TransactionCalenderPage extends StatefulWidget {
  @override
  State<TransactionCalenderPage> createState() =>
      _TransactionCalenderPageState();
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
              child: TableCalendar(
                headerVisible: false,
                focusedDay: _focusedDay,
                firstDay: DateTime(2024),
                lastDay: DateTime(2027),
                locale: 'ko-KR',
                daysOfWeekHeight: 17,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day); // 선택된 날짜와 같은 날짜 인지 확인
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay; // 선택된 날짜 업데이트
                      _focusedDay = focusedDay; // 포커스된 날짜 업데이트
                      _selectedDateInfo =
                          "선택된 날짜: ${_selectedDay?.toString().split(' ')[0]}"; // 선택된 날짜 정보 업데이트

                      print('${_selectedDay} 선택된 날짜');
                      print('${_focusedDay} 포커스된 날짜');
                      print('${DateTime.now()} 오늘 날짜');
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
                    switch (day.weekday) {
                      case 1:
                        return Center(
                          child: Text('월'),
                        );
                      case 2:
                        return Center(
                          child: Text('화'),
                        );
                      case 3:
                        return Center(
                          child: Text('수'),
                        );
                      case 4:
                        return Center(
                          child: Text('목'),
                        );
                      case 5:
                        return Center(
                          child: Text('금'),
                        );
                      case 6:
                        return Center(
                          child: Text('토'),
                        );
                      case 7:
                        return Center(
                          child: Text(
                            '일',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      default:
                        return SizedBox(); // 예기치 않은 경우, 빈 SizedBox 반환
                    }
                  },
                ),

                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.black87),
                  weekendTextStyle: TextStyle(color: Colors.redAccent),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFC7C9A)
                        .withOpacity(0.7), // 오늘 날짜 동그라미 색상을 여기서 설정
                  ),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DateTime.now().toString().split(' ')[0] !=
                            _focusedDay.toString().split(' ')[0]
                        ? Colors.grey.withOpacity(0.7)
                        : Color(0xFFFC7C9A)
                            .withOpacity(0.7), // 선택된 날짜의 동그라미 색상을 여기서 설정
                  ),
                ),
                rowHeight: 45,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: UnderLineWidget(),
          ),
        ],
        body: ListView(children: [
          Text(
            _selectedDateInfo,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          UnderLineWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (_selectedDateInfo.isNotEmpty) ...[
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
