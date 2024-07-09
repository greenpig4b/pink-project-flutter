import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_calender_viewmodel.dart';

final calendarProvider = StateNotifierProvider<CalendarViewmodel, DateTime>((ref) {
  return CalendarViewmodel();
});

class CalendarWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);

    return Container(
      color: Color(0xFFFC7C9A),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => ref.read(calendarProvider.notifier).prevMonth(),
          ),
          Text(
            DateFormat.yMMMM('ko_KR').format(selectedDate),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () => ref.read(calendarProvider.notifier).nextMonth(),
          ),
        ],
      ),
    );
  }
}
