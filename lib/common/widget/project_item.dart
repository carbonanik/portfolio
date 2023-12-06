import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/common/widget/corner_cut_style_button.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/page/menu/work_page_2.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    this.blobHoverEffect,
    this.leftItem = true,
    this.borderColor,
    Key? key,
    required this.project,
  }) : super(key: key);

  final bool leftItem;
  final void Function(BlobHoverData data)? blobHoverEffect;
  final Color? borderColor;
  final Project project;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> with TickerProviderStateMixin {
  bool imageHovered = false;
  bool hovered = false;

  // String title = widget.project.name;
  final defaultBorderColor = appColors.accentColor.withOpacity(.2);

  late AnimationController _titleAnimationController;
  late AnimationController _borderAnimationController;
  late Animation<double> _titleAnimation;
  late Animation<double> _borderAnimation;

  @override
  void dispose() {
    super.dispose();
    _titleAnimationController.dispose();
    _borderAnimationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titleAnimationController = AnimationController(duration: 210.milliseconds, vsync: this);

    _borderAnimationController = AnimationController(duration: 1000.milliseconds, vsync: this);

    _titleAnimation = Tween<double>(
      begin: 0,
      end: widget.project.name.length.toDouble(),
    ).animate(_titleAnimationController)
      ..addListener(() {
        setState(() {});
      });

    _borderAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_borderAnimationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (!_borderAnimationController.isAnimating) {
          _borderAnimationController.reset();
          _borderAnimationController.forward();
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
              clipper: CornerCutBorderClipper(leftCut: widget.leftItem, width: 3),
              child: Container(color: widget.borderColor ?? defaultBorderColor),
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: CornerCutBorderClipper(leftCut: widget.leftItem, width: 3),
              child: CustomPaint(
                foregroundPainter: ColorSplashPainter(value: _borderAnimation.value),
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
                color:
                    imageHovered ? appColors.backgroundColor.withOpacity(0) : appColors.backgroundColor.withOpacity(.2),
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
                _titleAnimationController.forward();
                // if (!_circleAnimationController.isAnimating ) {
                //   _circleAnimationController.reset();
                //   _circleAnimationController.forward();
                // }
              });
            },
            onExit: (_) {
              setState(() {
                _titleAnimationController.reverse();
                // _circleAnimationController.reverse();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0, -10, 0),
                  child: Text(
                    widget.project.name.substring(0, _titleAnimation.value.toInt()),
                    style: titleOneTextStyle.copyWith(fontSize: 46, fontFamily: ibmPlexMono),
                  ),
                ),
                Text(
                  widget.project.name.substring(_titleAnimation.value.toInt()),
                  style: titleOneTextStyle.copyWith(fontSize: 46, fontFamily: ibmPlexMono),
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

class ColorSplashPainter extends CustomPainter {
  ColorSplashPainter({
    required this.value,
  });

  final double value;
  final factor = 2000;

  // get sliced fraction of the animation value
  // 0-----from----------to-----------1
  //       .3-----------.6             - clamped
  //       .0-----------.3             - shifted
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
    // color circles starts at these time fragments of the animation
    const c1StartAt = 0.0;
    const c2StartAt = 0.1;
    const c3StartAt = 0.2;
    const c4StartAt = 0.3;

    // how long will the color circles last in the animation
    const cLength = 0.1;

    // color circles ends at these time fragments of the animation
    const c1EndAt = c1StartAt + cLength;
    const c2EndAt = c2StartAt + cLength;
    const c3EndAt = c3StartAt + cLength;
    const c4EndAt = c4StartAt + cLength;

    const cStartsFrom = Offset.zero;

    final circleBrash1 = Paint()
      ..color = randomColor1
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c1StartAt, to: c1EndAt) * 2;

    final circleBrash2 = Paint()
      ..color = randomColor2
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c2StartAt, to: c2EndAt) * 2;

    final circleBrash3 = Paint()
      ..color = randomColor3
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c3StartAt, to: c3EndAt) * 2;

    final circleBrash4 = Paint()
      ..color = randomColor4
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c4StartAt, to: c4EndAt) * 2;

    canvas.drawCircle(
      cStartsFrom,
      circleBrash1.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c1EndAt, to: 1)),
      circleBrash1,
    );
    canvas.drawCircle(
      cStartsFrom,
      circleBrash2.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c2EndAt, to: 1)),
      circleBrash2,
    );
    canvas.drawCircle(
      cStartsFrom,
      circleBrash3.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c3EndAt, to: 1)),
      circleBrash3,
    );
    canvas.drawCircle(
      cStartsFrom,
      circleBrash4.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c4EndAt, to: 1)),
      circleBrash4,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
