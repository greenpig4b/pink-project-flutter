import 'package:flutter/material.dart';

import 'constants.dart';

TextTheme textTheme() {
  return TextTheme(
    displayLarge: TextStyle(fontFamily: 'Poppins', fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w300),
    displayMedium: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w300),
    bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w300),
    titleMedium: TextStyle(fontFamily: 'Poppins', fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontFamily: 'Poppins', fontSize: 30.0, color: kAccentColor2, fontWeight: FontWeight.w700),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 10,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      ),
    ),
    primarySwatch: Colors.orange,
  );
}
