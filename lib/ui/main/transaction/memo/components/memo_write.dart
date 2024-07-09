import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemoWrite extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();

  MemoWrite({super.key});

  @override
  Widget build(BuildContext context) {
    // 현재 날짜를 가져와서 원하는 형식으로 포맷팅
    String formattedDate = DateFormat('MM월 dd일 (E)', 'ko_KR').format(DateTime.now());

    // 위젯이 빌드된 후에 제목 입력 필드에 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate, // 포맷팅된 날짜를 제목으로 설정
          style: TextStyle(
            color: Colors.white, // 글자 색상을 흰색으로 설정
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFC7C9A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Implement your onPressed function here
            },
          ),
        ],
      ),
      body: Padding(
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
      ),
    );
  }
}
