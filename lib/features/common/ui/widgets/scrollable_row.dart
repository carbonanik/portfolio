import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/common/paths/dotted_circle_painter.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:supercharged/supercharged.dart';

class ScrollableRow extends StatefulWidget {
  const ScrollableRow({
    required this.itemBuilder,
    required this.itemCount,
    this.contentHeight,
    this.itemTotalWidth,
    super.key,
  });

  final Widget? Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double? contentHeight;
  final double? itemTotalWidth;

  @override
  State<ScrollableRow> createState() => _ScrollableRowState();
}

class _ScrollableRowState extends State<ScrollableRow> with TickerProviderStateMixin {
  int currentProjectIndex = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
            if (!context.isMobile) const SizedBox(width: 40),
            if (!context.isMobile)
              AnimatedNextButton(
                turns: 1,
                onPressed: () {
                  currentProjectIndex = (currentProjectIndex - 1) % widget.itemCount;
                  _scrollController.animateTo(
                    currentProjectIndex * (widget.itemTotalWidth ?? 500),
                    duration: 1.seconds,
                    curve: Curves.easeInOutCubic,
                  );
                },
              ),
            Expanded(
              child: SizedBox(
                height: widget.contentHeight ?? context.responsiveSize(desktop: 432, tablet: 432, mobile: 320),
                child: ListView.builder(
                  clipBehavior: context.isMobile ? Clip.none : Clip.hardEdge,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: widget.itemCount,
                  itemBuilder: widget.itemBuilder,
                ),
              ),
            ),
            if (!context.isMobile)
              AnimatedNextButton(
                  turns: 3,
                  onPressed: () {
                    currentProjectIndex = (currentProjectIndex + 1) % widget.itemCount;

                    final double offset = currentProjectIndex * (widget.itemTotalWidth ?? 500);
                    // print("width$width");
                    // print("offset-left${_scrollController.position.maxScrollExtent - offset + 160}");
                    // if (_scrollController.position.maxScrollExtent - offset > 0) {
                    _scrollController.animateTo(
                      offset,
                      duration: 1.seconds,
                      curve: Curves.easeInOutCubic,
                    );
                    // } else {
                    //   currentProjectIndex = 0;
                    //
                    //   _scrollController.animateTo(
                    //     0,
                    //     duration: 1.seconds,
                    //     curve: Curves.easeInOutCubic,
                    //   );
                    // }
                  }),
          ],
        ),
      ],
    );
  }
}

class AnimatedNextButton extends ConsumerStatefulWidget {
  const AnimatedNextButton({required this.turns, required this.onPressed, super.key});

  final int turns;
  final void Function() onPressed;

  @override
  ConsumerState<AnimatedNextButton> createState() => _AnimatedNextButtonState();
}

class _AnimatedNextButtonState extends ConsumerState<AnimatedNextButton> with SingleTickerProviderStateMixin {
  late AnimationController _nextButtonController;
  late final Color lineColor = Theme.of(context).colorScheme.primary.withOpacity(.4);

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
                    painter: DottedCirclePainter(color: Theme.of(context).colorScheme.primary.withOpacity(.4)),
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
              onPressed: widget.onPressed,
              elevation: 2.0,
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: RotatedBox(
                quarterTurns: widget.turns,
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
