import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../transaction/daily/viewmodel/transaction_calender_viewmodel.dart';

final calendarProvider = StateNotifierProvider<CalendarViewmodel, DateTime>((ref) {
  return CalendarViewmodel();
});

class BudgetEditAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String category; // 수정된 부분: 카테고리를 받을 변수 추가

  const BudgetEditAppBar({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);

    return AppBar(
      backgroundColor: Color(0xFFFC7C9A),
      title: Text(category, style: TextStyle(color: Colors.white, fontSize: 20),), // 수정된 부분: 카테고리를 제목으로 설정
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => ref.read(calendarProvider.notifier).prevMonth(),
            ),
            Text(
              DateFormat.yMMMM('ko_KR').format(selectedDate),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () => ref.read(calendarProvider.notifier).nextMonth(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: const Row(
            children: [
              Icon(Icons.delete_outline, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
