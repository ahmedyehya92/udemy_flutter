import 'dart:ui';

Color mainColor = Color(0xff5549ad);
enum ThemeAppMode {
  light(0),
  dark(1);

  final int value;

  const ThemeAppMode(this.value);
}