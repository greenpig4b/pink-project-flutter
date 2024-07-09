import 'package:flutter/material.dart';

import 'memo_write.dart';

class MemoWriteButton extends StatelessWidget {
  const MemoWriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemoWrite()),
        );
      },
      child: Icon(Icons.add, color: Colors.white,),
      backgroundColor: Color(0xFFFC7C9A),
    );
  }
}
