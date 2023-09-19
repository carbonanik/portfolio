import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class CustomLoadingAnimation extends StatefulWidget {
  const CustomLoadingAnimation({Key? key}) : super(key: key);

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: 200.milliseconds,
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(2.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
          ),
        ),
        Center(
          child: SizedBox(
            height: 100,
            child: Transform(
              transform: Matrix4.skewX(.5),
              child: Stack(
                children: List.generate(
                  (width / 50 * 1.2).toInt(),
                  (index) => SlideTransition(
                    position: _offsetAnimation,
                    child: Container(
                      transform: Matrix4.translationValues(
                        index * 50 - (width / 2) - 50 * 3,
                        0,
                        0,
                      ),
                      width: 50,
                      color: index % 2 == 0 ? backgroundColor : accentColor,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
