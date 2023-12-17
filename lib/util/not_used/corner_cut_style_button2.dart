import 'package:flutter/material.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class CornerCutButton2 extends StatefulWidget {
  final String text;

  // final Widget? child;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool transparent;
  final bool colorBorder;
  final EdgeInsets? padding;
  final double? cornerCutRadius;
  final double elevation;

  const CornerCutButton2({
    super.key,
    required this.text,
    // this.child,
    this.onTap,
    this.fontSize,
    this.transparent = true,
    this.colorBorder = false,
    this.padding,
    this.cornerCutRadius,
    this.elevation = 10,
  });

  @override
  State<CornerCutButton2> createState() => _CornerCutButtonState();
}

class _CornerCutButtonState extends State<CornerCutButton2> with TickerProviderStateMixin {
  bool pointerDown = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        setState(() {
          pointerDown = true;
        });
      },
      onPointerUp: (_) {
        setState(() {
          pointerDown = false;
        });
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: widget.transparent ? null : appColors.backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: appColors.foregroundColor.darken(70),
                    width: 3,
                  ),
                  right: BorderSide(
                    color: appColors.foregroundColor.darken(70),
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
          AnimatedSlide(
            duration: 300.milliseconds,
            offset: pointerDown ? const Offset(-.1, -.1) : Offset.zero,
            curve: Curves.fastOutSlowIn,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SizedBox(
                    child: ClipPath(
                      clipper: CornerCutBorderClipper(
                        cornerRadius: context.adaptiveResponsiveHeight(desktop: 16),
                        width: 3,
                      ),
                      child: Container(
                        color: appColors.accentColor.darken(70),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onTap?.call();
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.responsiveSize(desktop: 10.0),
                      horizontal: context.responsiveSize(desktop: 18.0),
                    ),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: context.responsiveSize(desktop: fontSize_22),
                        color: appColors.foregroundColor.darken(30),
                        fontFamily: "IBMPlexMono",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
