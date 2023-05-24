import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/top_menu_bar.dart';

import 'common/widget/intro.dart';
import 'common/widget/social_column.dart';
import 'common/widget/text_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          TextBackground(),
          // Positioned(
          //   left: 50,
          //   bottom: -50,
          //   child: Text(
          //     "About",
          //     style: TextStyle(
          //         fontFamily: "Cabin",
          //         fontSize: 300,
          //         fontWeight: FontWeight.w600,
          //         color: Color(0xff2c2a21)),
          //   ),
          // ),
          Positioned(
            // bottom: 150,
            top: 200,
            left: 120,
            child: Intro(),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SocialColumn(),
          ),
          Positioned(child: TopMenuBar()),
        ],
      ),
    );
  }
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

