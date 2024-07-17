import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/data/dtos/user/user_request.dart';

import '../../../data/store/session_store.dart';
import '../startview_page.dart';

class RegisterPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('회원가입'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                          borderSide: BorderSide(
                              color: Color(0xFFFC7C9A)), // 포커스 시 밑줄 색상
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        backgroundColor: Colors.white,
                        // 배경색
                        foregroundColor: Color(0xFFFC7C9A),
                        // 글자색
                        side: BorderSide(color: Color(0xFFFC7C9A)),
                        // 테두리색
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
                    borderSide:
                        BorderSide(color: Color(0xFFFC7C9A)), // 포커스 시 밑줄 색상
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
                          borderSide: BorderSide(
                              color: Color(0xFFFC7C9A)), // 포커스 시 밑줄 색상
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        backgroundColor: Colors.white,
                        // 배경색
                        foregroundColor: Color(0xFFFC7C9A),
                        // 글자색
                        side: BorderSide(color: Color(0xFFFC7C9A)),
                        // 테두리색
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
              Container(
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
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    JoinRequestDTO joinRequest = JoinRequestDTO(email, password);
                    SessionStore store = ref.read(sessionProvider);

                    store.join(joinRequest);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffc7c9a), // 버튼 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // 둥근 테두리
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // 버튼 내부 여백
                  ),
                  child: Text(
                    "회원가입",
                    style: TextStyle(
                      fontSize: 18, // 폰트 크기
                      color: Colors.white, // 텍스트 색상
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
