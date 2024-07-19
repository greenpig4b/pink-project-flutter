import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/store/session_store.dart';
import '../../../../../data/dtos/memo/memo_request.dart';
import '../data/memo_provider.dart';
import 'memo_write_app_bar.dart';

class MemoEdit extends ConsumerWidget {
  final int memoId;
  final String title;
  final String content;
  final String memoDate;

  MemoEdit({
    required this.memoId,
    required this.title,
    required this.content,
    required this.memoDate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _titleController = TextEditingController(text: title);
    TextEditingController _commentController = TextEditingController(text: content);

    final userId = ref.watch(sessionProvider).user?.id;

    return Scaffold(
      appBar: MemoWriteAppBar(
        title: memoDate, // 앱바 타이틀에 날짜 표시
        onSave: () {
          if (userId == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("사용자 정보가 없습니다.")),
            );
            return;
          }
          MemoUpdateDTO memoEditDTO = MemoUpdateDTO(
            id: memoId,
            userId: userId,
            title: _titleController.text,
            content: _commentController.text,
          );
          ref.read(memoUpdateViewmodelProvider.notifier).updateMemo(context, memoEditDTO).then((_) {
            Navigator.of(context).pop(true); // 메모 수정 후 목록 새로 고침을 위해 true 반환
          });
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
