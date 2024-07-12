import 'package:flutter/material.dart';

import '../../daily/transaction_write_page.dart';

class MemoButton extends StatelessWidget {
  const MemoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TransactionWritePage()),
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Color(0xFFFF6254),
      shape: CircleBorder(),
    );
  }
}