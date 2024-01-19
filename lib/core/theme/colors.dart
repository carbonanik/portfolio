import 'package:flutter/material.dart';

/// random color
// const randomColor1 = Color(0xffFF934F);
const randomColor1 = Color(0xffaf5ae0);
const randomColor2 = Color(0xffd544a2);
const randomColor3 = Color(0xffF7FF58);
const randomColor4 = Color(0xff5E565A);

final randomColor = [
  randomColor1,
  randomColor2,
  randomColor3,
  randomColor4,
];

const randomColor5 = Colors.deepPurpleAccent;
const randomColor6 = Colors.pinkAccent;
const randomColor7 = Colors.lightGreenAccent;
const randomColor8 = Colors.greenAccent;

final randomColors2 = [
  randomColor5,
  randomColor6,
  randomColor7,
  randomColor8,
];

const appColorsThemes = {
  "canary": AppColors(
    primarySwatch: Colors.orange,
    accentColor: Color(0xFFEAAD13),
    backgroundColor: Color(0xFF0B0900),
    backgroundColorLite: Color(0xFF131210),
    foregroundColor: Color(0xFFFDF1D2),
    foregroundColorDark: Color(0xFFD3C6A3),
  ),
  "mute": AppColors(
    primarySwatch: Colors.grey,
    accentColor: Color(0xff5E565A),
    backgroundColor: Color(0xff1c1a1b),
    backgroundColorLite: Color(0xff232022),
    foregroundColor: Color(0xffdecfd6),
    foregroundColorDark: Color(0xffa99ca3),
    // colorBurst: randomColor2,
  ),
  "fern": AppColors(
    primarySwatch: Colors.lightGreen,
    accentColor: Color(0xffd3f401),
    backgroundColor: Color(0xff1a1e00),
    backgroundColorLite: Color(0xff232900),
    foregroundColor: Color(0xfffbffe1),
    foregroundColorDark: Color(0xffc7cbb2),
  ),
  "space": AppColors(
    primarySwatch: Colors.blue,
    accentColor: Color(0xff3F78FD),
    backgroundColor: Color(0xff040c24),
    backgroundColorLite: Color(0xff051031),
    foregroundColor: Color(0xffE6FAFF),
    foregroundColorDark: Color(0xffafbec2),
  ),
  "prism": AppColors(
    primarySwatch: Colors.deepPurple,
    accentColor: Color(0xff673ab7),
    backgroundColor: Color(0xff0e0623),
    backgroundColorLite: Color(0xff160938),
    foregroundColor: Color(0xffd6c7ff),
    foregroundColorDark: Color(0xffb4a0ec),
    // colorBurst: Color(0xFFAA00FF),
  ),
  "pink": AppColors(
    primarySwatch: Colors.pink,
    accentColor: Color(0xFFFF4081),
    backgroundColor: Color(0xff11030b),
    backgroundColorLite: Color(0xff1e0613),
    foregroundColor: Color(0xffe8b8d2),
    foregroundColorDark: Color(0xffec97c4),
    // colorBurst: Color(0xFFf60b45),
  ),
  "mono": AppColors(
    primarySwatch: Colors.grey,
    accentColor: Color(0xff6e6e6e),
    backgroundColor: Color(0xff050505),
    backgroundColorLite: Color(0xff141414),
    foregroundColor: Color(0xff949494),
    foregroundColorDark: Color(0xff595959),
    // colorBurst: Color(0xFFf2f2f2),
  ),
  "ekush": ekush,
};

ColorScheme colorScheme = const ColorScheme.dark(
  primary: Color(0xFFEAAD13),
  background: Color(0xFF0B0900),
  secondary: Color(0xFF131210),
  inversePrimary: Color(0xFFFDF1D2),
  tertiary: Color(0xFFD3C6A3),
);

const ekush = AppColors(
  primarySwatch: Colors.pink,
  accentColor: Color(0xfff60b45),
  backgroundColor: Color(0xff00110b),
  backgroundColorLite: Color(0xff002a1a),
  foregroundColor: Color(0xffa80b30),
  foregroundColorDark: Color(0xff9b0b2d),
  // colorBurst: Color(0xfff60b45),
);

const r = Color(0xfff60b45);
const g = Color(0xff00321f);

// AppColors appColors = appColorsThemes.values.first;

class AppColors {
  final MaterialColor primarySwatch;
  final Color accentColor;
  final Color backgroundColor;
  final Color backgroundColorLite;
  final Color foregroundColor;
  final Color foregroundColorDark;

  const AppColors({
    required this.primarySwatch,
    required this.accentColor,
    required this.backgroundColor,
    required this.backgroundColorLite,
    required this.foregroundColor,
    required this.foregroundColorDark,
  });
}
