import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/theme_provider.dart';

void main() async {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeData = ref.watch(themeProvider).themeData.value;
      return MaterialApp.router(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerConfig: _router.config(),
      );
    });
  }
}

// todo:
// adopt the click me button style in everywhere ✔
// sharp shadow of a object in opposite direction of the mouse
// Work Design change (like nested folder) ✔
// --> 📁 Work
//     |--> 📁 Complete Project
//     |    |--> 📁 E-Commerce
//     |    |--> 📁 Portfolio
//     |--> 📁 Demos
//     |    |--> 📁 Weather App
//     |--> 📁 Working On
//     |--> 📁
//     |--> 📁
// big menu https://atlason.com/ || https://musemind.agency/
// follow me text with random appear animation ✔
// article search box that search category and article both
// nested work category
// work animated big folder
// explore window for project ✔
// project search tag like github readme badge
// color selector

// ? Commands
// flutter run -d chrome --web-hostname 0.0.0.0 --web-port 8080
// flutter pub run build_runner build --delete-conflicting-outputs

// ? Deploy to Firebase
// sudo npm install -g firebase-tools
// dart pub global activate flutterfire_cli
// export PATH="$PATH":"$HOME/.pub-cache/bin"
// firebase login
// add firebase_core to pubspec.yaml
// flutterfire configure
// git ignore
// firebase experiments:enable webframeworks
// firebase init hosting
// flutter build web
// firebase deploy
