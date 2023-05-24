import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AnimProps {
  opacity,
  width,
  height,
  padding,
  borderRadius,
  color,
}

class StaggeredAnimation extends StatefulWidget {
  const StaggeredAnimation({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<TimelineValue<AnimProps>> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = TimelineTween<AnimProps>()
        // Opacity - defined with absolute begin and end times
        .addScene(
          begin: 0.milliseconds,
          end: 100.milliseconds,
          curve: Curves.ease,
        )
        .animate(AnimProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
        // Width - this scene is relative to the previous one
        // There's no begin and end, only delay and duration
        .addSubsequentScene(
          delay: 25.milliseconds,
          duration: 125.milliseconds,
          curve: Curves.ease,
        )
        .animate(AnimProps.width, tween: Tween(begin: 50.0, end: 150.0))
        // Height and Padding
        .addSubsequentScene(
          duration: 125.milliseconds,
          curve: Curves.ease,
        )
        .animate(AnimProps.height, tween: Tween(begin: 50.0, end: 150.0))
        .animate(
          AnimProps.padding,
          tween: EdgeInsetsTween(
            begin: const EdgeInsets.only(bottom: 16.0),
            end: const EdgeInsets.only(bottom: 75.0),
          ),
        )
        // BorderRadius
        .addSubsequentScene(
          duration: 125.milliseconds,
          curve: Curves.ease,
        )
        .animate(
          AnimProps.borderRadius,
          tween: BorderRadiusTween(
            begin: BorderRadius.circular(4.0),
            end: BorderRadius.circular(75.0),
          ),
        )
        // Color
        .addSubsequentScene(
          duration: 250.milliseconds,
          curve: Curves.ease,
        )
        .animate(
          AnimProps.color,
          tween: ColorTween(
            begin: Colors.indigo[100],
            end: Colors.orange[400],
          ),
        )
        // Get the Tween so that we can drive it with the AnimationController
        .parent
        .animatedBy(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (controller.status == AnimationStatus.dismissed) {
            controller.forward();
          } else if (controller.status == AnimationStatus.completed) {
            controller.reverse();
          }
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: AnimatedBuilder(
              animation: controller,
              builder: _buildAnimation,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: animation.value.get(AnimProps.padding),
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: animation.value.get(AnimProps.opacity),
        child: Container(
          width: animation.value.get(AnimProps.width),
          height: animation.value.get(AnimProps.height),
          decoration: BoxDecoration(
            color: animation.value.get(AnimProps.color),
            border: Border.all(
              color: Colors.indigo[300]!,
              width: 3.0,
            ),
            borderRadius: animation.value.get(AnimProps.borderRadius),
          ),
        ),
      ),
    );
  }
}
