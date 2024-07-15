import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'memo_write_app_bar.dart';
import '../data/memo_provider.dart';

class MemoWrite extends ConsumerWidget {
  MemoWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _titleFocusNode = FocusNode();
    var selectedDate = ref.watch(selectedDateProvider);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MemoWriteAppBar(title: "메모"),
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
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      ref
                          .read(selectedDateProvider.notifier)
                          .updateDate(pickedDate);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.black,),
                      SizedBox(width: 8),
                      Text(
                        DateFormat('MM월 dd일 (E)', 'ko_KR').format(selectedDate),
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
              focusNode: _titleFocusNode,
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
              // onChanged: (value) {
              //   // ref.read(titleProvider).state = value;
              // },
            ),
            SizedBox(height: 16),
            TextField(
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
              // onChanged: (value) {
              //   // ref.read(contentProvider).state = value;
              // },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
