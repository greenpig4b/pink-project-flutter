import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'expense_section.dart';
import 'income_section.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool isWeeklyActive = true;
  DateTime _selectedDate = DateTime.now();
  late TabController _tabController;
  bool _mounted = true;
  int touchedIndex = -1;

  void _nextMonth() {
    if (_mounted) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
        _tabController.animateTo(0);
      });
    }
  }

  void _previousMonth() {
    if (_mounted) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
        _tabController.animateTo(0);
      });
    }
  }

  void _onIncomeTap() {
    print('수입 탭 클릭됨');
  }

  void _onExpenseTap() {
    print('지출 탭 클릭됨');
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _mounted = false;
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
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
                  icon: Icon(Icons.arrow_forward, color: Colors.white,),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFFC7C9A),
          actions: [
            TextButton(
              onPressed: () {
                if (_mounted) {
                  setState(() {
                    isWeeklyActive = true;
                  });
                }
              },
              child: Text(
                '주간',
                style: TextStyle(
                  color: isWeeklyActive ? Colors.white : Colors.white70,
                  fontWeight: isWeeklyActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_mounted) {
                  setState(() {
                    isWeeklyActive = false;
                  });
                }
              },
              child: Text(
                '월간',
                style: TextStyle(
                  color: !isWeeklyActive ? Colors.white : Colors.white70,
                  fontWeight: !isWeeklyActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            onTap: (index) {
              if (index == 0) {
                _onIncomeTap();
              } else if (index == 1) {
                _onExpenseTap();
              }
            },
            tabs: [
              Tab(text: '수입 7,000원'),
              Tab(text: '지출 7,582원'),
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
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              IncomeSection(touchedIndex: touchedIndex, onTouch: (index) {
                setState(() {
                  touchedIndex = index;
                });
              }),
              ExpenseSection(touchedIndex: touchedIndex, onTouch: (index) {
                setState(() {
                  touchedIndex = index;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
