import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/ascii_media.dart';
import 'package:portfolio/page/menu/about_page.dart';
import 'package:portfolio/page/menu/blog_page.dart';
import 'package:portfolio/theme/colors.dart';

void main() {
  colorIndex = 0;
  Random().nextInt(appColorsList.length);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const BlogPage(),
    );
  }
}

// todo:
// adopt the click me button style in everywhere
// sharp shadow of a object in opposite direction of the mouse
// Work Design change (like nested folder)
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
// follow me text with random appear animation
// article search box that search category and article both
// nested work category
// work animated big folder
// explore window for project
// project search tag like github readme badge
// color selector

// ? Commands
// flutter run -d chrome --web-hostname 0.0.0.0 --web-port 8080
// flutter pub run build_runner build --delete-conflicting-outputs

