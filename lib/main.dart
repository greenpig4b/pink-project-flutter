import 'package:flutter/material.dart';
import 'package:pink_project_flutter/ui/common/components/custom_bottom_navigation_bar.dart';

import 'package:pink_project_flutter/ui/main/chart/chart_page.dart';
import 'package:pink_project_flutter/ui/main/history/history_page.dart';
import 'package:pink_project_flutter/ui/main/result/result_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ChartPage(),
    HistoryPage(),
    ResultPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
