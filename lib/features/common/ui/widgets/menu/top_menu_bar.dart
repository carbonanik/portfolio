import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/ui/page/blog_page.dart';
import 'package:portfolio/features/basics/about/about_page.dart';
import 'package:portfolio/features/basics/contact_page.dart';
import 'package:portfolio/features/projects/ui/page/work_page.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

import '../../../../../theme/colors.dart';

class TopMenuBar extends StatelessWidget {
  final String? selectedItem;

  const TopMenuBar({
    this.selectedItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const menuItems = [
      "About",
      "Work",
      "Blog",
      "Contact",
    ];
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 35.0, top: 50, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              menuItems.length,
              (index) => MenuItem(
                serial: index + 1,
                name: menuItems[index],
                width: menuItems[index].length * 15 + 5 * 15,
                selected: selectedItem == menuItems[index],
                onTap: (item) {
                  switch (item) {
                    case "About":
                      if (selectedItem != menuItems[index]) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const AboutPage();
                            },
                          ),
                        );
                      }
                      break;
                    case "Blog":
                      if (selectedItem != menuItems[index]) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const BlogPage();
                            },
                          ),
                        );
                      }
                      break;
                    case "Work":
                      if (selectedItem != menuItems[index]) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const WorkPage();
                            },
                          ),
                        );
                      }
                      break;
                    case "Contact":
                      if (selectedItem != menuItems[index]) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return const ContactPage();
                            },
                          ),
                        );
                      }
                      break;
                    default:
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatefulWidget {
  final int serial;
  final String name;
  final double width;
  final bool selected;
  final void Function(String item)? onTap;

  const MenuItem({
    required this.serial,
    required this.name,
    required this.width,
    required this.selected,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;
  bool firstAnimate = true;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _timer = Timer(500.milliseconds, () {
      firstAnimate = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      onEnter: (event) {
        isHovered = true;
        setState(() {});
      },
      onExit: (event) {
        isHovered = false;
        firstAnimate = false;
        setState(() {});
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              margin: isHovered || (widget.selected && firstAnimate)
                  ? EdgeInsets.zero
                  : EdgeInsets.only(right: widget.width),
              duration: 100.milliseconds,
              color: appColors.accentColor,
            ),
          ),
          InkWell(
            onTap: () => widget.onTap?.call(widget.name),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    "0${widget.serial}.",
                    style: menuTextStyle.copyWith(
                      color: isHovered || (widget.selected && firstAnimate)
                          ? appColors.foregroundColor
                          : appColors.accentColor,
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
          ),
          widget.selected
              ? Positioned.fill(
                  child: Column(
                    children: [
                      const Spacer(),
                      Container(
                        height: 1,
                        color: appColors.accentColor,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}