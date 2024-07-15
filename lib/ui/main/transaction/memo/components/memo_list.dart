import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_edit.dart';
import 'memo_provider.dart';

class MemoList extends ConsumerWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoList = ref.watch(memoListProvider);

    if (memoList.isEmpty) {
      return Center(
        child: Text(
          '메모를 작성 해주세요.',
          style: TextStyle(fontSize: 18, color: Colors.black45),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: memoList.length,
            itemBuilder: (context, index) {
              final memo = memoList[index];
              String formattedDate = DateFormat('MM.dd').format(memo.createdDate); // MM.dd 형식으로 날짜 형식화

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
                          formattedDate, // 형식화된 날짜 사용
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            ref.read(titleProvider.notifier).state = memo.title;
                            ref.read(contentProvider.notifier).state = memo.content;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MemoEdit(
                                  memo: memo,
                                  date: formattedDate, // 형식화된 날짜 사용
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
