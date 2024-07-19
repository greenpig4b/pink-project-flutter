import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_app_bar.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body_top.dart';
import 'package:pinkpig_project_flutter/ui/main/result/viewmodel/result_list_view_model.dart';
import 'package:pinkpig_project_flutter/ui/main/result/viewmodel/calendar_view_model.dart';

class ResultPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarProvider);
    final model = ref.watch(resultListProvider(selectedDate.toIso8601String()));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResultAppBar(),
      body: Column(
        children: [
          ResultBodyTop(model: model),
          ResultBody(model: model),
        ],
      ),
    );
  }
}
