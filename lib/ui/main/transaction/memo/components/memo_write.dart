import 'dart:ui';

import 'package:flutter/material.dart';

class MemoWrite extends StatelessWidget {
  const MemoWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('07월 08일 (월)'),
        backgroundColor: Color(0xFFFC7C9A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: '제목을 입력하세요.'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: '내용을 입력하세요.'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
