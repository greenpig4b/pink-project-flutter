import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/startview/components/register_page.dart';

import '../../ui/startview/components/startview_sign_in.dart';
import '../../ui/startview/startview_page.dart';

class Move {
  static String loginPage = "/login";
  static String joinPage = "/join";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) =>  StartviewPage(),
    Move.joinPage: (context) => RegisterPage(),
  };
}
