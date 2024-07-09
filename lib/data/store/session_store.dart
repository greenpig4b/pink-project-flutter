import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../models/user.dart';

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

}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore(ref);
});
