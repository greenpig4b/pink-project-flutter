import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_core/constants/http.dart';
import '../../main.dart';
import '../../ui/main/main_page.dart';
import '../dtos/user/user_request.dart';
import '../models/User.dart';
import '../repository/user_repository.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  SessionStore(this.ref);

  Future<void> login(LoginRequestDTO requestDTO) async {
    var (responseDTO, accessToken) =
    await UserRepository().fetchLogin(requestDTO);

    if (responseDTO.status == 200) {
      await secureStorage.write(key: "accessToken", value: accessToken);
      this.user = responseDTO.response;
      this.accessToken = accessToken;
      this.isLogin = true;

      Navigator.push(
        mContext!,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(content: Text("로그인 실패 : ${responseDTO.errorMessage}")));
    }
  }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore(ref);
});
