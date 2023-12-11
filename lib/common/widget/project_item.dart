import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/paths/color_splash_painter.dart';
import 'package:portfolio/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/common/widget/corner_cut_style_button.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/page/menu/work/work_page.dart';
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

  void runSplashAnimation() {
    if (!_borderAnimationController.isAnimating) {
      _borderAnimationController.reset();
      _borderAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? GestureDetector(
            onTap: () {
              runSplashAnimation();
            },
            child: buildDetailsView(context))
        : MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              runSplashAnimation();
            },
            child: buildDetailsView(context),
          );
  }

  Stack buildDetailsView(BuildContext context) {
    return Stack(
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
            padding: EdgeInsets.all(context.responsiveSize(desktop: 40)),
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
            clipper: CornerCutBorderClipper(
              leftCut: widget.leftItem,
              width: 3,
              cornerRadius: context.responsiveSize(desktop: 80, tablet: 80, mobile: 60),
            ),
            child: Container(color: widget.borderColor ?? defaultBorderColor),
          ),
        ),
        Positioned.fill(
          child: ClipPath(
            clipper: CornerCutBorderClipper(
              leftCut: widget.leftItem,
              width: 3,
              cornerRadius: context.responsiveSize(desktop: 80, tablet: 80, mobile: 60),
            ),
            child: CustomPaint(
              foregroundPainter: ColorSplashPainter(value: _borderAnimation.value),
            ),
          ),
        ),
      ],
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
      width: context.responsiveSize(desktop: 360, tablet: 300, mobile: 200),
      padding: EdgeInsets.all(context.responsiveSize(desktop: 20)),
      child: Column(
        crossAxisAlignment: leftItem ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.folder,
            color: appColors.foregroundColorDark,
            size: context.responsiveSize(desktop: 80, tablet: 80, mobile: 60),
          ),
          SizedBox(height: context.responsiveSize(desktop: 30)),
          context.isMobile ? buildTitle() : buildAnimatedTitle(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is the real project i have made, you can believe me.",
            style: paragraphTextStyle.copyWith(fontSize: context.responsiveSize(desktop: fontSize_18)),
            textAlign: leftItem ? TextAlign.right : TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: context.responsiveSize(desktop: 40)),
          CornerCutButton(
            text: "Explore",
            onTap: () {
              runSplashAnimation();
            },
            fontSize: context.responsiveSize(desktop: 18),
            padding: EdgeInsets.all(context.responsiveSize(desktop: 18)),
            cornerCutRadius: context.responsiveSize(desktop: 18),
            elevation: context.responsiveSize(desktop: 10),
          )
        ],
      ),
    );
  }

  MouseRegion buildAnimatedTitle() {
    return MouseRegion(
        onEnter: (_) {
          setState(() {
            _titleAnimationController.forward();
          });
        },
        onExit: (_) {
          setState(() {
            _titleAnimationController.reverse();
          });
        },
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: widget.leftItem ? TextAlign.right : TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.project.name.substring(0, _titleAnimation.value.toInt()),
                style: titleOneTextStyle.copyWith(
                  fontSize: context.responsiveSize(desktop: 46, tablet: 46, mobile: 30),
                  fontFamily: ibmPlexMono,
                ),
              ),
              TextSpan(
                text: widget.project.name.substring(_titleAnimation.value.toInt()),
                style: titleOneTextStyle.copyWith(
                  fontSize: context.responsiveSize(desktop: 46, tablet: 46, mobile: 30),
                  fontFamily: ibmPlexMono,
                  color: appColors.foregroundColor.darken(70),
                ),
              ),
            ],
          ),
        )
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        // Transform(
        //   transform: Matrix4.translationValues(0, -10, 0),
        //   child: Container(
        //     color: Colors.redAccent,
        //     // width: context.responsiveSize(desktop: 320, tablet: 270, mobile: 0),
        //     child: Text(
        //       widget.project.name.substring(0, _titleAnimation.value.toInt()),
        //       style: titleOneTextStyle.copyWith(
        //           fontSize: context.responsiveSize(desktop: 46, tablet: 46, mobile: 30), fontFamily: ibmPlexMono),
        //       textAlign: TextAlign.left,
        //     ),
        //
        //   ),
        // ),
        // Container(
        //   color: Colors.greenAccent,
        //   width: context.responsiveSize(desktop: 320, tablet: 270, mobile: 0),
        //   child: Text(
        //     widget.project.name.substring(_titleAnimation.value.toInt()),
        //     style: titleOneTextStyle.copyWith(
        //         fontSize: context.responsiveSize(desktop: 46, tablet: 46, mobile: 30), fontFamily: ibmPlexMono),
        //     textAlign: TextAlign.right,
        //     maxLines: 2,
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),
        // ],
        // ),
        );
  }

  Widget buildTitle() {
    return Text(
      widget.project.name,
      style: titleOneTextStyle.copyWith(
          fontSize: context.responsiveSize(desktop: 46, tablet: 46, mobile: 30), fontFamily: ibmPlexMono),
      textAlign: TextAlign.right,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
