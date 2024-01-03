import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/features/common/provider/blob_data_provider.dart';
import 'package:portfolio/features/common/ui/widgets/arc_text.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/clock/clock_view.dart';
import 'package:portfolio/features/common/ui/widgets/custom_loading_animation.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/mouse_follower.dart';
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
  final Widget? child;

  const BlobHoverData({
    required this.color,
    required this.size,
    this.child,
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

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> with TickerProviderStateMixin {
  double mouseX = 0;
  double mouseY = 0;
  bool reGurGur = true;

  // late BlobHoverData blobHoverData;

  void _updateLocation(PointerHoverEvent event) {
    setState(() {
      mouseX = event.localPosition.dx;
      mouseY = event.localPosition.dy;
    });
  }

  @override
  void initState() {
    super.initState();
    // blobHoverData = widget.blobHoverData;
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
        if (!context.isMobile)
          AnimatedPositioned(
            duration: 800.milliseconds,
            curve: Curves.elasticOut,
            top: mouseY - 200,
            left: mouseX - 200,
            child: const MouseFollower(),
          ),
        // ? Made with Flutter
        if (widget.showMadeWithText)
          Positioned(
            right: 50,
            bottom: 0,
            child: buildMadeWith(context),
          ),
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

  Widget buildMadeWith(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return MouseRegion(
        onEnter: (event) {
          ref.read(blobDataProvider.notifier).update(
                color: appColors.foregroundColor,
                size: context.responsiveSize(desktop: 200),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ArcText(
                      radius: context.responsiveSize(desktop: 60),
                      text: "Made with Flutter.   Made with flutter.",
                      textStyle: titleOneTextStyle.copyWith(
                        color: appColors.accentColor.darken(30),
                        fontSize: context.responsiveSize(desktop: 22),
                      ),
                    ),
                    Icon(Icons.favorite, size: 100, color: appColors.accentColor),
                  ],
                ),
              );
        },
        onExit: (event) {
          ref.read(blobDataProvider.notifier).reset();
        },
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
        ),
      );
    });
  }
}
