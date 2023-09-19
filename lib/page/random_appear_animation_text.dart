import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class RandomAppearAnimationText extends StatefulWidget {
  const RandomAppearAnimationText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  State<RandomAppearAnimationText> createState() => _RandomAppearAnimationTextState();
}

class _RandomAppearAnimationTextState extends State<RandomAppearAnimationText> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: 500.milliseconds, vsync: this);

    _animation = Tween<double>(
      begin: 0,
      end: widget.text.length.toDouble(),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      animatedText(widget.text, _animation.value.toInt()),
      style: const TextStyle(
        fontFamily: "Cabin",
        fontSize: 300,
        fontWeight: FontWeight.w600,
        color: randomTextColor,
      ),
    );
  }

  static animatedText(
    String text,
    int value,
  ) {
    String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random rnd = Random();
    return text.substring(0, value) + String.fromCharCodes(
      Iterable.generate(
        text.length - value,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
  }
}
