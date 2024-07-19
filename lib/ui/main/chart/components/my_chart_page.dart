import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/chart/components/weekly/weekly_tabmenu.dart';
import '../../../../data/store/session_store.dart';
import 'month/month_tabmenu.dart';

import '../viewmodel/chart_list_viewmodel.dart';
import 'appbar/custom_appbar.dart';

class MyChartPage extends ConsumerStatefulWidget {
  MyChartPage({Key? key}) : super(key: key);

  @override
  _MyChartPageState createState() => _MyChartPageState();
}

class _MyChartPageState extends ConsumerState<MyChartPage> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final selectedDate = ref.read(selectedDateProvider);
    final isMonthlyView = ref.read(isMonthlyViewProvider);
    final jwtToken = ref.read(sessionProvider).accessToken!;
    if (isMonthlyView) {
      await ref.read(chartListProvider('monthly').notifier).notifyInitMonthly(jwtToken, selectedDate.year, selectedDate.month);
    } else {
      final startDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(selectedDate.subtract(Duration(days: selectedDate.weekday - 1)));
      final endDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(selectedDate.add(Duration(days: 7 - selectedDate.weekday - 1)));
      await ref.read(chartListProvider('weekly').notifier).notifyInitWeekly(jwtToken, selectedDate.year, selectedDate.month, startDate, endDate);
    }
  }

  void _nextPeriod(BuildContext context) {
    ref.read(selectedDateProvider.notifier).update((state) {
      DateTime newDate;
      if (ref.read(isMonthlyViewProvider)) {
        newDate = DateTime(state.year, state.month + 1, 1);
      } else {
        newDate = state.add(Duration(days: 7));
      }
      return newDate; // 반환값으로 새로운 날짜를 설정합니다.
    });
    _initializeData(); // 날짜가 업데이트된 후에 데이터를 다시 가져옵니다.
  }

  void _previousPeriod(BuildContext context) {
    ref.read(selectedDateProvider.notifier).update((state) {
      DateTime newDate;
      if (ref.read(isMonthlyViewProvider)) {
        newDate = DateTime(state.year, state.month - 1, 1);
      } else {
        newDate = state.subtract(Duration(days: 7));
      }
      return newDate; // 반환값으로 새로운 날짜를 설정합니다.
    });
    _initializeData(); // 날짜가 업데이트된 후에 데이터를 다시 가져옵니다.
  }

  void _toggleView(bool isMonthly) {
    ref.read(isMonthlyViewProvider.notifier).state = isMonthly;
    _initializeData(); // 뷰 모드를 변경한 후에 데이터를 다시 가져옵니다.
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);
    final isMonthlyView = ref.watch(isMonthlyViewProvider);
    final chartDataState = ref.watch(chartListProvider(isMonthlyView ? 'monthly' : 'weekly'));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: chartDataState.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (_) => Column(
            children: [
              CustomAppBar(
                title: isMonthlyView
                    ? '${selectedDate.year}년 ${selectedDate.month}월'
                    : '${DateFormat('M.d').format(selectedDate.subtract(Duration(days: selectedDate.weekday - 1)))} ~ ${DateFormat('M.d').format(selectedDate.add(Duration(days: 7 - selectedDate.weekday - 1)))}',
                onNextPeriod: () => _nextPeriod(context),
                onPreviousPeriod: () => _previousPeriod(context),
                onMonthlyView: () => _toggleView(true),
                onWeeklyView: () => _toggleView(false),
                isMonthlyView: isMonthlyView,
              ),
              Expanded(
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! < 0) {
                      _nextPeriod(context);
                    } else if (details.primaryVelocity! > 0) {
                      _previousPeriod(context);
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
      ),
    );
  }
}

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final isMonthlyViewProvider = StateProvider<bool>((ref) => true);
