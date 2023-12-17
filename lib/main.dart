import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/theme/colors.dart';

void main() {
  colorIndex = Random().nextInt(appColorsList.length);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appColors.primarySwatch,
        scaffoldBackgroundColor: appColors.backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: appColors.foregroundColor,
              displayColor: appColors.foregroundColor,
              fontFamily: "Cabin",
            ),
      ),
      routerConfig: _router.config(),
    );
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
// flutterfire configure
// git ignore
// firebase experiments:enable webframeworks
// firebase init hosting
// flutter build web
// firebase deploy
