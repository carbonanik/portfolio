import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/features/common/paths/corner_cut_border_clipper.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/articles/ui/page/blog_page.dart';
import 'package:portfolio/features/basics/about/about_page.dart';
import 'package:portfolio/features/basics/contact_page.dart';
import 'package:portfolio/features/projects/ui/page/work_page.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

class TopMenuBarCollapsed extends StatefulWidget {
  final String? selectedItem;

  const TopMenuBarCollapsed({
    this.selectedItem,
    Key? key,
  }) : super(key: key);

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
    final heightUnit = context.adaptiveResponsiveHeight(desktop: 1);
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
                                  color: appColors.foregroundColor,
                                ),
                              ),
                              SizedBox(
                                height: context.adaptiveResponsiveHeight(desktop: 6),
                              ),
                              SizedBox(
                                width: context.adaptiveResponsiveHeight(desktop: 30),
                                height: context.adaptiveResponsiveHeight(desktop: 5),
                                child: Container(
                                  color: appColors.foregroundColor,
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
                    child: Container(
                      width: context.adaptiveResponsiveHeight(desktop: 70),
                      height: context.adaptiveResponsiveHeight(desktop: 70),
                      child: ClipPath(
                        clipper: CornerCutBorderClipper(
                          leftCut: true,
                          cornerRadius: context.adaptiveResponsiveHeight(desktop: 20),
                          width: 2,
                        ),
                        child: Container(
                          color: appColors.accentColor,
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
      color: appColors.accentColor.darken(90).withOpacity(.9),
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
                            go(const AboutPage(), context, index);
                            break;
                          case "Blog":
                            go(const BlogPage(), context, index);
                            break;
                          case "Work":
                            go(const WorkPage(), context, index);
                            break;
                          case "Contact":
                            go(const ContactPage(), context, index);
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
        ],
      ),
    );
  }

  void go(Widget page, BuildContext context, int index) async {
    // await Future.delayed(500.milliseconds);
    Timer(500.milliseconds, () {
      if (widget.selectedItem != menuItems[index]) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return page;
            },
          ),
        );
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
    Key? key,
  }) : super(key: key);

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
            style: menuTextStyle.copyWith(
              color: appColors.accentColor,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            widget.name, // + (_blinkAnimation.value > 1 ? "_" : ""),
            style: menuTextStyle,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
