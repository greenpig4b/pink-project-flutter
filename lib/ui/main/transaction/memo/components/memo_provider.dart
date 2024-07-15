import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/memo_dummy.dart';

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
  return DateTime.now();
});

final memoListProvider = Provider<List<Memo>>((ref) {
  final selectedMonth = ref.watch(selectedMonthProvider);
  return newMemoList.where((memo) {
    return memo.createdDate.year == selectedMonth.year && memo.createdDate.month == selectedMonth.month;
  }).toList();
});



