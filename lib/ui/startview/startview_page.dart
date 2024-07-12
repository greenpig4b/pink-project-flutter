import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/main_page.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_sign_up_and_find_password.dart';

import 'components/startview_login_button.dart';
import 'components/startview_logo.dart';
import 'components/startview_ouath.dart';
import 'components/startview_sign_in.dart';


class StartviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            StartviewLogo(), // 수정된 위젯 이름 사용
            StartviewSignIn(),
            StartviewOuath(),
            StartviewLoginButton(
                text: "로그인",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()), // 새로운 페이지로 네비게이트
                );
              },
            ),
            StartviewSignUpAndFindPassword(),
          ],
        ),
      ),
    );
  }
}
