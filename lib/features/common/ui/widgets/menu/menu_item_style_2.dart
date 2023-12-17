import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class MenuItemS2 extends StatefulWidget {
  final int serial;
  final String name;

  // final double width;
  final bool selected;
  final void Function(String item)? onTap;

  const MenuItemS2({
    required this.serial,
    required this.name,
    // required this.width,
    required this.selected,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItemS2> createState() => _MenuItemS2State();
}

class _MenuItemS2State extends State<MenuItemS2> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  bool firstAnimate = true;
  late Timer _timer;

  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  @override
  void dispose() {
    _timer.cancel();
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _timer = Timer(500.milliseconds, () {
      firstAnimate = false;
      setState(() {});
    });
    _slideAnimationController = AnimationController(duration: 300.milliseconds, vsync: this);
    if (widget.selected) {
      _slideAnimationController.value = 1;
    }
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ).animate(_slideAnimationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        // isHovered = true;
        // setState(() {});
        if (!widget.selected) {
          _slideAnimationController.forward();
        }
      },
      onExit: (event) {
        // isHovered = false;
        // firstAnimate = false;
        // setState(() {});
        if (!widget.selected) {
          _slideAnimationController.reverse();
        }
      },
      child: ClipRRect(
        child: InkWell(
          onTap: () => widget.onTap?.call(widget.name),
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SlideTransition(
            position: _slideAnimation,
            child: Stack(
              children: [
                FractionalTranslation(
                  translation: const Offset(-1, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        const SizedBox(width: 36),
                        Container(
                          width: 10,
                          height: 22,
                          color: appColors.accentColor,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          widget.name,
                          style: menuTextStyle,
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Text(
                        "0${widget.serial}.",
                        style: menuTextStyle.copyWith(
                          color: appColors.accentColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.name,
                        style: menuTextStyle,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
