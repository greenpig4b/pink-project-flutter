import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/widgets/custom_text_form_field.dart';

class StartviewForm extends StatelessWidget {

  final _formkey = GlobalKey<FormState>(); //1 . 글로벌 key

  @override
  Widget build(BuildContext context) {

    return Form(
      // 2. 글로벌 key를 Form 태그에 연결해서 해당 Key로 Form의 상태를 관리할 수 있다
      key: _formkey,
      child: Column(
        children: [
          Customtextformfield("이메일"),
          SizedBox(
            height: 1,
          ),
          Customtextformfield("패스워드"),
          SizedBox(
            height: 1,
          )
        ],
      ),
    );
  }
}
