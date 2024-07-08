import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFFFC7C9A),
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
            label: "기록",icon: Icon(FontAwesomeIcons.book)),
        BottomNavigationBarItem(
            label: "통계", icon: Icon(FontAwesomeIcons.chartBar)),
        BottomNavigationBarItem(
            label: "결산", icon: Icon(FontAwesomeIcons.coins)),
      ],
    );
  }
}