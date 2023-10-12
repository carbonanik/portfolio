import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/common/widget/corner_cut_style_button.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    this.blobHoverEffect,
    this.leftItem = true,
    required this.borderColor,
    Key? key,
  }) : super(key: key);

  final bool leftItem;
  final void Function(BlobHoverData data)? blobHoverEffect;
  final Color? borderColor;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> with TickerProviderStateMixin {
  bool imageHovered = false;
  bool hovered = false;
  String title = "The Real Project";
  final defaultBorderColor = appColors.accentColor.withOpacity(.2);

  late AnimationController _controller;
  late AnimationController _circleAnimationController;
  late Animation<double> _animation;
  late Animation<double> _circleAnimation;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _circleAnimationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: 210.milliseconds, vsync: this);

    _circleAnimationController = AnimationController(duration: 1000.milliseconds, vsync: this);

    _animation = Tween<double>(
      begin: 0,
      end: title.length.toDouble(),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _circleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_circleAnimationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (!_circleAnimationController.isAnimating) {
          _circleAnimationController.reset();
          _circleAnimationController.forward();
        }
      },
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            // shape: BeveledRectangleBorder(
            //   side: BorderSide(color: widget.borderColor ?? defaultBorderColor, width: 20),
            //   borderRadius: BorderRadius.only(
            //     topLeft: widget.leftItem ? const Radius.circular(80.0) : Radius.zero,
            //     topRight: !widget.leftItem ? const Radius.circular(80.0) : Radius.zero,
            //     // bottomRight: Radius.circular(18.0)
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // widget.leftItem ? projectDetail(leftItem: widget.leftItem) : projectImage(leftItem: widget.leftItem),
                  // const SizedBox(width: 40),
                  // widget.leftItem ? projectImage(leftItem: widget.leftItem) : projectDetail(leftItem: widget.leftItem),
                  projectDetail(leftItem: widget.leftItem),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: CornerCutBorderClipper(leftCut: widget.leftItem),
              child: Container(color: widget.borderColor ?? defaultBorderColor),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: CornerCutBorderClipper(leftCut: widget.leftItem, width: 10),
              child: CustomPaint(
                foregroundPainter: CirclePainter(value: _circleAnimation.value),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget projectImage({required bool leftItem}) {
    return MouseRegion(
      onEnter: (_) => setState(() => imageHovered = true),
      onExit: (_) => setState(() => imageHovered = false),
      child: Container(
        height: 325,
        width: 200,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor ?? defaultBorderColor, width: 2),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: ClipRect(
                child: AnimatedScale(
                  scale: imageHovered ? 1.8 : 1.4,
                  curve: Curves.ease,
                  duration: 1000.milliseconds,
                  child: Image.asset(
                    Assets.image.mockAppUi.path,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                duration: 1000.milliseconds,
                curve: Curves.ease,
                color: imageHovered ? appColors.backgroundColor.withOpacity(0) : appColors.backgroundColor.withOpacity(.2),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget projectDetail({required bool leftItem}) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: leftItem ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
           MouseRegion(
            // onEnter: (_) {
            //   widget.blobHoverEffect?.call(
            //     const BlobHoverData(
            //       color: foregroundColor,
            //       size: 200,
            //     ),
            //   );
            // },
            // onExit: (_) {
            //   widget.blobHoverEffect?.call(
            //     const BlobHoverData.initial(),
            //   );
            // },
            child: Icon(
              Icons.folder,
              color: appColors.foregroundColorDark,
              size: 80,
            ),
          ),
          const SizedBox(height: 30),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _controller.forward();
                // if (!_circleAnimationController.isAnimating ) {
                //   _circleAnimationController.reset();
                //   _circleAnimationController.forward();
                // }
              });
            },
            onExit: (_) {
              setState(() {
                _controller.reverse();
                // _circleAnimationController.reverse();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0, -10, 0),
                  child: Text(
                    title.substring(0, _animation.value.toInt()),
                    style: titleOneTextStyle.copyWith(fontSize: 46),
                  ),
                ),
                Text(
                  title.substring(_animation.value.toInt()),
                  style: titleOneTextStyle.copyWith(fontSize: 46),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is the real project i have made,\n you can believe me.",
            style: paragraphTextStyle.copyWith(fontSize: fontSize_18),
            textAlign: leftItem ? TextAlign.right : TextAlign.left,
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

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.value,
  });

  final double value;
  final factor = 2000;

  double getShiftedFraction({
    required double from,
    required double to,
  }) {
    final clumped = (value).clamp(from, to);
    final shifted = clumped - from;
    return (shifted * factor).toInt().toDouble();
  }

  @override
  void paint(Canvas canvas, Size size) {
    const circle1StartAt = 0.0;
    const circle2StartAt = 0.1;
    const circle3StartAt = 0.2;
    const circle4StartAt = 0.3;

    const circleLength = 0.1;

    const circle1EndAt = circle1StartAt + circleLength;
    const circle2EndAt = circle2StartAt + circleLength;
    const circle3EndAt = circle3StartAt + circleLength;
    const circle4EndAt = circle4StartAt + circleLength;

    const center = Offset.zero; //Offset(size.width / 2, size.height / 2);

    final circleBrash1 = Paint()
      ..color = randomColor1
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: circle1StartAt, to: circle1EndAt) * 2;

    final circleBrash2 = Paint()
      ..color = randomColor2
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: circle2StartAt, to: circle2EndAt) * 2;

    final circleBrash3 = Paint()
      ..color = randomColor3
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: circle3StartAt, to: circle3EndAt) * 2;

    final circleBrash4 = Paint()
      ..color = randomColor4
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: circle4StartAt, to: circle4EndAt) * 2;

    canvas.drawCircle(
      center,
      circleBrash1.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: circle1EndAt, to: 1)),
      circleBrash1,
    );
    canvas.drawCircle(
      center,
      circleBrash2.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: circle2EndAt, to: 1)),
      circleBrash2,
    );
    canvas.drawCircle(
      center,
      circleBrash3.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: circle3EndAt, to: 1)),
      circleBrash3,
    );
    canvas.drawCircle(
      center,
      circleBrash4.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: circle4EndAt, to: 1)),
      circleBrash4,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
