import 'package:flutter/material.dart';

import 'components/memo_detail.dart';

class HistoryMemoPage extends StatelessWidget {
  const HistoryMemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MemoDetail(),
    );
  }
}
