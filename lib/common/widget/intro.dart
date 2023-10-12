import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/step_text.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:sa4_migration_kit/sa4_migration_kit.dart';
import 'package:supercharged/supercharged.dart';

import 'corner_cut_style_button.dart';

enum AnimProps {
  // Over Title
  topTitleReduceRightMargin,
  topTitleIncreaseLeftMargin,
  // Title
  titleReduceRightMargin,
  titleIncreaseLeftMargin,
  // Subtitle
  subtitleReduceRightMargin,
  subtitleIncreaseLeftMargin,
  // Description
  descriptionReduceRightMargin,
  descriptionIncreaseLeftMargin,
  // Button
  buttonReduceRightMargin,
  buttonIncreaseLeftMargin,
}

class Intro extends StatefulWidget {
  const Intro({this.blobHoverEffect, Key? key}) : super(key: key);
  final void Function(BlobHoverData data)? blobHoverEffect;

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
        // Over Title
        .addScene(begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.topTitleReduceRightMargin, tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.topTitleIncreaseLeftMargin, tween: Tween(begin: 0.0, end: 1000.0))

        // Title
        .addSubsequentScene(delay: -175.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.titleReduceRightMargin, tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.titleIncreaseLeftMargin, tween: Tween(begin: 0.0, end: 1000.0))

        // subtitle
        .addSubsequentScene(delay: -175.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.subtitleReduceRightMargin, tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.subtitleIncreaseLeftMargin, tween: Tween(begin: 0.0, end: 1000.0))

        // description
        .addSubsequentScene(delay: -175.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.descriptionReduceRightMargin, tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.descriptionIncreaseLeftMargin, tween: Tween(begin: 0.0, end: 1000.0))

        // button
        .addSubsequentScene(delay: 0.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.buttonReduceRightMargin, tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.buttonIncreaseLeftMargin, tween: Tween(begin: 0.0, end: 1000.0))
        //
        .parent
        .animatedBy(controller);

    Timer(700.milliseconds, () {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(animation: controller, builder: _buildAnimation),
        // const SizedBox(height: 50),
        // showButton
        //     ? CornerCutButton(
        //         onTap: () {
        //           if (controller.status == AnimationStatus.dismissed) {
        //             controller.forward();
        //           } else if (controller.status == AnimationStatus.completed) {
        //             controller.reverse();
        //           }
        //         },
        //         text: "Click Me!",
        //       )
        //     : const SizedBox.shrink()
      ],
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _animatedAppear(
          child: MouseRegion(
            onEnter: (hovering) {
              widget.blobHoverEffect?.call(
                 BlobHoverData(
                  color: appColors.foregroundColor,
                  size: 200,
                ),
              );
            },
            onExit: (event) {
              widget.blobHoverEffect?.call(
                const BlobHoverData.initial(),
              );
            },
            child: SizedBox(
              width: 400,
              child: Text(
                "Hi,",
                style: titleTwoTextStyle.copyWith(
                  shadows: [
                     Shadow(
                      blurRadius: 10,
                      color: appColors.accentColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.topTitleReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.topTitleIncreaseLeftMargin),
        ),
        _animatedAppear(
          child: MouseRegion(
            onEnter: (hovering) {
              widget.blobHoverEffect?.call(
                 BlobHoverData(
                  color: appColors.accentColor,
                  size: 400,
                ),
              );
            },
            onExit: (event) {
              widget.blobHoverEffect?.call(
                const BlobHoverData.initial(),
              );
            },
            child: StepText(
              text: "I am Makhdum",
              style: titleOneTextStyle
                  .copyWith(
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: appColors.foregroundColor.withOpacity(.5),
                  ),
                ],
                fontFamily: ibmPlexMono,
                wordSpacing: -20,
              )
              ,
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.titleReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.titleIncreaseLeftMargin),
          boxColor: appColors.foregroundColor,
        ),
        _animatedAppear(
          child: SizedBox(
            width: 700,
            child: Text(
              "a coder, breaker, fixer.",
              style: subtitleTextStyle.copyWith(
                shadows: [
                   Shadow(
                    blurRadius: 10,
                    color: appColors.accentColor,
                  ),
                ],
              ),
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.subtitleReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.subtitleIncreaseLeftMargin),
        ),
        const SizedBox(height: 50),
        _animatedAppear(
          child: SizedBox(
            width: size.width / 3 + 150,
            child:  Text(
              "I’m a software engineer specializing in building (and occasionally designing) "
              "exceptional digital experiences. Currently, I’m focused on building accessible, "
              "human-centered products.",
              style: paragraphTextStyle,
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.descriptionReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.descriptionIncreaseLeftMargin),
          boxColor: appColors.foregroundColorDark,
        ),
        const SizedBox(height: 50),
        _animatedAppear(
          child: SizedBox(
            width: 180,
            child: CornerCutButton(
              onTap: () {
                // if (controller.status == AnimationStatus.dismissed) {
                //   controller.forward();
                // } else if (controller.status == AnimationStatus.completed) {
                //   controller.reverse();
                // }
              },
              text: "Click Me!",
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.buttonReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.buttonIncreaseLeftMargin),
          boxColor: appColors.foregroundColorDark,
        ),
      ],
    );
  }
}

Widget _animatedAppear({
  required Widget child,
  required reduceRightMargin,
  required increaseLeftMargin,
  Color? boxColor,
}) {
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
          color: boxColor ?? appColors.accentColor,
        ),
      ),
    ],
  );
}
