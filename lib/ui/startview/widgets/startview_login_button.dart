import 'package:flutter/material.dart';

class StartviewLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const StartviewLoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xfffc7c9a), // 버튼 배경색
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // 둥근 테두리
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 버튼 내부 여백
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18, // 폰트 크기
          color: Colors.white, // 텍스트 색상
        ),
      ),
    );
  }
}
