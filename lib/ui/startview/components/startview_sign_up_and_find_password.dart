import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/register_page.dart';

import 'find_password_page.dart';

class StartviewSignUpAndFindPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20), // SNS 버튼과 로그인 버튼 사이 간격
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '회원가입',
                        style: TextStyle(
                            color: Color(0xFFFFBDCE),
                            fontWeight: FontWeight.bold
                        ), // 회원가입에 대한 색상
                      ),
                      TextSpan(
                        text: ' 및 ',
                        style: TextStyle(color: Colors.grey), // 기본 텍스트 색상
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _showModalBottomSheet(context, '/findPassword');
                },
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: '패스워드',
                            style: TextStyle(
                                color: Color(0xFFFFBDCE),
                                fontWeight: FontWeight.bold
                            )
                        ),
                        TextSpan(
                          text: '찾기',
                          style: TextStyle(color: Colors.grey),
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, String route) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 페이지 높이를 조정할 수 있도록 함
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9, // 전체 화면 높이의 90% 차지
          child: Navigator(
            onGenerateRoute: (settings) {
              Widget page;
             if (settings.name == '/findPassword') {
                page = FindPasswordPage();
              } else {
                page = Scaffold(
                  body: Center(
                    child: Text('Page not found'),
                  ),
                );
              }
              return MaterialPageRoute(builder: (context) => page);
            },
            initialRoute: route,
          ),
        );
      },
    );
  }
}

