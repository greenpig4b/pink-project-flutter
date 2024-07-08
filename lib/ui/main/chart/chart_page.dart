import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//
class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool isWeeklyActive = true; // 주간 버튼이 기본 활성화
  DateTime _selectedDate = DateTime.now();
  late TabController _tabController;
  bool _mounted = true;

  void _nextMonth() {
    if (_mounted) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
        _tabController.animateTo(0); // 수입 탭으로 이동
      });
    }
  }

  void _previousMonth() {
    if (_mounted) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
        _tabController.animateTo(0); // 수입 탭으로 이동
      });
    }
  }

  void _onIncomeTap() {
    print('수입 탭 클릭됨');
    // 여기서 수입 탭 클릭 시 실행할 동작을 정의합니다.
  }

  void _onExpenseTap() {
    print('지출 탭 클릭됨');
    // 여기서 지출 탭 클릭 시 실행할 동작을 정의합니다.
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
      length: 2, // 수입과 지출 두 개의 탭
      child: Scaffold(
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
                    color: Colors.white, // 텍스트 색상
                    fontSize: 18.0, // 텍스트 크기
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white,),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.pink, // AppBar 배경색 설정
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
            labelColor: Colors.white, // 선택된 탭 텍스트 색상
            unselectedLabelColor: Colors.white70, // 선택되지 않은 탭 텍스트 색상
            indicatorSize: TabBarIndicatorSize.tab, // 탭의 전체 넓이를 차지하도록 설정
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 4.0),
              insets: EdgeInsets.zero, // 밑줄이 부모의 전체 넓이를 차지하도록 설정
            ),
            indicatorPadding: EdgeInsets.zero, // 밑줄이 부모의 전체 넓이를 차지하도록 설정
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
            physics: NeverScrollableScrollPhysics(), // 수평 스크롤 비활성화
            children: [
              Center(child: Text('수입 내용')),
              Center(child: Text('지출 내용')),
            ],
          ),
        ),
      ),
    );
  }
}