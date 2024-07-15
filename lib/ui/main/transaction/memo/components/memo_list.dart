import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_edit.dart';
import '../../_components/calender_widget.dart';
import 'memo_provider.dart';

class MemoList extends ConsumerWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(calendarProvider);
    final memoListModel = ref.watch(MemoListProvider());

    if (memoListModel == null || memoListModel.memoList.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    // 선택된 달의 데이터 필터링
    final filteredTransactions = memoListModel.memoList.where((transaction) {
      final transactionDate = DateTime.parse(transaction['date']);
      return transactionDate.month == selectedMonth.month &&
          transactionDate.year == selectedMonth.year;
    }).toList();

    return ListView.builder(
      itemCount: filteredTransactions.length,
      itemBuilder: (context, index) {
        final transaction = filteredTransactions[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction['date'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  ...transaction['memo'].map<Widget>((memo) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(titleProvider.notifier).state = memo['title'];
                        ref.read(contentProvider.notifier).state = memo['comment'];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MemoEdit(memo: memo, date: transaction['date']),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              memo['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(memo['comment']),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
