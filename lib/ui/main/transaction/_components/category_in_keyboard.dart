import 'package:flutter/material.dart';

class CategoryInKeyboard extends StatelessWidget {
  final TextEditingController controller;

  CategoryInKeyboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.count(
        crossAxisCount: 5,
        children: [
          _buildKeyboardButton(context, '💰︎', '월급'),
          _buildKeyboardButton(context, '💵', '부수입'),
          _buildKeyboardButton(context, '🤑', '용돈'),
          _buildKeyboardButton(context, '🏅', '상여'),
          _buildKeyboardButton(context, '🏦', '금융소득'),
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
