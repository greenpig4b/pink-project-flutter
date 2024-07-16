import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_edit.dart';
import '../../../../../data/store/session_store.dart';
import '../../_components/calender_widget.dart';
import '../data/memo_provider.dart';

class MemoList extends ConsumerWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoListState = ref.watch(memoListProvider);
    final dailyMemoList = memoListState?.dailyMemoListDTO ?? [];



    // notifyInit을 한 번만 호출하도록 상태 초기화 여부를 확인합니다.

    if (dailyMemoList.isEmpty) {
      return Center(
        child: Text(
          '메모를 작성 해주세요.',
          style: TextStyle(fontSize: 18, color: Colors.black45),
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
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
                            formattedDate, // 형식화된 날짜 사용
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          ...dailyMemo.dailyMemo.map((memo) {
                            return GestureDetector(
                              onTap: () {
                                ref.read(titleProvider.notifier).state =
                                    memo.title;
                                ref.read(contentProvider.notifier).state =
                                    memo.content;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MemoEdit(
                                      memoId: memo.id,
                                      // 사용자 ID 전달
                                      title: memo.title,
                                      // 선택한 메모의 제목 전달
                                      content: memo.content,
                                      // 선택한 메모의 내용 전달
                                      memoDate: dailyMemo.date, // 선택한 메모의 날짜 전달
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
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
            ),
          ),
        ],
      );
    }
  }
}
