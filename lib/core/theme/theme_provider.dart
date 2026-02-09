import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'colors.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    const bool isRandom = false;
    // ignore: dead_code
    if (isRandom) {
      final key = getInitialRandomThemeKey(["pink", "ekush"]);
      _themeData = MapEntry(key, appColorsThemes[key]!.themeData);
    } else {
      _themeData = MapEntry("canary", appColorsThemes["canary"]!.themeData);
    }
  }

  late MapEntry<String, ThemeData> _themeData;

  MapEntry<String, ThemeData> get themeData => _themeData;

  void setThemeByKey(String key) {
    _themeData = MapEntry(key, appColorsThemes[key]!.themeData);
    notifyListeners();
  }

  /// get random theme key except selected one
  String nextRandomKey() => getInitialRandomThemeKey([themeData.key]);

  /// get random theme key
  static String getInitialRandomThemeKey(List<String> removeKeys) {
    final keys = appColorsThemes.keys.toList();
    if (removeKeys.isNotEmpty) {
      for (var removeKey in removeKeys) {
        keys.remove(removeKey);
      }
    }
    return keys.toList()[Random().nextInt(keys.length)];
  }
}
