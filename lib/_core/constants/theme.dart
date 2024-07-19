// lib/theme/theme.dart
import 'package:flutter/material.dart';

import 'constants.dart';


TextTheme textTheme() {
  return TextTheme(
    displayLarge: TextStyle(fontFamily: 'Pretendard', fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w300),
    displayMedium: TextStyle(fontFamily: 'Pretendard', fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontFamily: 'Pretendard', fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w300),
    bodyMedium: TextStyle(fontFamily: 'Pretendard', fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w300),
    titleMedium: TextStyle(fontFamily: 'Pretendard', fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontFamily: 'Pretendard', fontSize: 30.0, color: kAccentColor1, fontWeight: FontWeight.w700),
  );
}

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Pretendard',
    textTheme: textTheme(),
    primarySwatch: Colors.pink,
  );
}
