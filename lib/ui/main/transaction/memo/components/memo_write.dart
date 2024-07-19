import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../data/dtos/memo/memo_request.dart';
import '../../../../../data/store/session_store.dart';
import '../data/memo_provider.dart'; // 이 곳에 있는 메모 프로바이더를 이용해야 함
import 'memo_write_app_bar.dart';

class MemoWrite extends ConsumerWidget {
  MemoWrite({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  late DateTime _selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _selectedDate = ref.watch(selectedDateProvider);
    final userId = ref.watch(sessionProvider).user?.id;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MemoWriteAppBar(
        title: "메모",
        onSave: () {
          MemoSaveDTO memoSaveDTO = MemoSaveDTO(
            userId: userId!,
            title: _titleController.text,
            content: _contentController.text,
            createdDate: _selectedDate,
          );
          ref.read(memoSaveViewmodelProvider.notifier).saveMemo(context, memoSaveDTO).then((_) {
            // 메모 저장 후 메모 목록 페이지를 새로 고침합니다.
            Navigator.of(context).pop(true); // true를 반환하여 메모 목록 페이지에서 새로 고침을 트리거합니다.
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      ref.read(selectedDateProvider.notifier).updateDate(pickedDate);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.black,),
                      SizedBox(width: 8),
                      Text(
                        DateFormat('MM월 dd일 (E)', 'ko_KR').format(_selectedDate),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '제목을 입력하세요.',
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
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: '내용을 입력하세요.',
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
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
