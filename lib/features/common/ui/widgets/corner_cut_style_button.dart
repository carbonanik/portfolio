import 'package:flutter/material.dart';
import 'package:portfolio/features/common/paths/color_splash_painter.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class CornerCutButton extends StatefulWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool transparent;
  final bool colorBorder;
  final EdgeInsets? padding;
  final double? cornerCutRadius;
  final double elevation;

  const CornerCutButton({
    super.key,
    this.text,
    this.child,
    this.onTap,
    this.fontSize,
    this.transparent = true,
    this.colorBorder = false,
    this.padding,
    this.cornerCutRadius,
    this.elevation = 10,
  });

  @override
  State<CornerCutButton> createState() => _CornerCutButtonState();
}

class _CornerCutButtonState extends State<CornerCutButton> with TickerProviderStateMixin {
  Size? cardSize;
  Offset? cardPosition;
  bool pointerDown = false;
  late Animation<double> _borderAnimation;
  late AnimationController _borderAnimationController;

  @override
  void dispose() {
    super.dispose();
    _borderAnimationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSizeAndPosition();
    });

    _borderAnimationController = AnimationController(duration: 3000.milliseconds, vsync: this);

    _borderAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_borderAnimationController)
      ..addListener(() {
        setState(() {});
      });
  }

  getSizeAndPosition() {
    RenderBox? cardBox = _cardKey.currentContext?.findRenderObject() as RenderBox;
    cardSize = cardBox.size;
    cardPosition = cardBox.localToGlobal(Offset.zero);
    setState(() {});
  }

  final GlobalKey _cardKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final corner = context.responsiveSize(desktop: 18, tablet: 16, mobile: 14);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   width: cardSize?.width != null ? cardSize!.width + 10 : null,
        // ),
        Stack(
          children: [
            // ? background border
            Container(
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
              height: cardSize?.height,
              width: cardSize?.width,
            ),
            // ? button
            AnimatedContainer(
              duration: 50.milliseconds,
              transform: Matrix4.translationValues(
                pointerDown ? 0 : -widget.elevation,
                pointerDown ? 0 : -widget.elevation,
                0,
              ),
              child: Listener(
                onPointerDown: (_) {
                  setState(() {
                    pointerDown = true;
                    if (widget.colorBorder) {
                      _borderAnimationController.reset();
                      _borderAnimationController.forward();
                    }
                  });
                },
                onPointerUp: (_) {
                  setState(() {
                    pointerDown = false;
                  });
                },
                child: TextButton(
                  key: _cardKey,
                  onPressed: widget.onTap,
                  onHover: (hover) {
                    if (hover && widget.colorBorder) {
                      _borderAnimationController.reset();
                      _borderAnimationController.forward();
                    }
                  },
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
                  ),
                  child: Padding(
                    padding: widget.padding ??
                        EdgeInsets.symmetric(
                          vertical: widget.child != null ? 8.0 : 18.0,
                          horizontal: widget.child != null ? 8.0 : 18.0,
                        ),
                    child: widget.child != null && widget.text != null
                        ? Row(
                            children: [
                              widget.child!,
                              Text(
                                widget.text!,
                                style: TextStyle(
                                  fontSize: widget.fontSize ?? context.responsiveSize(desktop: fontSize_22),
                                  color: appColors.foregroundColor,
                                  fontFamily: "IBMPlexMono",
                                ),
                              ),
                            ],
                          )
                        : widget.text != null
                            ? Text(
                                widget.text!,
                                style: TextStyle(
                                  fontSize: widget.fontSize ?? context.responsiveSize(desktop: fontSize_22),
                                  color: appColors.foregroundColor,
                                  fontFamily: "IBMPlexMono",
                                ),
                              )
                            : widget.child != null
                                ? widget.child!
                                : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),

            // ? corner cut splash
            Positioned.fill(
              child: Transform(
                transform: Matrix4.translationValues(
                  pointerDown ? 0 : -widget.elevation,
                  pointerDown ? 0 : -widget.elevation,
                  0,
                ),
                child: ClipPath(
                  clipper:
                      CornerCutBorderClipper( width: 3, cornerRadius: widget.cornerCutRadius ?? corner),
                  child: CustomPaint(
                    foregroundPainter: ColorSplashPainter(value: _borderAnimation.value, cLength: 0.05),
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
