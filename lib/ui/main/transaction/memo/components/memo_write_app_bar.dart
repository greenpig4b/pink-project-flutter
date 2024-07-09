import 'package:flutter/material.dart';

class MemoWriteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MemoWriteAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title, // 포맷팅된 날짜를 제목으로 설정
        style: TextStyle(
          color: Colors.white, // 글자 색상을 흰색으로 설정
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color(0xFFFC7C9A),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.save, color: Colors.white),
          onPressed: () {
            // Implement your onPressed function here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}