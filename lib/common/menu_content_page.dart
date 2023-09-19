import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/custom_loading_animation.dart';
import 'package:portfolio/common/widget/social_column.dart';
import 'package:portfolio/common/widget/text_background.dart';
import 'package:portfolio/common/widget/top_menu_bar.dart';
import 'package:portfolio/page/random_appear_animation_text.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:supercharged/supercharged.dart';

class BlobHoverData {
  final Color? color;
  final double size;

  const BlobHoverData({
    required this.color,
    required this.size,
  });

  const BlobHoverData.initial()
      : this(
          color: null,
          size: 40,
        );

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

class MenuContentPage extends StatefulWidget {
  const MenuContentPage({
    required this.menuItem,
    this.children,
    this.isLoading = false,
    this.showMenu = true,
    this.showSocial = true,
    this.blobHoverData = const BlobHoverData.initial(),
    Key? key,
  }) : super(key: key);

  final bool isLoading;
  final bool showMenu;
  final bool showSocial;
  final List<Widget>? children;
  final String menuItem;
  final BlobHoverData blobHoverData;

  @override
  State<MenuContentPage> createState() => _MenuContentPageState();
}

class _MenuContentPageState extends State<MenuContentPage> with TickerProviderStateMixin {
  double mouseX = 0;
  double mouseY = 0;

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
      body: MouseRegion(
        onHover: _updateLocation,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const TextBackground(),
            Positioned(
              left: -50,
              bottom: -100,
              child: RandomAppearAnimationText(text: widget.menuItem),
            ),
            buildAnimatedMouseFollower(height),

            // content goes here
            ...widget.children ?? [],

            widget.showSocial
                ? const Positioned(
                    right: 0,
                    bottom: 0,
                    child: SocialColumn(),
                  )
                : const SizedBox(),

            widget.showMenu
                ? Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: TopMenuBar(
                      selectedItem: widget.menuItem,
                    ),
                  )
                : const SizedBox(),
            widget.isLoading ? const CustomLoadingAnimation() : const SizedBox(),
          ],
        ),
      ),
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
        child: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Center(
              child:

                  // AnimatedContainer(
                  //   duration: 500.milliseconds,
                  //   curve: Curves.ease,
                  //   height: widget.blobHoverData.isHovering ? widget.blobHoverData.size.toDouble() : 40,
                  //   width: widget.blobHoverData.isHovering ? widget.blobHoverData.size.toDouble() : 40,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(widget.blobHoverData.isHovering ? widget.blobHoverData.size / 2 : 20),
                  //     border: widget.blobHoverData.isHovering
                  //         ? Border.all(color: accentColor.withOpacity(.0))
                  //         : Border.all(color: accentColor.withOpacity(.2)),
                  //     color: widget.blobHoverData.isHovering ? widget.blobHoverData.color : null,
                  //   ),
                  // ),
                  AnimatedContainer(
                duration: 400.milliseconds,
                curve: Curves.ease,
                height: widget.blobHoverData.size.toDouble(),
                width: widget.blobHoverData.size.toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.blobHoverData.size / 2),
                  border: widget.blobHoverData.color == null ? Border.all(color: accentColor.withOpacity(.2)) : null,
                  color: widget.blobHoverData.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
