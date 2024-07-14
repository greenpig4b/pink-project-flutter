import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_sign_up_and_find_password.dart';

import 'components/startview_logo.dart';
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
            StartviewSignUpAndFindPassword(),
          ],
        ),
      ),
    );
  }
}
