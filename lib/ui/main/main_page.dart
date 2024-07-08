import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/result_page.dart';

import '../components/custom_bottom_navigation_bar.dart';
import 'chart/chart_page.dart';
import 'history/history_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;


  final List<Widget> _widgetOptions = <Widget>[
    HistoryPage(),
    ChartPage(),
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
