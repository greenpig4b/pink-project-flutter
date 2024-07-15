import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // intl 패키지 추가
import '../data/memo_dummy.dart';
import '../data/memo_provider.dart';
import 'memo_write_app_bar.dart';

class MemoEdit extends ConsumerWidget {
  final Memo memo;

  MemoEdit({required this.memo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _titleController = TextEditingController(text: memo.title);
    TextEditingController _commentController = TextEditingController(text: memo.content);
    String formattedDate = DateFormat('MM.dd').format(memo.createdDate);


    return Scaffold(
      appBar: MemoWriteAppBar(
        title: formattedDate,
        onSave: () {
          MemoUpdateDTO memoEditDTO = MemoUpdateDTO(
            title: _titleController.text,
            content: _commentController.text,
          );
          ref.read(memoSaveViewmodelProvider.notifier).saveMemo(context, memoEditDTO);
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '제목',
                labelStyle: TextStyle(color: Color(0xFF7C7C7C)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF7C7C7C)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF7C7C7C)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF7C7C7C)),
                ),
                prefixIcon: Icon(Icons.title, color: Color(0xFFFC7C9A)),
              ),
              onChanged: (value) {
                // 필요한 경우 상태 업데이트
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: '내용',
                labelStyle: TextStyle(color: Color(0xFF7C7C7C)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF7C7C7C)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF7C7C7C)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF7C7C7C)),
                ),
                prefixIcon: Icon(Icons.comment, color: Color(0xFFFC7C9A)),
              ),
              maxLines: 5,
              onChanged: (value) {
                // 필요한 경우 상태 업데이트
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}