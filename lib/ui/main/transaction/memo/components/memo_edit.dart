import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/memo/components/memo_write_app_bar.dart';

class MemoEdit extends StatelessWidget {
  final Map<String, String> memo;
  final String date;

  MemoEdit({Key? key, required this.memo, required this.date}) : super(key: key);
  final FocusNode _titleFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
    });
    TextEditingController _titleController = TextEditingController(text: memo['title']);
    TextEditingController _commentController = TextEditingController(text: memo['comment']);

    return Scaffold(
      appBar: MemoWriteAppBar(title: date),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              focusNode: _titleFocusNode,
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
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
