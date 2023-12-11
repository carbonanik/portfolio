import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/paths/dotted_circle_painter.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class ScrollableRow extends StatefulWidget {
  const ScrollableRow({
    // required this.items,
    required this.itemBuilder,
    required this.itemCount,
    this.contentHeight,
    Key? key,
  }) : super(key: key);

  // final List<Item> items;
  final  Widget? Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double? contentHeight;

  @override
  State<ScrollableRow> createState() => _ScrollableRowState();
}

class _ScrollableRowState extends State<ScrollableRow> with TickerProviderStateMixin {
  late AnimationController _nextButtonController;
  final borderColor = appColors.accentColor.withOpacity(.2); //const Color(0xFF382A04);
  final lineColor = appColors.accentColor.withOpacity(.4); //const Color(0xFF382A04);///backgroundTextColor;
  int currentProjectIndex = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _nextButtonController = AnimationController(duration: 10.seconds, vsync: this);
    _nextButtonController.repeat();
  }

  @override
  void dispose() {
    _nextButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.responsiveSize(desktop: 40)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (!context.isMobile) const SizedBox(width: 40),
            if (!context.isMobile)
              buildAnimatedNextButton(
                1,
                () {
                  currentProjectIndex = (currentProjectIndex - 1) % widget.itemCount;
                  _scrollController.animateTo(
                    currentProjectIndex * 500,
                    duration: 1.seconds,
                    curve: Curves.easeInOutCubic,
                  );
                },
              ),
            Expanded(
              child: SizedBox(
                height: widget.contentHeight ?? context.responsiveSize(desktop: 432, tablet: 432, mobile: 320),
                child: ListView.builder(
                  // clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: widget.itemCount,
                  itemBuilder: widget.itemBuilder,
                ),
              ),
            ),
            // if (!context.isMobile) const SizedBox(width: 60),
            if (!context.isMobile)
              buildAnimatedNextButton(3, () {
                currentProjectIndex = (currentProjectIndex + 1) % widget.itemCount;
                _scrollController.animateTo(
                  currentProjectIndex * 500,
                  duration: 1.seconds,
                  curve: Curves.easeInOutCubic,
                );
              }),
          ],
        ),
      ],
    );
  }

  Widget buildAnimatedNextButton(int turns, void Function() onPressed) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: _nextButtonController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _nextButtonController.value * 2.0 * pi,
                  child: CustomPaint(
                    painter: DottedCirclePainter(color: lineColor),
                    child: Container(),
                  ),
                );
              }),
          MouseRegion(
            onEnter: (_) {
              _nextButtonController.duration = 2.seconds;
              _nextButtonController.repeat();
            },
            onExit: (_) {
              _nextButtonController.duration = 10.seconds;
              _nextButtonController.repeat();
            },
            child: RawMaterialButton(
              onPressed: onPressed,
              elevation: 2.0,
              fillColor: appColors.accentColor.withOpacity(.1),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: RotatedBox(
                quarterTurns: turns,
                child: Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  size: 30.0,
                  color: lineColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
