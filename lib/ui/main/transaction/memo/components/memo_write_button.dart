import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/memo_list_viewmodel.dart';
import 'memo_write.dart';

class MemoWriteButton extends ConsumerWidget {

  const MemoWriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
