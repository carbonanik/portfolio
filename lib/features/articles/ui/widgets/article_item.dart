import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({
    required this.article,
    this.blobHoverEffect,
    this.borderColor,
    super.key,
  });

  final void Function(BlobHoverData data)? blobHoverEffect;
  final Color? borderColor;
  final Article article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> with SingleTickerProviderStateMixin {
  String title = "Python programming Tutorial for biggners";
  final defaultBorderColor = appColors.accentColor;
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
    // final width = context.adaptiveResponsiveWidth(desktop: 340, tablet: 340, mobile: 200);
    // final height = context.isMobile
    //     ? context.adaptiveResponsiveWidth(desktop: 0, mobile: 240)
    //     : context.adaptiveResponsiveHeight(desktop: 400, tablet: 300);
    return Stack(
      children: [
        // ? back border
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appColors.accentColor.darken(30),
                  width: 3,
                ),
                right: BorderSide(
                  color: appColors.accentColor.darken(30),
                  width: 3,
                ),
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
              child: buildAnimatedSlide(),
            );
          },
        ),
      ],
    );
  }

  Widget buildAnimatedSlide() {
    return Stack(
      children: [
        Container(
          // ? card width will be taken from this width
          width: context.adaptiveResponsiveWidth(desktop: 340, tablet: 340, mobile: 200),
        ),
        // ? image
        Positioned.fill(
          child: SizedBox(
            child: ClipPath(
              clipper: CornerCutBorderClipper(
                width: 10,
                cornerRadius: context.adaptiveResponsiveWidth(desktop: 80, tablet: 80, mobile: 60),
                filled: true,
              ),
              child: Image.asset(
                Assets.image.bannarBlack.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: SizedBox(
            child: ClipPath(
              clipper: CornerCutBorderClipper(
                width: 10,
                cornerRadius: context.adaptiveResponsiveWidth(desktop: 80, tablet: 80, mobile: 60),
                filled: true,
              ),
              child: Container(
                color: appColors.accentColor.darken(90).withOpacity(.4),
              ),
            ),
          ),
        ),
        // ? detail
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(
              right: context.responsiveSize(desktop: 40),
              left: context.responsiveSize(desktop: 20),
            ),
            child: Center(
              child: articleDetail(),
            ),
          ),
        ),

        // ? border
        Positioned.fill(
          child: ClipPath(
            clipper: CornerCutBorderClipper(
              width: 4,
              cornerRadius: context.adaptiveResponsiveWidth(desktop: 80, tablet: 80, mobile: 60),
            ),
            child: Container(
              color: appColors.accentColor,
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
            "#Python, #Docker, #API",
            style: subtitleTextStyle.copyWith(
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
            title,
            style: titleOneTextStyle.copyWith(
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
