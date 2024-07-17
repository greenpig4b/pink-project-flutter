import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/store/session_store.dart';
import 'month_tabmenu.dart';
import 'weekly_tabmenu.dart';
import '../viewmodel/chart_list_viewmodel.dart';


class MyChartPage extends ConsumerStatefulWidget {
  MyChartPage({Key? key}) : super(key: key);

  @override
  _MyChartPageState createState() => _MyChartPageState();
}

class _MyChartPageState extends ConsumerState<MyChartPage> {
  DateTime _selectedDate = DateTime.now();
  bool _isMonthlyView = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchChartData()); // Use addPostFrameCallback
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    });
    _fetchChartData();
  }

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
    });
    _fetchChartData();
  }

  void _toggleView(bool isMonthly) {
    setState(() {
      _isMonthlyView = isMonthly;
    });
    _fetchChartData();
  }

  Future<void> _fetchChartData() async {
    final selectedDateString = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-01';
    final chartListViewmodel = ref.read(chartListProvider(selectedDateString).notifier);
    final jwtToken = ref.read(sessionProvider).accessToken!;
    print("Fetching chart data for $selectedDateString"); // Add this line
    await chartListViewmodel.notifyInit(selectedDateString, jwtToken, _isMonthlyView);
  }


  @override
  Widget build(BuildContext context) {
    final selectedDateString = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-01';
    final jwtToken = ref.watch(sessionProvider).accessToken!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                _nextMonth();
              } else if (details.primaryVelocity! > 0) {
                _previousMonth();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: _previousMonth,
                ),
                Text(
                  '${_selectedDate.year}년 ${_selectedDate.month}월',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFFC7C9A),
          actions: [
            TextButton(
              onPressed: () => _toggleView(true),
              child: Text(
                '월간',
                style: TextStyle(
                  color: _isMonthlyView ? Colors.white : Colors.white70,
                  fontWeight: _isMonthlyView ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () => _toggleView(false),
              child: Text(
                '주간',
                style: TextStyle(
                  color: !_isMonthlyView ? Colors.white : Colors.white70,
                  fontWeight: !_isMonthlyView ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: '수입'),
              Tab(text: '지출'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 4.0),
              insets: EdgeInsets.zero,
            ),
            indicatorPadding: EdgeInsets.zero,
          ),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              _nextMonth();
            } else if (details.primaryVelocity! > 0) {
              _previousMonth();
            }
          },
          child: _isMonthlyView
              ? MonthTabmenu(selectedDate: _selectedDate, jwtToken: jwtToken)
              : WeeklyTabmenu(selectedDate: _selectedDate, jwtToken: jwtToken),
        ),
      ),
    );
  }
}
