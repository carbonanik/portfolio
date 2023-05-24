import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as im;
import 'package:portfolio/common/colors.dart';
import 'package:portfolio/common/widget/basic_text.dart';
import 'package:portfolio/common/widget/big_title.dart';
import 'package:portfolio/common/widget/skeleton_button.dart';
import 'package:portfolio/common/widget/subtitle.dart';
import 'package:simple_animations/timeline_tween/timeline_tween.dart';
import 'package:supercharged/supercharged.dart';

import '../../corner_cut_style_button.dart';

enum AnimProps {
  topTitleReduceRightMargin,
  topTitleIncreaseLeftMargin,
  titleReduceRightMargin,
  titleIncreaseLeftMargin,
  subtitleReduceRightMargin,
  subtitleIncreaseLeftMargin,
  descriptionReduceRightMargin,
  descriptionIncreaseLeftMargin,
}

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<TimelineValue<AnimProps>> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: 1600.milliseconds, vsync: this);
    animation = TimelineTween<AnimProps>()
        // Top Title
        .addScene(
            begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.topTitleReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.topTitleIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // Title
        .addSubsequentScene(
            delay: -175.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.titleReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.titleIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // subtitle
        .addSubsequentScene(
            delay: -175.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.subtitleReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.subtitleIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // description
        .addSubsequentScene(
            delay: -175.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.descriptionReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.descriptionIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))
        .parent
        .animatedBy(controller);

    Timer(700.milliseconds, (){
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(animation: controller, builder: _buildAnimation),
          const SizedBox(height: 50),
          CornerCutStyleButton(
            onTap: () {
              if (controller.status == AnimationStatus.dismissed) {
                controller.forward();
              } else if (controller.status == AnimationStatus.completed) {
                controller.reverse();
              }
            },
            text: "Click Me!",
          )
        ],
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _animatedAppear(
          child: const SizedBox(
            width: 400,
            child: Subtitle(text: "Hi,", fontSize: 26),
          ),
          reduceRightMargin:
              animation.value.get(AnimProps.topTitleReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.topTitleIncreaseLeftMargin),
        ),
        _animatedAppear(
          child: const BigTitle(text: "I'm Someone."),
          reduceRightMargin:
              animation.value.get(AnimProps.titleReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.titleIncreaseLeftMargin),
          boxColor: textColorLite,
        ),
        _animatedAppear(
          child: const SizedBox(
            width: 700,
            child: Subtitle(text: "a coder, breaker, fixer."),
          ),
          reduceRightMargin:
              animation.value.get(AnimProps.subtitleReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.subtitleIncreaseLeftMargin),
        ),
        const SizedBox(height: 50),
        _animatedAppear(
          child: SizedBox(
            width: size.width / 3 + 150,
            child: const BasicText(
              text:
                  "I’m a software engineer specializing in building (and occasionally designing) "
                  "exceptional digital experiences. Currently, I’m focused on building accessible, "
                  "human-centered products.",
            ),
          ),
          reduceRightMargin:
              animation.value.get(AnimProps.descriptionReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.descriptionIncreaseLeftMargin),
          boxColor: textColorDim,
        ),

      ],
    );
  }
}

Widget _animatedAppear(
    {required Widget child,
    required reduceRightMargin,
    required increaseLeftMargin,
    boxColor = textColorDark}) {
  return Stack(
    children: [
      Opacity(
        opacity: reduceRightMargin != 0 ? 0.0 : 1.0,
        child: child,
      ),
      Positioned.fill(
        child: Container(
          margin: EdgeInsets.only(
            right: reduceRightMargin,
            left: increaseLeftMargin,
          ),
          color: boxColor,
        ),
      ),
    ],
  );
}
// //
// Future<Widget> imageToAsciiArt(String imagePath) async {
//   // load the image
//   final image = await Image.file(File(imagePath)).image;
//
//   // resize the image
//   final resized = copyResize(image, 100, 100);
//
//   // convert the image to grayscale
//   final gray = color(resized, Colors.black.withOpacity(0.2));
//
//   // create the ascii art
//   final asciiArt = gray.getBytes(format: Format.grayscale8)
//       .map((int val) => _asciiCharacters[val~/25])
//       .join();
//
//   // return the ascii art as a text widget
//   return Text(asciiArt, style: TextStyle(fontSize: 10, fontFamily: 'Consolas'));
// }
//
//
// Future<Image> copyResize(File imageFile, int width, int height) async {
//   final img = im.decodeImage(await imageFile.readAsBytes());
//   return copyResize(img, width, height);
// }

