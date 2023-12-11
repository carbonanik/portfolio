import 'package:flutter/material.dart';
import 'package:portfolio/common/widget/corner_cut_style_button.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/page/menu/about_page.dart';
import 'package:portfolio/page/menu/contact_page.dart';
import 'package:portfolio/page/menu/blog_page.dart';
import 'package:portfolio/page/menu/work/work_page.dart';
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
                child: GestureDetector(
                  onTap: () {
                    toggleMenuOnMobile();
                  },
                  child: Container(
                    child: Icon(
                      Icons.menu,
                      color: appColors.accentColor,
                      size: context.responsiveSize(desktop: 80),
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
                    MenuItem(
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
    await Future.delayed(500.milliseconds);
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
  }
}

class MenuItem extends StatefulWidget {
  final int serial;
  final String name;

  final bool selected;
  final void Function(String item)? onTap;

  const MenuItem({
    required this.serial,
    required this.name,
    required this.selected,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with SingleTickerProviderStateMixin {
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
            widget.name,// + (_blinkAnimation.value > 1 ? "_" : ""),
            style: menuTextStyle,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
