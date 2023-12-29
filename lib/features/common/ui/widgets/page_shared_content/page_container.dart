import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/clock/clock_view.dart';
import 'package:portfolio/features/common/ui/widgets/custom_loading_animation.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/social_column.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/text_background.dart';
import 'package:portfolio/features/common/ui/widgets/menu/top_menu_bar.dart';
import 'package:portfolio/features/common/ui/widgets/menu/top_menu_bar_collapsed.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/random_appear_animation_text.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:supercharged/supercharged.dart';

class BlobHoverData {
  final Color? color;
  final double size;

  const BlobHoverData({
    required this.color,
    required this.size,
  });

  const BlobHoverData.initial() : this(color: null, size: 40);

  BlobHoverData copyWith({
    Color? color,
    double? size,
    bool? isHovering,
  }) {
    return BlobHoverData(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }
}

class PageContainer extends StatefulWidget {
  const PageContainer({
    this.menuItem,
    this.children = const [],
    this.isLoading = false,
    this.hasMenu = true,
    this.showSocial = true,
    this.showClock = true,
    this.blobHoverData = const BlobHoverData.initial(),
    this.showMadeWithText = false,
    super.key,
  });

  final bool showMadeWithText;
  final bool isLoading;
  final bool hasMenu;
  final bool showSocial;
  final bool showClock;
  final List<Widget> children;
  final String? menuItem;
  final BlobHoverData blobHoverData;

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> with TickerProviderStateMixin {
  double mouseX = 0;
  double mouseY = 0;
  bool reGurGur = true;

  void _updateLocation(PointerHoverEvent event) {
    setState(() {
      mouseX = event.localPosition.dx;
      mouseY = event.localPosition.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: context.isMobile
          ? buildPageContent(context, height)
          : MouseRegion(
              onHover: _updateLocation,
              child: buildPageContent(context, height),
            ),
    );
  }

  Stack buildPageContent(BuildContext context, double height) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // ?
        if (widget.showMadeWithText)
          Positioned(
              right: 50,
              bottom: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Made with",
                    style: subtitleTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Gap(10),
                  Icon(
                    Icons.favorite,
                    color: appColors.accentColor,
                    size: 16,
                  ),
                  const Gap(10),
                  Text(
                    "Flutter",
                    style: subtitleTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Gap(10),
                  SvgPicture.asset(
                    Assets.image.flutter,
                    colorFilter: ColorFilter.mode(appColors.accentColor, BlendMode.srcIn),
                    width: 14,
                    height: 14,
                    semanticsLabel: 'logo',
                  ),
                ],
              )),
        // ?*
        TextBackground(
          onTap: () async {
            if (!context.isMobile) {
              setState(() {
                reGurGur = !reGurGur;
              });
              await Future.delayed(100.milliseconds);
              setState(() {
                reGurGur = !reGurGur;
              });
            }
          },
        ),
        // ? Random appear animation
        if (widget.menuItem != null && reGurGur)
          Positioned(
            left: context.responsiveSize(desktop: -50),
            bottom: context.responsiveSize(desktop: -100),
            child: RandomAppearAnimationText(text: widget.menuItem!),
          ),
        // ? Clock
        if (widget.showClock)
          Positioned(
            bottom: 30,
            right: context.responsiveSize(desktop: 70, tablet: 70, mobile: 40),
            child: const ClockView(),
          ),
        if (!context.isMobile) buildAnimatedMouseFollower(height),
        // ? content goes here
        ...widget.children,
        // ? Social Column
        if (widget.showSocial)
          const Positioned(
            right: 0,
            bottom: 0,
            child: SocialColumn(),
          ),
        // ? Top Menu
        if (widget.hasMenu)
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: context.isMobile
                ? TopMenuBarCollapsed(
                    selectedItem: widget.menuItem,
                  )
                : TopMenuBar(
                    selectedItem: widget.menuItem,
                  ),
          ),
        // ? Logo
        // Positioned(
        //   top: 10,
        //   left: 20,
        //   child:

        // Image.asset(
        //   Assets.image.carbonLogo.path,
        //   color: appColors.accentColor.darken(30),
        //   width: context.responsiveSize(desktop: 120, tablet: 100, mobile: 80),
        //   cacheWidth: 120,
        //   cacheHeight: 98,
        // ),
        // ),
        // ? Loading
        if (widget.isLoading) const CustomLoadingAnimation(),
      ],
    );
  }

  Widget buildAnimatedMouseFollower(double height) {
    return AnimatedPositioned(
      duration: 400.milliseconds,
      curve: Curves.easeOutBack,
      bottom: 0,
      top: mouseY * 2 - height,
      left: mouseX - (400 / 2),
      child: IgnorePointer(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Center(
            child: AnimatedContainer(
              duration: 400.milliseconds,
              curve: Curves.ease,
              height: widget.blobHoverData.size.toDouble(),
              width: widget.blobHoverData.size.toDouble(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.blobHoverData.size / 2),
                border: widget.blobHoverData.color == null
                    ? Border.all(color: appColors.accentColor.withOpacity(.2))
                    : null,
                color: widget.blobHoverData.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
