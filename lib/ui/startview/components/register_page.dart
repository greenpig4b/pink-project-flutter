import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_login_button.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_sign_up_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Color(0xFFFC7C9A),
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: '아이디(이메일)',
                        hintText: '이메일 주소',
                        floatingLabelStyle: TextStyle(color: Color(0xFFFC7C9A)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFC7C9A)), // 포커스 시 밑줄 색상
                        ),
                      ),

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19),
                    height: 40, // 버튼 높이
                    child: ElevatedButton(
                      onPressed: () {
                        // 중복확인 로직
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20 ,0),
                        backgroundColor: Colors.white, // 배경색
                        foregroundColor: Color(0xFFFC7C9A), // 글자색
                        side: BorderSide(color: Color(0xFFFC7C9A)), // 테두리색
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: Text('중복확인'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Color(0xFFFC7C9A),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력하세요',
                  floatingLabelStyle: TextStyle(color: Color(0xFFFC7C9A)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFC7C9A)), // 포커스 시 밑줄 색상
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Color(0xFFFC7C9A),
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: '비밀번호 확인',
                        hintText: '비밀번호를 확인해주세요.',
                        floatingLabelStyle: TextStyle(color: Color(0xFFFC7C9A)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFC7C9A)), // 포커스 시 밑줄 색상
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19),
                    height: 40, // 버튼 높이
                    child: ElevatedButton(
                      onPressed: () {
                        // 중복확인 로직
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20 ,0),
                        backgroundColor: Colors.white, // 배경색
                        foregroundColor: Color(0xFFFC7C9A), // 글자색
                        side: BorderSide(color: Color(0xFFFC7C9A)), // 테두리색
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: Text('중복확인'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              StartviewSignUpButton(text: '회원가입')
            ],
          ),
        ),

      ),
    );
  }
}

