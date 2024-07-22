import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/memo_list_viewmodel.dart';
import 'memo_list.dart';
import 'memo_write_button.dart';

class MemoMain extends ConsumerWidget {
  final MemoListModel? model;

  const MemoMain({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        MemoList(model: model),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: MemoWriteButton(),
        ),
      ],
    );
  }
}
