import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/memo/memo_request.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/viewmodel/memo_list_viewmodel.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/viewmodel/memo_save_viewmodel.dart';
import '../../../../../data/store/session_store.dart';
import '../viewmodel/memo_update_viewmodel.dart';

// 제목 상태 관리
final titleProvider = StateProvider<String>((ref) => '');

// 내용 상태 관리
final contentProvider = StateProvider<String>((ref) => '');

class SelectedDateNotifier extends StateNotifier<DateTime> {
  SelectedDateNotifier() : super(DateTime.now());

  void updateDate(DateTime newDate) {
    state = newDate;
  }
}

// Providers
final selectedDateProvider = StateNotifierProvider<SelectedDateNotifier, DateTime>((ref) => SelectedDateNotifier());




