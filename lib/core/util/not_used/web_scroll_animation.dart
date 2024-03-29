import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

import '../../../gen/assets.gen.dart';

class WebScrollAnimation extends StatefulWidget {
  const WebScrollAnimation({super.key});

  @override
  State<WebScrollAnimation> createState() => _WebScrollAnimationState();
}

class _WebScrollAnimationState extends State<WebScrollAnimation> {
  final controller = ScrollController();

  double desiredOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            // do something when scrolled

            desiredOffset += pointerSignal.scrollDelta.dy;
            desiredOffset = desiredOffset.clamp(0, screenSize.height * 3);

            controller.animateTo(
              desiredOffset,
              duration: 500.milliseconds,
              curve: Curves.ease,
            );
          }
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Text(
                  "Overlay Text",
                  style: titleOneTextStyle(context) .copyWith(fontSize: 400),
                ),
              ),
              Image.asset(
                Assets.image.banner.path,
                height: screenSize.height,
                width: screenSize.width,
                fit: BoxFit.cover,
              ),
              Container(
                height: screenSize.height,
                width: screenSize.width,
                color: Theme.of(context).colorScheme.tertiary,
                child: Stack(
                  children: [
                    Text(
                      "Section Three",
                      style: titleOneTextStyle(context) .copyWith(color: Theme.of(context).colorScheme.background),
                    ),
                    Positioned(right: 50, child: Image.asset(Assets.image.mockAppUi2.path))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
