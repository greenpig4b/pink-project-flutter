import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/startview_page.dart';

class StartviewSignUpButton extends StatelessWidget {
  final String text;

  const StartviewSignUpButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity, // 너비를 100%로 설정
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // 그림자 색상 및 투명도
            spreadRadius: 2, // 그림자 퍼짐 정도
            blurRadius: 5, // 그림자 흐림 정도
            offset: Offset(0, 4), // 그림자 위치
          ),
        ],
        borderRadius: BorderRadius.circular(50), // 둥근 테두리
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => StartviewPage()),
                (Route<dynamic> route) => false,
          );
        },
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
      ),
    );
  }
}
