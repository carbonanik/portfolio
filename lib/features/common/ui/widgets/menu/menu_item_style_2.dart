import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

// class MenuItemThemeData {
//   final String name;
//   final Color color;
//
//   const MenuItemThemeData({
//     required this.name,
//     required this.color,
//   });
// }

class MenuItemTheme extends StatefulWidget {
  final String name;
  final String Function(String name) next;

  final Function(String name)? onTap;

  const MenuItemTheme({
    required this.name,
    required this.next,
    this.onTap,
    super.key,
  });

  @override
  State<MenuItemTheme> createState() => _MenuItemThemeState();
}

class _MenuItemThemeState extends State<MenuItemTheme> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;
  late String nextName;

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
    nextName = widget.next(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          nextName = widget.next(widget.name);
        });
        _slideAnimationController.forward();
      },
      onExit: (event) {
        _slideAnimationController.reverse();
      },
      child: ClipRRect(
        child: InkWell(
          onTap: () => widget.onTap?.call(nextName),
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
                  translation: const Offset(1, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        const SizedBox(width: 36),
                        Text(
                          nextName,
                          style: menuTextStyle.copyWith(
                            color: appColorsThemes[nextName]?.foregroundColor ?? appColors.foregroundColor,
                          ),
                        ),
                        const SizedBox(width: 36),
                        Container(
                          width: 10,
                          height: 22,
                          color: appColorsThemes[nextName]?.accentColor ?? appColors.accentColor,
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
