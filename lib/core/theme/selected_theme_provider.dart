import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getRandomThemeKey() {
  return appColorsThemes.keys.toList()[Random().nextInt(appColorsThemes.length)];
}

Future<void> saveTheme(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('theme', key);
}

Future<String?> loadTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.getString('theme');
}

// Future<String> keyToSave() async {
//   final selectedThemeKye = await loadTheme();
//   if (selectedThemeKye == null) return getRandomThemeKey();
//   final keys = appColorsThemes.keys.toList();
//   final index = keys.indexOf(selectedThemeKye);
//   final keyToSave = keys[(index + 1) % keys.length];
//   return keyToSave;
// }

final savedKeyProvider = FutureProvider<String?>((ref) => loadTheme());

// final selectedThemeKyeProvider = StateProvider<String>((ref) => appColorsThemes.keys.first);

// final selectedThemeProvider = StateProvider<AppColors>((ref) {
//   final selectedThemeKye = ref.watch(selectedThemeKyeProvider);
//   return appColorsThemes[selectedThemeKye] ?? appColorsThemes[getRandomThemeKey()]!;
// });
