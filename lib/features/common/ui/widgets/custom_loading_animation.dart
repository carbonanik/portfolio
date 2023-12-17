import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class CustomLoadingAnimation extends ConsumerStatefulWidget {
  const CustomLoadingAnimation({super.key});

  @override
  ConsumerState<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends ConsumerState<CustomLoadingAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: 200.milliseconds,
    vsync: this,
  )..repeat(reverse: false);
  late final AnimationController _loadingPercentageController = AnimationController(
    duration: 1000.milliseconds,
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(2.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  late final Animation<double> _loadingPercentageAnimation = Tween<double>(
    begin: 0,
    end: 100,
  ).animate(
    CurvedAnimation(
      parent: _loadingPercentageController,
      curve: Curves.ease,
    ),
  );

  @override
  void initState() {
    super.initState();
    _loadingPercentageController.forward();

    _loadingPercentageController.addListener(() {
      if ((_loadingPercentageAnimation.value - _loadingPercentageAnimation.value.floor()) < .15) {
        setState(() {});
      }
    });
  }

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
                      color: index % 2 == 0 ? appColors.backgroundColor : appColors.accentColor,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: const Offset(0, 100),
            child: Text(
              " ${_loadingPercentageAnimation.value.toInt()}%",
              style: titleTwoTextStyle.copyWith(color: appColors.accentColor, fontSize: 52),
            ),
          ),
        ),
      ],
    );
  }
}
