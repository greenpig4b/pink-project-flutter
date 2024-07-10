import 'package:flutter/material.dart';

class MemoEdit extends StatelessWidget {
  final Map<String, String> memo;

  const MemoEdit({Key? key, required this.memo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController(text: memo['title']);
    TextEditingController _commentController = TextEditingController(text: memo['comment']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Memo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Comment'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save edited memo here
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
