import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class ArticleItemV2 extends StatefulWidget {
  const ArticleItemV2({
    required this.article,
    this.borderColor,
    required this.height,
    required this.width,
    super.key,
  });

  final Color? borderColor;
  final Article article;
  final double height;
  final double width;

  @override
  State<ArticleItemV2> createState() => _ArticleItemStateV2();
}

class _ArticleItemStateV2 extends State<ArticleItemV2> with SingleTickerProviderStateMixin {
  String title = "Python programming Tutorial for biggners";
  late final Color defaultBorderColor = Theme.of(context).colorScheme.primary;
  final hoverOffset = const Offset(-.02, -.02);
  final hoverDuration = 200.milliseconds;
  final hoverCurve = Curves.fastOutSlowIn;
  late AnimationController _slideAnimationController;

  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(duration: hoverDuration, vsync: this);
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-10, -10),
    ).animate(_slideAnimationController);
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ? padding for hover shift effect to not clip
      padding: const EdgeInsets.only(top: 10),
      // ? mobile = click | desktop = hover
      child: GestureDetector(
        onLongPress: () {
          if (_slideAnimationController.value != 0) {
            setState(() {
              _slideAnimationController.forward();
              Future.delayed(3.seconds, () {
                setState(() {
                  _slideAnimationController.reverse();
                });
              });
            });
          }
        },
        onTap: () {
          AutoRouter.of(context).push(ArticleOpenPageRoute(id: widget.article.id));
        },
        child: context.isMobile
            ? buildArticleView()
            : MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) {
                  setState(() {
                    // hovered = true;
                    _slideAnimationController.forward();
                  });
                },
                onExit: (event) {
                  setState(() {
                    // hovered = false;
                    _slideAnimationController.reverse();
                  });
                },
                child: buildArticleView(),
              ),
      ),
    );
  }

  Stack buildArticleView() {
    return Stack(
      children: [
        // ? back border
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.tertiary.darken(70),
                width: 3,
              ),
              right: BorderSide(
                color: Theme.of(context).colorScheme.tertiary.darken(70),
                width: 3,
              ),
            ),
          ),
        ),
        // ? hover animation
        AnimatedBuilder(
          animation: _slideAnimationController,
          builder: (context, child) {
            return Transform.translate(
              offset: _slideAnimation.value,
              child: buildAnimatedSlide(widget.height, widget.width),
            );
          },
        ),
      ],
    );
  }

  Widget buildAnimatedSlide(height, width) {
    return Stack(
      children: [
        // Container(
        //   // ? card width will be taken from this width
        //   width: width,
        //   height: height,
        // ),
        // ? image
        // Positioned.fill(
        //   child: ClipPath(
        //     clipper: CornerCutBorderClipper(
        //       width: 10,
        //       cornerRadius: context.adaptiveResponsiveWidth(desktop: 80, tablet: 80, mobile: 60),
        //       filled: true,
        //     ),
        //     child: Image.asset(
        //       Assets.image.bannarBlack.path,
        //       fit: BoxFit.cover,
        //       cacheWidth: 100,
        //       cacheHeight: 100,
        //     ),
        //   ),
        // ),

        // ? shadow over image
        SizedBox(
          width: width,
          height: height,
          child: ClipPath(
            clipper: CornerCutBorderClipper(
              width: 10,
              cornerRadius: context.adaptiveResponsiveWidth(desktop: 80, tablet: 80, mobile: 60),
              filled: true,
            ),
            child: Container(
              color: Theme.of(context).colorScheme.primary.darken(90).withOpacity(.4),
            ),
          ),
        ),
        // ? detail
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(
            right: context.responsiveSize(desktop: 40),
            left: context.responsiveSize(desktop: 20),
          ),
          child: Center(
            child: articleDetail(),
          ),
        ),

        // ? border
        SizedBox(
          width: width,
          height: height,
          child: ClipPath(
            clipper: CornerCutBorderClipper(
              width: 4,
              cornerRadius: context.adaptiveResponsiveWidth(desktop: 80, tablet: 80, mobile: 60),
            ),
            child: Container(
              color: Theme.of(context).colorScheme.primary.darken(80),
            ),
          ),
        ),
      ],
    );
  }

  Widget articleDetail() {
    return Padding(
      padding: EdgeInsets.only(top: context.responsiveSize(desktop: 40, tablet: 40, mobile: 40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "#${widget.article.tags.join(", #")}",
            style: subtitleTextStyle(context) .copyWith(
              fontSize: context.adaptiveResponsiveWidth(
                desktop: 16,
                tablet: 16,
                mobile: 12,
              ),
            ),
            textAlign: TextAlign.end,
            maxLines: 1,
          ),
          Text(
            widget.article.title.text,
            style: titleOneTextStyle(context) .copyWith(
              fontSize: context.adaptiveResponsiveWidth(
                desktop: 30,
                tablet: 26,
                mobile: 20,
              ),
            ),
            textAlign: TextAlign.end,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: context.adaptiveResponsiveHeight(desktop: 30),
          ),
        ],
      ),
    );
  }
}
