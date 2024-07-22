import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pinkpig_project_flutter/ui/startview/startview_page.dart';

import '_core/constants/constants.dart';
import '_core/constants/http.dart';
import '_core/constants/theme.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '60e3f1c0a4ff925636b2eb0d30304234');

  // await initializeDateFormatting('ko', null); // 로케일 데이터 초기화
  // initializeDateFormatting().then((_) => runApp(ProviderScope(MyApp())));
  dio.interceptors.add(interceptor);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: StartviewPage(),
      theme: ThemeData(fontFamily: 'Pretendard2'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'), // 한국어 로케일 지원
      ],
    );
  }
}