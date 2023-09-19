import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/corner_cut_style_button.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _AnimProps {
  leftOffsetAnimation,
  leftFadeAnimation,
  leftScaleAnimation,
  //
  rightOffsetAnimation,
  rightFadeAnimation,
  rightScaleAnimation,
  // button button
  buttonTransition,
}

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<TimelineValue<_AnimProps>> animation;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: 1000.milliseconds, vsync: this);
    animation = TimelineTween<_AnimProps>()
        // left side
        .addScene(begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
        .animate(_AnimProps.leftOffsetAnimation, tween: Tween(begin: const Offset(-200, -100), end: Offset.zero))
        .animate(_AnimProps.leftFadeAnimation, tween: Tween(begin: 0.0, end: 1.0))
        .animate(_AnimProps.leftScaleAnimation, tween: Tween(begin: 0.9, end: 1.0))

        // right side
        .addSubsequentScene(delay: -70.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
        .animate(_AnimProps.rightOffsetAnimation, tween: Tween(begin: const Offset(200, 100), end: Offset.zero))
        .animate(_AnimProps.rightFadeAnimation, tween: Tween(begin: 0.0, end: 1.0))
        .animate(_AnimProps.rightScaleAnimation, tween: Tween(begin: 0.9, end: 1.0))

        // Button
        .addSubsequentScene(delay: 50.milliseconds, duration: 100.milliseconds, curve: Curves.ease)
        .animate(_AnimProps.buttonTransition, tween: Tween(begin: const Offset(0, 200), end: Offset.zero))
        //
        .parent
        .animatedBy(controller);

    Timer(700.milliseconds, () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuContentPage(
      menuItem: 'Work',
      isLoading: isLoading,
      children: [
        buildAnimatedProjectList(),
        Positioned(
          bottom: 80,
          child: buildAnimatedNextButton(),
        ),
      ],
    );
  }

  AnimatedBuilder buildAnimatedNextButton() {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            transform: Matrix4Transform().translateOffset(animation.value.get(_AnimProps.buttonTransition)).matrix4,
            child: RawMaterialButton(
              onPressed: () {
                controller.reverse();
                Timer(1000.milliseconds, () {
                  isLoading = true;
                  setState(() {});
                  Timer(1000.milliseconds, () {
                    isLoading = false;
                    setState(() {});
                    Timer(500.milliseconds, () {
                      controller.forward();
                    });
                  });
                });
              },
              elevation: 2.0,
              fillColor: accentColor.withOpacity(.1),
              padding: const EdgeInsets.all(18.0),
              shape: const CircleBorder(side: BorderSide(color: accentColor, width: 2)),
              child: const Icon(
                Icons.keyboard_double_arrow_down_rounded,
                size: 35.0,
                color: accentColor,
              ),
            ),
          );
        });
  }

  AnimatedBuilder buildAnimatedProjectList() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(
              opacity: animation.value.get(_AnimProps.leftFadeAnimation),
              child: Container(
                padding: const EdgeInsets.only(bottom: 120, right: 60),
                transform: Matrix4Transform()
                    .scale(animation.value.get(_AnimProps.leftScaleAnimation))
                    .translateOffset(animation.value.get(_AnimProps.leftOffsetAnimation))
                    .matrix4,
                child: buildProjectItem(mirror: true),
              ),
            ),
            Opacity(
              opacity: animation.value.get(_AnimProps.rightFadeAnimation),
              child: Container(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  transform: Matrix4Transform()
                      .scale(animation.value.get(_AnimProps.rightScaleAnimation))
                      .translateOffset(animation.value.get(_AnimProps.rightOffsetAnimation))
                      .matrix4,
                  child: buildProjectItem(mirror: false)),
            ),
          ],
        );
      },
    );
  }

  Widget buildProjectItem({required bool mirror}) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mirror ? projectDetail(mirror: mirror) : projectImage(mirror: mirror),
          const SizedBox(width: 80),
          mirror ? projectImage(mirror: mirror) : projectDetail(mirror: mirror),
        ],
      ),
    );
  }

  Widget projectImage({required bool mirror}) {
    return Image.asset(
      Assets.image.mockAppUi2.path,
      scale: 1.8,
    );

    Padding(
      padding: mirror ? const EdgeInsets.only(right: 100) : const EdgeInsets.only(left: 100),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: mirror ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
        children: [
          Positioned(
            right: mirror ? null : 90,
            left: mirror ? 90 : null,
            child: Image.asset(
              Assets.image.mockAppUi2.path,
              scale: 2.4,
              color: Colors.black.withOpacity(.6),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned(
            right: mirror ? null : 50,
            left: mirror ? 50 : null,
            child: Image.asset(
              Assets.image.mockAppUi2.path,
              scale: 2.1,
              color: Colors.black.withOpacity(.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned(
            right: mirror ? null : 0,
            left: mirror ? 0 : null,
            child: Image.asset(
              Assets.image.mockAppUi2.path,
              scale: 1.8,
            ),
          ),
          Positioned(
              child: Container(
            width: 200,
          ))
        ],
      ),
    );
  }

  Widget projectDetail({required bool mirror}) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Column(
        crossAxisAlignment: mirror ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.folder,
            color: foregroundColorDark,
            size: 80,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: mirror ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [

              Text(
                "The Real project",
                style: titleOneTextStyle.copyWith(fontSize: 46),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is the real project i have made, you can believe me.",
            style: paragraphTextStyle.copyWith(fontSize: fontSize_18),
            textAlign: mirror ? TextAlign.right : TextAlign.left,
          ),
          const SizedBox(height: 40),
          CornerCutButton(
            text: "Explore",
            onTap: () {},
            fontSize: 18,
          )
        ],
      ),
    );
  }
}
