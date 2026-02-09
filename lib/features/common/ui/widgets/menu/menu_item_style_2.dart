import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/core/theme/typography.dart';
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

class _MenuItemThemeState extends State<MenuItemTheme>
    with SingleTickerProviderStateMixin {
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
    _slideAnimationController =
        AnimationController(duration: 300.milliseconds, vsync: this);
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1, 0),
    ).animate(_slideAnimationController);
    nextName = widget.next(widget.name);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MenuItemTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      // Theme changed!
      // If we were showing the nextName (animation at 1.0),
      // we jump back to 0.0 instantly.
      // Visually this is seamless because widget.name is now what nextName was.
      _slideAnimationController.reset();

      // Calculate the NEW next name
      setState(() {
        nextName = widget.next(widget.name);
      });

      // If we are still hovered (or if we want to auto-slide to the next one on tap),
      // we start sliding again.
      _slideAnimationController.forward();
    }
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
          onTap: () {
            // Trigger the tap with the current nextName
            widget.onTap?.call(nextName);
            // The rest of the animation logic is handled in didUpdateWidget
          },
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
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        widget.name,
                        style: menuTextStyle(context),
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
                          style: menuTextStyle(context).copyWith(
                            color: appColorsThemes[nextName]?.foregroundColor ??
                                Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(width: 36),
                        Container(
                          width: 10,
                          height: 22,
                          color: appColorsThemes[nextName]?.accentColor ??
                              Theme.of(context).colorScheme.primary,
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
