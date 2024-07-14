import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_login_button.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_ouath.dart';
import '../../main/main_page.dart';
import 'custom_text_form_field.dart';
import 'startview_form.dart';

class StartviewSignIn extends StatelessWidget {
  const StartviewSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); //1 . 글로벌 key

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Form(
            // 2. 글로벌 key를 Form 태그에 연결해서 해당 Key로 Form의 상태를 관리할 수 있다
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  text: 'Email',
                ),
                CustomTextFormField(
                  text: 'Password',
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
