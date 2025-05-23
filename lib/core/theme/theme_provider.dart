import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    final key = getInitialRandomThemeKey(["pink", "ekush"]);
    _themeData = MapEntry(key, appColorsThemes[key]!);
  }

  late MapEntry<String, ThemeData> _themeData;

  MapEntry<String, ThemeData> get themeData => _themeData;

  void setThemeByKey(String key) {
    _themeData = MapEntry(key, appColorsThemes[key]!);
    notifyListeners();
  }

  /// get random theme key except selected one
  String nextRandomKey() => getInitialRandomThemeKey([themeData.key]);

  /// get random theme key
  static String getInitialRandomThemeKey(List<String> removeKeys) {
    // return 'sky_light';
    final keys = appColorsThemes.keys.toList();
    if (removeKeys.isNotEmpty) {
      for (var removeKey in removeKeys) {
        keys.remove(removeKey);
      }
    }
    return keys.toList()[Random().nextInt(keys.length)];
  }
}

final appColorsThemes = {
  "orange": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFF6F00),       // Deep Orange
      background: Color(0xFF1A0B00),    // Very dark brown/orange-tinted
      secondary: Color(0xFF331800),     // Darker shade for contrast
      tertiary: Color(0xFFFFD8B2),      // Light orange for highlights
      inversePrimary: Color(0xFFFFA040),// Softer orange for alternate emphasis
    ),
  ),
  // "orange_light": ThemeData(
  //   colorScheme: const ColorScheme.light(
  //     primary: Color(0xFFFF6F00),       // Same primary orange
  //     background: Color(0xFFFFF6F0),    // Inverse of dark background (light warm tone)
  //     secondary: Color(0xFFFFE6CC),     // Light orange tone for secondary UI elements
  //     tertiary: Color(0xFF331800),      // Dark for contrast (inverted from highlight)
  //     inversePrimary: Color(0xFF1A0B00),// Original dark background becomes contrast color
  //   ),
  // ),
  "sky_light": ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF03A9F4),       // Sky blue
      background: Color(0xFFC5ECFC),    // Very light blue background
      secondary: Color(0xFFC5ECFC),     // Lighter blue for accents
      tertiary: Color(0xFF0A95D3),      // Deep blue for contrast elements
      inversePrimary: Color(0xFF0685BE),// Very dark blue for inverse surfaces
    ),
  ),

  "canary": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFEAAD13),
      background: Color(0xFF0B0900),
      secondary: Color(0xFF181613),
      tertiary: Color(0xFFFDF1D2),
      inversePrimary: Color(0xFFD3C6A3),
    ),
  ),
  "mute": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff5E565A),
      background: Color(0xff1c1a1b),
      secondary: Color(0xff232022),
      tertiary: Color(0xffdecfd6),
      inversePrimary: Color(0xffa99ca3),
    ),
  ),
  "fern": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xffd3f401),
      background: Color(0xff1a1e00),
      secondary: Color(0xff232900),
      tertiary: Color(0xfffbffe1),
      inversePrimary: Color(0xffc7cbb2),
    ),
  ),
  "space": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff3F78FD),
      background: Color(0xff040c24),
      secondary: Color(0xff051031),
      tertiary: Color(0xffE6FAFF),
      inversePrimary: Color(0xffafbec2),
    ),
  ),
  "prism": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff673ab7),
      background: Color(0xff0e0623),
      secondary: Color(0xff160938),
      tertiary: Color(0xffd6c7ff),
      inversePrimary: Color(0xffb4a0ec),
    ),
  ),
  "pink": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFF4081),
      background: Color(0xff11030b),
      secondary: Color(0xff1e0613),
      tertiary: Color(0xffe8b8d2),
      inversePrimary: Color(0xffec97c4),
    ),
  ),
  "mono": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff6e6e6e),
      background: Color(0xff050505),
      secondary: Color(0xff141414),
      tertiary: Color(0xff949494),
      inversePrimary: Color(0xff595959),
    ),
  ),
  "ekush": ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xfff60b45),
      background: Color(0xff00110b),
      secondary: Color(0xff002a1a),
      tertiary: Color(0xffa80b30),
      inversePrimary: Color(0xff9b0b2d),
    ),
  ),
};
