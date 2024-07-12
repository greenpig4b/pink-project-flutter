import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/under_line_widget.dart';
import '../daily/components/transaction_total_account.dart';
import '../daily/transaction_write_page.dart';
import 'components/transaction_detail.dart';
import 'components/transaction_detail_memo.dart';

class TransactionCalenderPage extends StatefulWidget {
  @override
  State<TransactionCalenderPage> createState() =>
      _TransactionCalenderPageState();
}

class _TransactionCalenderPageState extends State<TransactionCalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month; // 달력의 기본 형식을 월별로 설정
  DateTime _focusedDay = DateTime.now(); // 현재 포커스된 날짜를 현재 날짜로 설정
  DateTime? _selectedDay = DateTime.now(); // 선택된 날짜를 초기화
  String _selectedYear = DateTime.now().year.toString(); // 초기 연도 설정
  String _selectedMonth = DateTime.now().month.toString().padLeft(2, '0'); // 초기 월 설정
  String _selectedDayNum = DateTime.now().day.toString().padLeft(2, '0'); // 초기 일 설정
  String _selectedWeekday = ""; // 선택된 요일 저장

  @override
  void initState() {
    super.initState();
    _selectedWeekday = getWeekdayString(_selectedDay!.weekday); // 초기 요일 설정
  }

  // 요일을 한글로 변환하는 함수
  String getWeekdayString(int weekday) {
    switch (weekday) {
      case 1:
        return '월요일';
      case 2:
        return '화요일';
      case 3:
        return '수요일';
      case 4:
        return '목요일';
      case 5:
        return '금요일';
      case 6:
        return '토요일';
      case 7:
        return '일요일';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionWritePage()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFFFF6254),
        shape: CircleBorder(),
      ),
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
                      _selectedYear = selectedDay.year.toString(); // 선택된 연도 업데이트
                      _selectedMonth = selectedDay.month.toString().padLeft(2, '0'); // 선택된 월 업데이트
                      _selectedDayNum = selectedDay.day.toString().padLeft(2, '0'); // 선택된 일 업데이트
                      _selectedWeekday = getWeekdayString(selectedDay.weekday); // 선택된 요일 업데이트
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
          if (_selectedYear.isNotEmpty &&
              _selectedMonth.isNotEmpty &&
              _selectedDayNum.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "$_selectedDayNum",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$_selectedYear. $_selectedMonth.",
                              style: TextStyle(fontSize: 13),
                            ),
                            Container(
                              width: 45,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Color(0xB6B7B7B7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "$_selectedWeekday",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/heart-regular.svg',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          UnderLineWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                if (_selectedYear.isNotEmpty &&
                    _selectedMonth.isNotEmpty &&
                    _selectedDayNum.isNotEmpty) ...[
                  TransactionDetailMemo(
                    title: "메모1",
                  ),
                  TransactionDetailMemo(
                    title: "메모2",
                  ),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
