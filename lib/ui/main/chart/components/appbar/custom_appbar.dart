import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onNextPeriod;
  final VoidCallback onPreviousPeriod;
  final VoidCallback onMonthlyView;
  final VoidCallback onWeeklyView;
  final bool isMonthlyView;

  CustomAppBar({
    required this.title,
    required this.onNextPeriod,
    required this.onPreviousPeriod,
    required this.onMonthlyView,
    required this.onWeeklyView,
    required this.isMonthlyView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFC7C9A),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: onPreviousPeriod,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: onNextPeriod,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: onMonthlyView,
                          child: Text(
                            '월간',
                            style: TextStyle(
                              color: isMonthlyView ? Colors.white : Colors.white70,
                              fontWeight: isMonthlyView ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: onWeeklyView,
                          child: Text(
                            '주간',
                            style: TextStyle(
                              color: !isMonthlyView ? Colors.white : Colors.white70,
                              fontWeight: !isMonthlyView ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          TabBar(
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
        ],
      ),
    );
  }
}
