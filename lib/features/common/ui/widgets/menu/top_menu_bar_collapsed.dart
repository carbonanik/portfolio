import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/theme_selector.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class TopMenuBarCollapsed extends StatefulWidget {
  final String? selectedItem;

  const TopMenuBarCollapsed({
    this.selectedItem,
    super.key,
  });

  @override
  State<TopMenuBarCollapsed> createState() => _TopMenuBarCollapsedState();
}

class _TopMenuBarCollapsedState extends State<TopMenuBarCollapsed> with SingleTickerProviderStateMixin {
  bool isMenuOpened = false;
  final menuItems = [
    "About",
    "Work",
    "Blog",
    "Contact",
  ];

  // isMenuOpened ? const Offset(0, -600) : Offset(0, -size.height)

  late final AnimationController _controller = AnimationController(
    duration: 1000.milliseconds,
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, .5),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
      reverseCurve: Curves.decelerate,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleMenuOnMobile() {
    if (!isMenuOpened) {
      openMenu();
    } else {
      closeMenu();
    }
  }

  void openMenu() {
    isMenuOpened = true;
    _controller.duration = 1000.milliseconds;
    _controller.forward();
  }

  void closeMenu() {
    isMenuOpened = false;
    _controller.duration = 300.milliseconds;
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Transform.translate(
              offset: Offset(0, -size.height),
              child: buildMenuItems(context, menuItems),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 30,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: context.adaptiveResponsiveHeight(desktop: 14)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.adaptiveResponsiveHeight(desktop: 28),
                              ),
                              SizedBox(
                                width: context.adaptiveResponsiveHeight(desktop: 40),
                                height: context.adaptiveResponsiveHeight(desktop: 5),
                                child: Container(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                              SizedBox(
                                height: context.adaptiveResponsiveHeight(desktop: 6),
                              ),
                              SizedBox(
                                width: context.adaptiveResponsiveHeight(desktop: 30),
                                height: context.adaptiveResponsiveHeight(desktop: 5),
                                child: Container(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  right: 25,
                ),
                child: GestureDetector(
                  onTap: () {
                    toggleMenuOnMobile();
                  },
                  child: Container(
                    width: context.adaptiveResponsiveHeight(desktop: 70),
                    height: context.adaptiveResponsiveHeight(desktop: 70),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary.darken(70),
                          width: 3,
                        ),
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary.darken(70),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 30,
                ),
                child: GestureDetector(
                  onTap: () {
                    toggleMenuOnMobile();
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: context.adaptiveResponsiveHeight(desktop: 70),
                      height: context.adaptiveResponsiveHeight(desktop: 70),
                      child: ClipPath(
                        clipper: CornerCutBorderClipper(
                          cornerRadius: context.adaptiveResponsiveHeight(desktop: 20),
                          width: 2,
                        ),
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMenuItems(
    BuildContext context,
    List<String> menuItems,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.primary.darken(90).withOpacity(.9),
      // height: 00,
      child: Stack(
        children: [
          Positioned(
            bottom: 50,
            left: 100,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                menuItems.length,
                (index) => Column(
                  children: [
                    const SizedBox(height: 20),
                    MenuItemCollapsed(
                      serial: index + 1,
                      name: menuItems[index],
                      selected: widget.selectedItem == menuItems[index],
                      onTap: (item) {
                        closeMenu();
                        switch (item) {
                          case "About":
                            go(const AboutPageRoute(), context, index);
                            break;
                          case "Blog":
                            go(const BlogPageRoute(), context, index);
                            break;
                          case "Work":
                            go(const WorkPageRoute(), context, index);
                            break;
                          case "Contact":
                            go(const ContactPageRoute(), context, index);
                            break;
                          default:
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 0,
            child: ThemeSelector(),
          ),
        ],
      ),
    );
  }

  void go(PageRouteInfo route, BuildContext context, int index) async {
    Timer(500.milliseconds, () {
      if (widget.selectedItem != menuItems[index]) {
        AutoRouter.of(context).push(route);
      }
    });
  }
}

class MenuItemCollapsed extends StatefulWidget {
  final int serial;
  final String name;

  final bool selected;
  final void Function(String item)? onTap;

  const MenuItemCollapsed({
    required this.serial,
    required this.name,
    required this.selected,
    this.onTap,
    super.key,
  });

  @override
  State<MenuItemCollapsed> createState() => _MenuItemCollapsedState();
}

class _MenuItemCollapsedState extends State<MenuItemCollapsed> with SingleTickerProviderStateMixin {
  late AnimationController _blinkAnimationController;
  late Animation<double> _blinkAnimation;

  @override
  void initState() {
    super.initState();
    _blinkAnimationController = AnimationController(duration: 1000.milliseconds, vsync: this);
    _blinkAnimation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(_blinkAnimationController)
      ..addListener(() {
        setState(() {});
      });
    if (widget.selected) {
      _blinkAnimationController.repeat();
    }
  }

  @override
  void dispose() {
    _blinkAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(widget.name),
      child: Row(
        children: [
          Text(
            // "0${widget.serial}.",
            _blinkAnimation.value > 1 ? "__." : "0${widget.serial}.",
            style: menuTextStyle(context) .copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            widget.name, // + (_blinkAnimation.value > 1 ? "_" : ""),
            style: menuTextStyle(context) ,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
