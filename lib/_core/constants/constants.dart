import 'package:flutter/material.dart';

// 청록색
const kAccentColor1 = Color(0xFFC588F2);
// 진한 녹색
const kAccentColor2 = Color(0xffeea4ce);
// 물 색
const kAccentColor3 = Color(0xFF92A3FD);

const kAccentColor4 = Color(0xFF9DCEFF);

class TColor {
  static Color get primaryColor1 => const Color(0xff92A3FD);

  static Color get primaryColor2 => const Color(0xff9DCEFF);

  static Color get secondaryColor1 => const Color(0xffC58BF2);

  static Color get secondaryColor2 => const Color(0xffEEA4CE);


  static List<Color> get primaryG => [ primaryColor2, primaryColor1];

  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);

  static Color get grey => const Color(0xff786F72);

  static Color get white => Colors.white;

  static Color get lightGrey => const Color(0xffF7F8F8);

}