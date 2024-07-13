import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_social_button.dart';

class StartviewOuath extends StatelessWidget {
  const StartviewOuath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Stack(
          alignment: Alignment.center,
          children: [
            Divider(
              color: Colors.grey, // 구분선 색상
              thickness: 1, // 구분선 두께
              indent: 20, // 구분선 시작 여백
              endIndent: 20, // 구분선 끝 여백
            ),
            Container(
              color: Colors.white, // 텍스트 뒤에 배경 색상 추가
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "sns 계정으로 간편하게 로그인",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StartviewSocialButton(
              assetName: 'assets/images/kakao.png', // kakao 로고 경로
              onPressed: () {
                // Kakao 로그인 로직
              },
            ),
            SizedBox(width: 20),
            StartviewSocialButton(
              assetName: 'assets/images/naver.png', // naver 로고 경로
              onPressed: () {
                // Naver 로그인 로직
              },
            ),
          ],
        ),
      ],
    );
  }
}