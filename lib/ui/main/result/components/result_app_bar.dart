import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_calender_viewmodel.dart';

final calendarProvider = StateNotifierProvider<CalendarViewmodel, DateTime>((ref) {
  return CalendarViewmodel();
});

class ResultAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);

    return AppBar(
      backgroundColor: Color(0xFFFC7C9A),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => ref.read(calendarProvider.notifier).prevMonth(),
          ),
          SizedBox(width: 20.0),
          Text(
            DateFormat.yMMMM('ko_KR').format(selectedDate),
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(width: 20.0),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () => ref.read(calendarProvider.notifier).nextMonth(),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.white),
              SizedBox(width: 20.0),
              Icon(Icons.settings, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
