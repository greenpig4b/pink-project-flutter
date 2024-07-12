import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class StartviewForm extends StatefulWidget {
  @override
  _StartviewFormState createState() => _StartviewFormState();
}

class _StartviewFormState extends State<StartviewForm> {
  final _formKey = GlobalKey<FormState>(); //1 . 글로벌 key

  // FocusNodes를 선언하고 초기화합니다.
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode buttonFocusNode = FocusNode();

  @override
  void dispose() {
    // 사용한 FocusNode를 해제합니다.
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결해서 해당 Key로 Form의 상태를 관리할 수 있다
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: 'Email',
            focusNode: emailFocusNode,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),

          CustomTextFormField(
            text: 'Password',
            focusNode: passwordFocusNode,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(buttonFocusNode);
            },
          ),
        ],
      ),
    );
  }
}
