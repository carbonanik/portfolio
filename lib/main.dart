import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/page/menu/about_page.dart';
import 'package:portfolio/page/menu/contact_page.dart';
import 'package:portfolio/page/menu/work_page.dart';
import 'package:portfolio/page/menu/work_page_2.dart';
import 'package:portfolio/page/on_bording_page.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

void main() {
  colorIndex = Random().nextInt(appColorsList.length);
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
      home: const OnBoardPage(),
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