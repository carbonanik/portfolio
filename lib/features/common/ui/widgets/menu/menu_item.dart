import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

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
    super.key,
  });

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
              color: Theme.of(context).colorScheme.primary,
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
                    style: menuTextStyle(context) .copyWith(
                      color: isHovered || (widget.selected && firstAnimate)
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.name,
                    style: menuTextStyle(context) ,
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
                  color: Theme.of(context).colorScheme.primary,
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
