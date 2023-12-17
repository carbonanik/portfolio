import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class RandomAppearAnimationText extends StatefulWidget {
  const RandomAppearAnimationText({
    required this.text,
    this.giveMeMyAnimationController,
    this.style,
    this.runOnHover = false,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final bool runOnHover;
  final Function(AnimationController controller)? giveMeMyAnimationController; // todo: paglami code need to be changed

  @override
  State<RandomAppearAnimationText> createState() => _RandomAppearAnimationTextState();
}

class _RandomAppearAnimationTextState extends State<RandomAppearAnimationText> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: 500.milliseconds, vsync: this);
    widget.giveMeMyAnimationController?.call(_controller);

    _animation = Tween<double>(
      begin: 0,
      end: widget.text.length.toDouble(),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  void hoverRun (){
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      animatedText(widget.text, _animation.value.toInt(), widget.runOnHover),
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: widget.style ??
          TextStyle(
            fontFamily: "Cabin",
            fontSize: context.responsiveSize(desktop:  300),
            fontWeight: FontWeight.w600,
            color: appColors.backgroundColorLite,
          ),
    );
  }

  static animatedText(
    String text,
    int value,
      bool runAnimation
  ) {
    String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random rnd = Random();
    return text.substring(0, value) +
        String.fromCharCodes(
          Iterable.generate(
            text.length - value,
            (_) => chars.codeUnitAt(
              rnd.nextInt(chars.length),
            ),
          ),
        );
  }
}
