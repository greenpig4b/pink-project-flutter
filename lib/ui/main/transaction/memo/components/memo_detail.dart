import 'package:flutter/material.dart';

import 'memo_list.dart';
import 'memo_write_button.dart';


List<Map<String, dynamic>> recordList = [];

class MemoDetail extends StatelessWidget {
  const MemoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MemoList(),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: MemoWriteButton(),
        ),
      ],
    );
  }
}