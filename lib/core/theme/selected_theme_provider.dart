

// String getInitialRandomThemeKey() {
//   final keys = appColorsThemes.keys.toList();
//   keys.remove("pink");
//   keys.remove("ekush");
//   return keys.toList()[Random().nextInt(appColorsThemes.length)];
// }
//
// Future<void> saveTheme(String key) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('theme', key);
// }
//
// Future<String?> loadTheme() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('theme');
// }

// Future<String> keyToSave() async {
//   final selectedThemeKye = await loadTheme();
//   if (selectedThemeKye == null) return getRandomThemeKey();
//   final keys = appColorsThemes.keys.toList();
//   final index = keys.indexOf(selectedThemeKye);
//   final keyToSave = keys[(index + 1) % keys.length];
//   return keyToSave;
// }

// final savedKeyProvider = FutureProvider<String?>((ref) => loadTheme());

// final selectedThemeKyeProvider = StateProvider<String>((ref) => appColorsThemes.keys.first);

// final selectedThemeProvider = StateProvider<AppColors>((ref) {
//   final selectedThemeKye = ref.watch(selectedThemeKyeProvider);
//   return appColorsThemes[selectedThemeKye] ?? appColorsThemes[getRandomThemeKey()]!;
// });
