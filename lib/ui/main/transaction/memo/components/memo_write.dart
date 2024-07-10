import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_write_form.dart';

import 'memo_write_app_bar.dart';

class MemoWrite extends StatelessWidget {
  MemoWrite({super.key});

  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('MM월 dd일 (E)', 'ko_KR').format(DateTime.now());

    return Scaffold(
      appBar: MemoWriteAppBar(title: formattedDate),
      body: MemoWriteForm(),
    );
  }
}
