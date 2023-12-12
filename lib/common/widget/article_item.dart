import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/common/widget/corner_cut_style_button.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({
    this.blobHoverEffect,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  final void Function(BlobHoverData data)? blobHoverEffect;
  final Color? borderColor;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool hovered = false;
  final bool leftCut = true;

  String title = "Python programming Tutorial for biggners";
  final defaultBorderColor = appColors.accentColor;
  final hoverOffset = const Offset(-.02, -.02);
  final hoverDuration = 200.milliseconds;
  final hoverCurve = Curves.fastOutSlowIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ? padding for hover shift effect to not clip
      padding: const EdgeInsets.only(top: 10),
      // ? mobile = click | desktop = hover
      child: context.isMobile
          ? GestureDetector(
              onTap: () {
                setState(() {
                  if (!hovered) {
                    hovered = true;
                    Future.delayed(5.seconds, () {
                      setState(() {
                        hovered = false;
                      });
                    });
                  }
                });
              },
              child: buildArticleView(),
            )
          : MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                setState(() {
                  hovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  hovered = false;
                });
              },
              child: buildArticleView(),
            ),
    );
  }

  Stack buildArticleView() {
    return Stack(
      children: [
        // ? back border
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appColors.accentColor.darken(30),
                  width: 5,
                ),
                right: BorderSide(
                  color: appColors.accentColor.darken(30),
                  width: 5,
                ),
              ),
            ),
          ),
        ),
        // ? hover animation
        AnimatedSlide(
          curve: hoverCurve,
          duration: hoverDuration,
          offset: hovered ? hoverOffset : const Offset(0, 0),
          child: Stack(
            children: [
              // ? image
              Positioned.fill(
                child: SizedBox(
                  child: ClipPath(
                    clipper: CornerCutBorderClipper(
                      leftCut: leftCut,
                      width: 10,
                      filled: true,
                    ),
                    child: AnimatedScale(
                      scale: hovered ? 1.4 : 1.2,
                      curve: Curves.ease,
                      duration: 1000.milliseconds,
                      child: Image.asset(
                        Assets.image.bannarBlack.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // ? dark fill
              Positioned.fill(
                child: ClipPath(
                  clipper: CornerCutBorderClipper(leftCut: leftCut, filled: true, width: 10),
                  child: AnimatedContainer(
                    curve: hoverCurve,
                    duration: hoverDuration,
                    color: hovered ? Colors.transparent : Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              // ? detail
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 60),
                    articleDetail(),
                    // const SizedBox(height: 40),
                  ],
                ),
              ),
              // ? read button
              Positioned(
                right: context.responsiveSize(desktop: 20),
                bottom: context.responsiveSize(desktop: 20),
                child: Padding(
                  padding: EdgeInsets.all(context.responsiveSize(desktop: 40)),
                  child: AnimatedOpacity(
                    duration: hoverDuration,
                    opacity: hovered ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 100),
                        CornerCutButton(
                          elevation: context.responsiveSize(desktop: 10),
                          text: "READ",
                          onTap: () {},
                          transparent: false,
                          colorBorder: true,
                        ),
                        // const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
              // ? border
              Positioned.fill(
                child: ClipPath(
                  clipper: CornerCutBorderClipper(leftCut: leftCut),
                  child: Container(color: appColors.accentColor.darken(70)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget articleDetail() {
    return SizedBox(
      // ? card width will be taken from this width
      width: context.responsiveSize(desktop: 340, tablet: 340, mobile: 220),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(height: 180),
          Text(
            "#Python, #Docker, #API",
            style: subtitleTextStyle.copyWith(
              fontSize: context.responsiveSize(
                desktop: 16,
                tablet: 16,
                mobile: 12,
              ),
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            title,
            style: titleOneTextStyle.copyWith(
              fontSize: context.responsiveSize(
                desktop: 48,
                tablet: 48,
                mobile: 28,
              ),
            ),
            textAlign: TextAlign.end,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Create your first python app in 5 minutes",
            style: paragraphTextStyle.copyWith(
              fontSize: context.responsiveSize(
                desktop: 18,
                tablet: 18,
                mobile: 14,
              ),
            ),
            textAlign: TextAlign.end,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
