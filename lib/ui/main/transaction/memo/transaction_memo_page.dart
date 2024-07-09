import 'package:flutter/material.dart';

import 'components/memo_detail.dart';

class TransactionMemoPage extends StatelessWidget {
  const TransactionMemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MemoDetail(),
    );
  }
}
