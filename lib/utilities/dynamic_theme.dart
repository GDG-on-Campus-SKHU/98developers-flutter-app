import 'package:flutter/material.dart';
import 'package:zikiza/utilities/palette.dart';

/** 
 * Dynamic color 사용을 위한 테마 관리 클래스 
 - ColorScheme은 null일 수 있어요
 - ColorScheme은 Android S+ (sdk 30) 이상부터 지원해요
*/
class DynamicTheme {
  //Light mode theme data
  static ThemeData lightTheme(ColorScheme? lightColorScheme) {
    ColorScheme _defaultLightColorScheme = lightColorScheme ??
        ColorScheme.fromSeed(
          seedColor: Palette.sapphire,
          brightness: Brightness.light,
        );
    return ThemeData(
      colorScheme: _defaultLightColorScheme,
      useMaterial3: true,
      fontFamily: "NotoSans",
    );
  }

  //Dark mode theme data
  static ThemeData darkTheme(ColorScheme? darkColorScheme) {
    ColorScheme _defaultDarkColorScheme = darkColorScheme ??
        ColorScheme.fromSeed(
          seedColor: Palette.sapphire,
          brightness: Brightness.dark,
        );
    return ThemeData(
      colorScheme: _defaultDarkColorScheme,
      useMaterial3: true,
      fontFamily: "NotoSans",
    );
  }
}
