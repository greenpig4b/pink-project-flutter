import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/memo_main.dart';

class TransactionMemoPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context,  WidgetRef ref) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: MemoMain(),
    );
  }
}