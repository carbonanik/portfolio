import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

import '../../gen/assets.gen.dart';

class WebScrollAnimation extends StatelessWidget {
  WebScrollAnimation({Key? key}) : super(key: key);

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
            print(pointerSignal.scrollDelta.dy);

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
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          child: Column(
            children: [
              Container(
                height: screenSize.height,
                width: screenSize.width,
                child: Text(
                  "Overlay Text",
                  style: titleOneTextStyle.copyWith(fontSize: 400),
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
                color: appColors.foregroundColor,
                child: Stack(
                  children: [
                    Text(
                      "Section Three",
                      style: titleOneTextStyle.copyWith(color: appColors.backgroundColor),
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
