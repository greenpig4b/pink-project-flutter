import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/result_page.dart';

import '../components/custom_bottom_navigation_bar.dart';
import 'chart/chart_page.dart';
import 'history/_components/daily_list_appbar.dart';
import 'history/history_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DailyListAppbar(title: "가계부"), // CustomAppBar 사용
      body: IndexedStack(
        index: _selectedIndex,
        children:  [
          HistoryPage(),
          ChartPage(),
          ResultPage()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
