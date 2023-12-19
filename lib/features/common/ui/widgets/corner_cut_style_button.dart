import 'package:flutter/material.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class CornerCutButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool transparent;
  final EdgeInsets? padding;
  final double? cornerCutRadius;
  final double? elevation;

  const CornerCutButton({
    super.key,
    this.text,
    this.onTap,
    this.fontSize,
    this.transparent = true,
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
    final corner = context.responsiveSize(desktop: 18, tablet: 16, mobile: 14);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
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
            Listener(
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
              child: AnimatedContainer(
                duration: 50.milliseconds,
                transform: Matrix4.translationValues(
                  pointerDown ? 0 : -(widget.elevation ?? context.adaptiveResponsiveWidth(desktop: 10)),
                  pointerDown ? 0 : -(widget.elevation ?? context.adaptiveResponsiveWidth(desktop: 10)),
                  0,
                ),
                child: TextButton(
                  onPressed: widget.onTap,
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                      widget.transparent ? appColors.accentColor.withOpacity(.05) : appColors.backgroundColorLite,
                    ),
                    shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                        side: BorderSide(color: appColors.accentColor),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(widget.cornerCutRadius ?? corner),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: Padding(
                    padding: widget.padding ?? EdgeInsets.symmetric(
                      vertical: context.adaptiveResponsiveHeight(desktop: 18.0),
                      horizontal: context.adaptiveResponsiveWidth(desktop: 18.0),
                    ),
                    child: Text(
                      widget.text!,
                      style: TextStyle(
                        fontSize: widget.fontSize ?? context.adaptiveResponsiveWidth(desktop: fontSize_22),
                        color: appColors.foregroundColor,
                        fontFamily: "IBMPlexMono",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
