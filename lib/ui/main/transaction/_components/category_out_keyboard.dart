import 'package:flutter/material.dart';

class CategoryOutKeyboard extends StatelessWidget {
  final TextEditingController controller;

  CategoryOutKeyboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.count(
        crossAxisCount: 5,
        children: [
          _buildKeyboardButton(context, '🍕', '식비'),
          _buildKeyboardButton(context, '🚗', '교통/차량'),
          _buildKeyboardButton(context, '🎬', '문화생활'),
          _buildKeyboardButton(context, '🛒', '마트/편의점'),
          _buildKeyboardButton(context, '👕', '패션/미용'),
          _buildKeyboardButton(context, '🧵', '생활용품'),
          _buildKeyboardButton(context, '🏠', '주거/통신'),
          _buildKeyboardButton(context, '💪🏽', '건강'),
          _buildKeyboardButton(context, '🏫', '교육'),
          _buildKeyboardButton(context, '🎁', '경조사비'),
          _buildKeyboardButton(context, '👨‍👧‍👦', '부모님'),
          _buildKeyboardButton(context, '🎸', '기타'),
        ],
      ),
    );
  }

  Widget _buildKeyboardButton(BuildContext context, String icon, String text) {
    return GestureDetector(
      onTap: () {
        controller.text = '$icon $text';
        Navigator.pop(context); // 팝업 닫기
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          // margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            // border: Border.all(color: Color(0xFFE6E6E6)),
            borderRadius: BorderRadius.circular(7) ,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  icon,
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
