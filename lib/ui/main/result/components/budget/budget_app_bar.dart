import 'package:flutter/material.dart';

class BudgetAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const BudgetAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFC7C9A),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {
            // + 버튼을 눌렀을 때 동작할 코드 추가
          },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
