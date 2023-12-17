import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class MenuItemS2 extends StatefulWidget {
  final String name;
  final String changeName;

  final Function(String item)? onTap;

  const MenuItemS2({
    required this.name,
    required this.changeName,
    this.onTap,
    super.key,
  });

  @override
  State<MenuItemS2> createState() => _MenuItemS2State();
}

class _MenuItemS2State extends State<MenuItemS2> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _slideAnimationController = AnimationController(duration: 300.milliseconds, vsync: this);
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1, 0),
    ).animate(_slideAnimationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
          _slideAnimationController.forward();
      },
      onExit: (event) {
          _slideAnimationController.reverse();
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
                Container(
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
                FractionalTranslation(
                  translation:  const Offset(1, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        const SizedBox(width: 36),

                        Text(
                          widget.changeName,
                          style: menuTextStyle,
                        ),
                        const SizedBox(width: 36),
                        Container(
                          width: 10,
                          height: 22,
                          color: appColors.accentColor,
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
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
