import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';
import 'package:portfolio/features/common/paths/color_splash_painter.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/ui/widgets/corner_cut_style_button.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/projects/models/project.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItemView extends StatefulWidget {
  const ProjectItemView({
    this.blobHoverEffect,
    this.borderColor,
    super.key,
    required this.project,
  });

  final void Function(BlobHoverData data)? blobHoverEffect;
  final Color? borderColor;
  final Project project;

  @override
  State<ProjectItemView> createState() => _ProjectItemViewState();
}

class _ProjectItemViewState extends State<ProjectItemView> with TickerProviderStateMixin {
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
            padding: EdgeInsets.symmetric(horizontal: context.responsiveSize(desktop: 40), vertical: context.responsiveSize(desktop: 40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                projectDetail(),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: ClipPath(
            clipper: CornerCutBorderClipper(
              width: 3,
              cornerRadius: context.responsiveSize(desktop: 80, tablet: 80, mobile: 60),
            ),
            child: Container(color: widget.borderColor ?? defaultBorderColor),
          ),
        ),
        Positioned.fill(
          child: ClipPath(
            clipper: CornerCutBorderClipper(
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

  //
  // Widget projectImage({required bool leftItem}) {
  //   return MouseRegion(
  //     onEnter: (_) => setState(() => imageHovered = true),
  //     onExit: (_) => setState(() => imageHovered = false),
  //     child: Container(
  //       height: 325,
  //       width: 200,
  //       margin: const EdgeInsets.all(20),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: widget.borderColor ?? defaultBorderColor, width: 2),
  //       ),
  //       child: Stack(
  //         clipBehavior: Clip.none,
  //         children: [
  //           Positioned.fill(
  //             child: ClipRect(
  //               child: AnimatedScale(
  //                 scale: imageHovered ? 1.8 : 1.4,
  //                 curve: Curves.ease,
  //                 duration: 1000.milliseconds,
  //                 child: Image.asset(
  //                   Assets.image.mockAppUi.path,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Positioned.fill(
  //             child: AnimatedContainer(
  //               duration: 1000.milliseconds,
  //               curve: Curves.ease,
  //               color:
  //               imageHovered ? appColors.backgroundColor.withOpacity(0) : appColors.backgroundColor.withOpacity(.2),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget projectDetail() {
    return Container(
      width: context.responsiveSize(desktop: 360, tablet: 300, mobile: 200),
      padding: EdgeInsets.all(context.responsiveSize(desktop: 20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectIconOrPlaceholder(widget.project, context),
          SizedBox(height: context.responsiveSize(desktop: 30)),
          // ? Project title in project card
          context.isMobile ? buildTitleMobile(widget.project.name) : buildAnimatedTitle(),
          const SizedBox(
            height: 10,
          ),
          // ? Project description in project card
          Text(
            widget.project.description,
            style: paragraphTextStyle.copyWith(fontSize: context.responsiveSize(desktop: fontSize_18)),
            textAlign: TextAlign.right,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: context.responsiveSize(desktop: 40)),
          // ? Explore button
          CornerCutButton(
            text: "Explore",
            onTap: () {
              runSplashAnimation();
              showDialog(
                context: context,
                builder: (context) {
                  return buildDialog(
                    context,
                    widget.project,
                  );
                },
              );
            },
            fontSize: context.responsiveSize(desktop: 18),
            // padding: EdgeInsets.all(context.responsiveSize(desktop: 14)),
            cornerCutRadius: context.responsiveSize(desktop: 18),
            elevation: context.responsiveSize(desktop: 10),
          )
        ],
      ),
    );
  }

  MouseRegion buildAnimatedTitle() {
    final style = titleOneTextStyle.copyWith(
      fontSize: context.responsiveSize(desktop: 40, tablet: 40, mobile: 30),
      fontFamily: ibmPlexMono,
    );
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
        textAlign: TextAlign.right,
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.project.name.substring(0, _titleAnimation.value.toInt()),
              style: style,
            ),
            TextSpan(
              text: widget.project.name.substring(_titleAnimation.value.toInt()),
              style: style.copyWith(
                color: appColors.foregroundColor.darken(70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitleMobile(String title) {
    return Text(
      title,
      style: titleOneTextStyle.copyWith(
          fontSize: context.responsiveSize(desktop: 46, tablet: 46, mobile: 30), fontFamily: ibmPlexMono),
      textAlign: TextAlign.right,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildDialog(BuildContext context, Project project) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Project Details",
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildProjectIconOrPlaceholder(project, context),
            const SizedBox(
              height: 40,
            ),
            Text(project.name,
                style: titleOneTextStyle.copyWith(
                  fontSize: context.responsiveSize(desktop: 40, tablet: 36, mobile: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(project.description,
                style: paragraphTextStyle.copyWith(
                  fontSize: context.responsiveSize(desktop: fontSize_18),
                )),
            const SizedBox(
              height: 40,
            ),
            CornerCutButton(
              text: "Visit project",
              onTap: () async {
                await launchUrl(Uri.parse(project.link));
              },
            )
          ],
        ),
      ),
    );
  }

  Container buildProjectIconOrPlaceholder(Project project, BuildContext context) {
    return Container(
      child: project.imagePath != null ? buildProjectIcon(context, project) : buildProjectIconPlaceholder(context),
    );
  }

  Icon buildProjectIconPlaceholder(BuildContext context) {
    return Icon(
      EvaIcons.grid,
      color: appColors.foregroundColorDark,
      size: context.responsiveSize(
        desktop: 80,
        tablet: 80,
        mobile: 60,
      ),
    );
  }

  Widget buildProjectIcon(BuildContext context, Project project) {
    return Image.network(
      project.imagePath!,
      height: context.responsiveSize(
        desktop: 80,
        tablet: 80,
        mobile: 60,
      ),
      errorBuilder: (context, error, stackTrace) {
        return buildProjectIconPlaceholder(context);
      },
    );
  }
}
