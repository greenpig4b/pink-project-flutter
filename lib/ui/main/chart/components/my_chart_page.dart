import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/chart/components/weekly/weekly_tabmenu.dart';
import '../../../../data/store/session_store.dart';
import 'month/month_tabmenu.dart';

import '../viewmodel/chart_list_viewmodel.dart';
import 'appbar/custom_appbar.dart';

class MyChartPage extends ConsumerWidget {
  MyChartPage({Key? key}) : super(key: key);

  void _nextPeriod(BuildContext context, WidgetRef ref) {
    ref.read(selectedDateProvider.notifier).update((state) {
      DateTime newDate;
      if (ref.read(isMonthlyViewProvider)) {
        newDate = DateTime(state.year, state.month + 1, 1);
      } else {
        newDate = state.add(Duration(days: 7));
      }
      _fetchChartData(ref, newDate);
      return newDate;
    });
  }

  void _previousPeriod(BuildContext context, WidgetRef ref) {
    ref.read(selectedDateProvider.notifier).update((state) {
      DateTime newDate;
      if (ref.read(isMonthlyViewProvider)) {
        newDate = DateTime(state.year, state.month - 1, 1);
      } else {
        newDate = state.subtract(Duration(days: 7));
      }
      _fetchChartData(ref, newDate);
      return newDate;
    });
  }

  void _toggleView(bool isMonthly, WidgetRef ref) {
    ref.read(isMonthlyViewProvider.notifier).state = isMonthly;
    _fetchChartData(ref, ref.read(selectedDateProvider));
  }

  Future<void> _fetchChartData(WidgetRef ref, DateTime date) async {
    final selectedDateString = DateFormat('yyyy-MM-dd').format(date);
    final chartListViewmodel = ref.read(chartListProvider(selectedDateString).notifier);
    final jwtToken = ref.read(sessionProvider).accessToken!;
    DateTime startDate;
    DateTime endDate;

    if (ref.read(isMonthlyViewProvider)) {
      startDate = DateTime(date.year, date.month, 1);
      endDate = DateTime(date.year, date.month, 0);
      await chartListViewmodel.notifyInitMonthly(selectedDateString, jwtToken, date.year, date.month);
    } else {
      startDate = date.subtract(Duration(days: date.weekday - 1));
      endDate = startDate.add(Duration(days: 6));
      final startDateString = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(startDate);
      final endDateString = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(endDate);
      await chartListViewmodel.notifyInitWeekly(selectedDateString, jwtToken, date.year, date.month, startDateString, endDateString);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final isMonthlyView = ref.watch(isMonthlyViewProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBar(
              title: isMonthlyView
                  ? '${selectedDate.year}년 ${selectedDate.month}월'
                  : '${DateFormat('M.d').format(selectedDate.subtract(Duration(days: selectedDate.weekday - 1)))} ~ ${DateFormat('M.d').format(selectedDate.add(Duration(days: 7 - selectedDate.weekday - 1)))}',
              onNextPeriod: () => _nextPeriod(context, ref),
              onPreviousPeriod: () => _previousPeriod(context, ref),
              onMonthlyView: () => _toggleView(true, ref),
              onWeeklyView: () => _toggleView(false, ref),
              isMonthlyView: isMonthlyView,
            ),
            Expanded(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    _nextPeriod(context, ref);
                  } else if (details.primaryVelocity! > 0) {
                    _previousPeriod(context, ref);
                  }
                },
                child: isMonthlyView
                    ? MonthTabmenu(selectedDate: selectedDate, jwtToken: ref.watch(sessionProvider).accessToken!)
                    : WeeklyTabmenu(selectedDate: selectedDate, jwtToken: ref.watch(sessionProvider).accessToken!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final isMonthlyViewProvider = StateProvider<bool>((ref) => true);
