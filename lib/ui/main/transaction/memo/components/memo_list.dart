import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_edit.dart';
import '../data/memo_provider.dart';
import '../viewmodel/memo_list_viewmodel.dart';

class MemoList extends ConsumerWidget {
  final MemoListModel? model;

  const MemoList({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyMemoList = model?.dailyMemoListDTO ?? [];

    if (dailyMemoList.isEmpty) {
      return Center(
        child: Text(
          '메모를 작성 해주세요.',
          style: TextStyle(fontSize: 18, color: Colors.black45),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: dailyMemoList.length,
        itemBuilder: (context, index) {
          final dailyMemo = dailyMemoList[index];
          String formattedDate =
          DateFormat('MM.dd').format(DateTime.parse(dailyMemo.date));

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
                      formattedDate,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    ...(dailyMemo.dailyMemo).map((memo) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(titleProvider.notifier).state = memo.title;
                          ref.read(contentProvider.notifier).state = memo.content;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MemoEdit(
                                memoId: memo.id,
                                title: memo.title,
                                content: memo.content,
                                memoDate: dailyMemo.date,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                memo.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(memo.content),
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
}
