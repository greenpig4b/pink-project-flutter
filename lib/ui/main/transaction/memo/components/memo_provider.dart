import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_list.dart';

// 제목 상태 관리
final titleProvider = StateProvider<String>((ref) => '');

// 내용 상태 관리
final contentProvider = StateProvider<String>((ref) => '');

// StateNotifier class to manage date state
class SelectedDateNotifier extends StateNotifier<DateTime> {
  SelectedDateNotifier() : super(DateTime.now());

  void updateDate(DateTime newDate) {
    state = newDate;
  }
}

// Providers
final selectedDateProvider = StateNotifierProvider<SelectedDateNotifier, DateTime>((ref) => SelectedDateNotifier());

final selectedMonthProvider = StateProvider<DateTime>((ref) {
  return DateTime(2024, 10);
});

// final memoListProvider = Provider<List<MemoList>>((ref) {
//   final selectedMonth = ref.watch(selectedMonthProvider);
//   return newMemoList.where((memo) {
//     DateTime date = DateTime.parse(memo.registrationDate);
//     return date.year == selectedMonth.year && date.month == selectedMonth.month;
//   }).toList();
// });



