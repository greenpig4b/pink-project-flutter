import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pinkpig_project_flutter/data/store/session_store.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/startview_social_button.dart';

class StartviewOuath extends ConsumerWidget {
  const StartviewOuath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 15),
        Stack(
          alignment: Alignment.center,
          children: [
            Divider(
              color: Colors.grey, // 구분선 색상
              thickness: 1, // 구분선 두께
              indent: 20, // 구분선 시작 여백
              endIndent: 20, // 구분선 끝 여백
            ),
            Container(
              color: Colors.white, // 텍스트 뒤에 배경 색상 추가
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "sns 계정으로 간편하게 로그인",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StartviewSocialButton(
                assetName: 'assets/images/kakao.png', // kakao 로고 경로
                onPressed: () async {
                  try {
                    OAuthToken token =
                        await UserApi.instance.loginWithKakaoTalk();
                    print('카카오톡으로 로그인 성공 ${token.accessToken}');
                    ref.read(sessionProvider).kakaoLogin(token.accessToken);
                  } catch (error) {
                    print('카카오톡으로 로그인 실패 $error');
                    if (error is PlatformException &&
                        error.code == 'Error' &&
                        error.message ==
                            'KakaoTalk is not installed. If you want KakaoTalk Login, please install KakaoTalk') {
                      try {
                        OAuthToken token =
                            await UserApi.instance.loginWithKakaoAccount();
                        print('카카오계정으로 로그인 성공 ${token.accessToken}');
                        ref.read(sessionProvider).kakaoLogin(token.accessToken);
                      } catch (error) {
                        print('카카오계정으로 로그인 실패 $error');
                      }
                    }
                  }
                }),
            SizedBox(width: 20),
            StartviewSocialButton(
              assetName: 'assets/images/naver.png', // naver 로고 경로
              onPressed: () async {
                  try {
                    // 1. 로그인 (토큰 가져오기)
                    await FlutterNaverLogin.logIn(); // 네이버 로그인 시도
                    NaverAccessToken token =
                        await FlutterNaverLogin.currentAccessToken; // 토큰 가져오기

                    print('네이버계정으로 로그인 성공 ${token.accessToken}');
                    ref.read(sessionProvider).naverLogin(token.accessToken);

                  } catch (error) {
                    print('네이버계정으로 로그인 실패 $error');
                  }
                }

            ),
          ],
        ),
      ],
    );
  }
}
