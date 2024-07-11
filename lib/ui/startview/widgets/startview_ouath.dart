import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/widgets/startview_social_button.dart';

class StartviewOuath extends StatelessWidget {
  const StartviewOuath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "sns 계정으로 간편하게 로그인",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StartviewSocialButton(
              assetName: 'assets/images/kakao.png', // kakao 로고 경로
              onPressed: () {
                // Google 로그인 로직
              },
            ),
            SizedBox(width: 20),
            StartviewSocialButton(
              assetName: 'assets/images/naver.png', // naver 로고 경로
              onPressed: () {
                // Facebook 로그인 로직
              },
            ),
          ],
        ),
      ],
    );
  }
}
