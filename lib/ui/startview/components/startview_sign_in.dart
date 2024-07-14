import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_login_button.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_ouath.dart';
import '../../../data/dtos/user/user_request.dart';
import '../../../data/store/session_store.dart';

class StartviewSignIn extends ConsumerWidget {
  const StartviewSignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final _email = TextEditingController(text: "ssar@kakao.com");
    final _password = TextEditingController(text: "1234");

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // 배경색 설정
                        borderRadius: BorderRadius.circular(50), // 둥근 테두리
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4), // 그림자 색상 및 투명도
                            spreadRadius: 2, // 그림자 퍼짐 정도
                            blurRadius: 5, // 그림자 흐림 정도
                            offset: Offset(0, 3), // 그림자 위치
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _email,
                        style: TextStyle(
                          fontSize: 15, // 폰트사이즈
                          color: Colors.black45,
                        ),
                        validator: (value) =>
                        value!.isEmpty ? "Please enter some text" : null,
                        obscureText: "Email" == "Password" ? true : false,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // 배경색 설정
                        borderRadius: BorderRadius.circular(50), // 둥근 테두리
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4), // 그림자 색상 및 투명도
                            spreadRadius: 2, // 그림자 퍼짐 정도
                            blurRadius: 5, // 그림자 흐림 정도
                            offset: Offset(0, 3), // 그림자 위치
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _password,
                        style: TextStyle(
                          fontSize: 15, // 폰트사이즈
                          color: Colors.black45,
                        ),
                        validator: (value) =>
                        value!.isEmpty ? "Please enter some text" : null,
                        obscureText: "Password" == "Password" ? true : false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                StartviewOuath(),
                StartviewLoginButton(
                  text: "로그인",
                  onPressed: () {
                    // bool isOk = _formKey.currentState!.validate();
                    //
                    // if (isOk) {
                      String email = _email.text.trim();
                      String password = _password.text.trim();

                      LoginRequestDTO loginRequestDTO =
                      LoginRequestDTO(email, password);

                      SessionStore store = ref.read(sessionProvider);

                      store.login(loginRequestDTO);
                    }
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
