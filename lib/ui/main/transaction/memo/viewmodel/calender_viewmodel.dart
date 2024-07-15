import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarViewmodel extends StateNotifier<DateTime> {
  CalendarViewmodel() : super(DateTime.now());

  void prevMonth() {
    state = DateTime(state.year, state.month - 1, 1);
  }

  void nextMonth() {
    state = DateTime(state.year, state.month + 1, 1);
  }

  DateTime get selectedDate => state;
}

final calendarProvider = StateNotifierProvider<CalendarViewmodel, DateTime>((ref) {
  return CalendarViewmodel();
});
