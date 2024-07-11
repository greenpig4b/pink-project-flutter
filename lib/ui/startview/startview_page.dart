import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/main_page.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/transaction_daily_page.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/transaction_page.dart';
import 'package:pinkpig_project_flutter/ui/startview/widgets/startview_login_button.dart';
import 'package:pinkpig_project_flutter/ui/startview/widgets/startview_ouath.dart';
import 'widgets/startview_logo.dart';
import 'widgets/startview_sign_in.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
