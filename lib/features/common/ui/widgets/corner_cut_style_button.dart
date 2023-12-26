import 'package:flutter/material.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:supercharged/supercharged.dart';

class CornerCutButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool transparent;
  final bool colorBorder;
  final EdgeInsets? padding;
  final double? cornerCutRadius;
  final double? elevation;

  const CornerCutButton({
    super.key,
    required this.text,
    this.onTap,
    this.fontSize,
    this.transparent = true,
    this.colorBorder = false,
    this.padding,
    this.cornerCutRadius,
    this.elevation,
  });

  @override
  State<CornerCutButton> createState() => _CornerCutButtonState();
}

class _CornerCutButtonState extends State<CornerCutButton> with TickerProviderStateMixin {
  bool pointerDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Listener(
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
                      color: appColors.foregroundColor.withOpacity(.5),
                      width: pointerDown ? 1 : 3,
                    ),
                    right: BorderSide(
                      color: appColors.foregroundColor.withOpacity(.5),
                      width: pointerDown ? 1 : 3,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: 50.milliseconds,
              transform: Matrix4.translationValues(
                pointerDown ? 0 : -(widget.elevation ?? context.adaptiveResponsiveWidth(desktop: 10, mobile: 6)),
                pointerDown ? 0 : -(widget.elevation ?? context.adaptiveResponsiveWidth(desktop: 10, mobile: 6)),
                0,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: widget.padding ??
                        EdgeInsets.symmetric(
                          vertical: context.adaptiveResponsiveHeight(desktop: 18.0, mobile: 14),
                          horizontal: context.adaptiveResponsiveWidth(desktop: 18.0, mobile: 14),
                        ),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: widget.fontSize ?? context.adaptiveResponsiveWidth(desktop: fontSize_22),
                        color: appColors.foregroundColor,
                        fontFamily: "IBMPlexMono",
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipPath(
                      clipper: CornerCutBorderClipper(
                          cornerRadius: widget.cornerCutRadius ?? context.adaptiveResponsiveWidth(desktop: 18), width: 2),
                      child: Container(
                        color: appColors.accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
