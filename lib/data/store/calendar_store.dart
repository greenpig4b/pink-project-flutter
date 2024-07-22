// calendar_store.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarStore extends StateNotifier<CalendarState> {
  CalendarStore() : super(CalendarState(
    selectedDay: DateTime.now(),
    focusedDay: DateTime.now(),
    selectedYear: DateTime.now().year.toString(),
    selectedMonth: DateTime.now().month.toString().padLeft(2, '0'),
    selectedDayNum: DateTime.now().day.toString().padLeft(2, '0'),
    selectedWeekday: getWeekdayString(DateTime.now().weekday),
  ));

  static String getWeekdayString(int weekday) {
    switch (weekday) {
      case 1: return '월요일';
      case 2: return '화요일';
      case 3: return '수요일';
      case 4: return '목요일';
      case 5: return '금요일';
      case 6: return '토요일';
      case 7: return '일요일';
      default: return '';
    }
  }

  void updateCalendar(DateTime selectedDay) {
    state = CalendarState(
      selectedDay: selectedDay,
      focusedDay: selectedDay,
      selectedYear: selectedDay.year.toString(),
      selectedMonth: selectedDay.month.toString().padLeft(2, '0'),
      selectedDayNum: selectedDay.day.toString().padLeft(2, '0'),
      selectedWeekday: getWeekdayString(selectedDay.weekday),
    );
  }
}

class CalendarState {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final String selectedYear;
  final String selectedMonth;
  final String selectedDayNum;
  final String selectedWeekday;

  CalendarState({
    required this.selectedDay,
    required this.focusedDay,
    required this.selectedYear,
    required this.selectedMonth,
    required this.selectedDayNum,
    required this.selectedWeekday,
  });
}

final calendarStoreProvider = StateNotifierProvider<CalendarStore, CalendarState>((ref) {
  return CalendarStore();
});