import 'package:flutter/material.dart';

class ResultAppBar extends StatelessWidget {
  DateTime _selectedDate = DateTime.now();
  late TabController _tabController;
  ResultAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    void _nextMonth() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
      _tabController.animateTo(0);
    }

    void _previousMonth() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
      _tabController.animateTo(0);
    }
    return AppBar(
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
    );
  }
}
