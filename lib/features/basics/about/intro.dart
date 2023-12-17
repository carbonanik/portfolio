import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';
import 'package:portfolio/features/common/ui/widgets/step_text.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/gen/fonts.gen.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:sa4_migration_kit/sa4_migration_kit.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/ui/widgets/corner_cut_style_button.dart';

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
  late AnimationController _timeLineController;
  late Animation<TimelineValue<AnimProps>> animation;
  late Timer _startTimer;

  @override
  void initState() {
    super.initState();

    _timeLineController = AnimationController(duration: 1600.milliseconds, vsync: this);
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
        .animatedBy(_timeLineController);

    _startTimer = Timer(700.milliseconds, () {
      _timeLineController.forward();
    });
  }

  @override
  void dispose() {
    _startTimer.cancel();
    _timeLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(animation: _timeLineController, builder: _buildAnimation),
      ],
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ? hi
        _animatedAppear(
          child: MouseRegion(
            onEnter: (hovering) {
              widget.blobHoverEffect?.call(
                BlobHoverData(
                  color: appColors.foregroundColor,
                  size: context.responsiveSize(desktop: 200),
                ),
              );
            },
            onExit: (event) {
              widget.blobHoverEffect?.call(
                const BlobHoverData.initial(),
              );
            },
            child: SizedBox(
              width: context.responsiveSize(desktop: 400),
              child: Text(
                "Hi,",
                style: titleTwoTextStyle.copyWith(
                  fontSize: context.responsiveSize(desktop: titleTwoTextStyle.fontSize!),
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
        // ? Title
        _animatedAppear(
          child: MouseRegion(
            onEnter: (hovering) {
              widget.blobHoverEffect?.call(
                BlobHoverData(
                  color: appColors.accentColor,
                  size: context.responsiveSize(desktop: 400),
                ),
              );
            },
            onExit: (event) {
              widget.blobHoverEffect?.call(
                const BlobHoverData.initial(),
              );
            },
            child: StepText(
              text: "I am Anik.",
              style: titleOneTextStyle.copyWith(
                fontSize: context.responsiveSize(desktop: titleOneTextStyle.fontSize!),
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: appColors.foregroundColor.withOpacity(.5),
                  ),
                ],
                fontFamily: ibmPlexMono,
                wordSpacing: -20,
              ),
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.titleReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.titleIncreaseLeftMargin),
          boxColor: appColors.foregroundColor,
        ),
        // ? Subtitle
        _animatedAppear(
          child: SizedBox(
            width: size.width / 3 + 200,
            child: Text(
              "a coder, breaker, fixer.",
              style: subtitleTextStyle.copyWith(
                fontSize: context.responsiveSize(desktop: subtitleTextStyle.fontSize!),
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
        // ? Description
        _animatedAppear(
          child: SizedBox(
            width: size.width / 3 + 150,
            child: Text(
              "I’m a software engineer specializing in building (and occasionally designing) "
              "exceptional digital experiences. Currently, I’m focused on building accessible, "
              "human-centered products.",
              style: paragraphTextStyle.copyWith(
                fontSize: context.responsiveSize(desktop: paragraphTextStyle.fontSize!),
              ),
            ),
          ),
          reduceRightMargin: animation.value.get(AnimProps.descriptionReduceRightMargin),
          increaseLeftMargin: animation.value.get(AnimProps.descriptionIncreaseLeftMargin),
          boxColor: appColors.foregroundColorDark,
        ),
        const SizedBox(height: 50),
        // ? Button
        _animatedAppear(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CornerCutButton(
              onTap: () {
                showDialog(context: context, builder: buildDialog);
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

Widget buildDialog(BuildContext context) {
  return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Resume",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.close,
                color: appColors.foregroundColorDark,
              ))
        ],
      ),
      backgroundColor: appColors.backgroundColor,
      surfaceTintColor: Colors.grey,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appColors.foregroundColorDark,
          width: 2,
        ),
      ),
      content: SizedBox(
        width: context.responsiveSize(desktop: 1000, tablet: 600, mobile: 200),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsiveSize(desktop: 100, tablet: 50, mobile: 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "SHEIKH ANIK",
                style: titleOneTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: 40, tablet: 36, mobile: 30),
                    fontFamily: FontFamily.iBMPlexMono),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Flutter Developer",
                style: paragraphTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: 24), fontFamily: FontFamily.iBMPlexMono),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "OBJECTIVE",
                style: titleOneTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: 24), fontFamily: FontFamily.iBMPlexMono),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enthusiastic App developer with 5 years of experience cooking up clean code for fast-paced businesses. "
                "Excited to jazz up products and whip up awesome user experiences.",
                style: paragraphTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: fontSize_18), fontFamily: FontFamily.iBMPlexMono),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Education",
                style: titleOneTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: 24), fontFamily: FontFamily.iBMPlexMono),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Diploma in electronics",
                style: paragraphTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: fontSize_18), fontFamily: FontFamily.iBMPlexMono),
              ),
              // Text(
              //   "Dhaka Polytechnic Institute",
              //   style: paragraphTextStyle.copyWith(
              //     fontSize: context.responsiveSize(desktop: fontSize_18),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "BSc in Computer Science",
                style: paragraphTextStyle.copyWith(
                    fontSize: context.responsiveSize(desktop: fontSize_18), fontFamily: FontFamily.iBMPlexMono),
              ),
              const SizedBox(
                height: 40,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CornerCutButton(
                  text: "Download",
                  onTap: () async {
                    await launchUrl(Uri.parse(
                        "https://docs.google.com/document/d/1qTTUmrEADgqPEE9lBHMHdGlnGjBsDNBOuNuHzh7gJXk/edit?usp=sharing"));
                  },
                ),
              )
            ],
          ),
        ),
      ));
}
