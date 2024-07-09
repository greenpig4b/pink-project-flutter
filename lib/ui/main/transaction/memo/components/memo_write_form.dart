import 'package:flutter/material.dart';

class MemoWriteForm extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // 위젯이 빌드된 후에 제목 입력 필드에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
    });
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            focusNode: _titleFocusNode,
            decoration: InputDecoration(
              labelText: '제목을 입력하세요.',
              labelStyle: TextStyle(color: Color(0xFFFC7C9A)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFF9F9F9)), // 기본 보더 색상
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFF9F9F9)), // 기본 보더 색상
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFFC7C9A)), // 기본 보더 색상
              ),
              prefixIcon: Icon(Icons.title, color: Color(0xFFFC7C9A)),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: '내용을 입력하세요.',
              labelStyle: TextStyle(color: Color(0xFFFC7C9A)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFF9F9F9)), // 기본 보더 색상
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFF9F9F9)), // 기본 보더 색상
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFFC7C9A)), // 기본 보더 색상
              ),
              prefixIcon: Icon(Icons.comment, color: Color(0xFFFC7C9A)),
            ),
            maxLines: 5,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
