import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class TextBackground extends StatefulWidget {
  const TextBackground({
    Key? key,
  }) : super(key: key);

  @override
  State<TextBackground> createState() => _TextBackgroundState();
}

class _TextBackgroundState extends State<TextBackground> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: 4.seconds,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_animationController);

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      """
Hello World! Hello World! Hello World!\n
llo World! Hello World! Hello World! He\n
orld! Hello World! Hello World! Hello W\n
d! Hello World! Hello World! Hello Worl\n
lo World! Hello World! Hello World! Hel\n
World! Hello World! Hello World! Hello\n""",
      style: backgroundTextStyle,
      softWrap: false,
    );
  }
}
