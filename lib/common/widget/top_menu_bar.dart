import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors.dart';

class TopMenuBar extends StatelessWidget {
  // final double scrolled;

  const TopMenuBar({
    // this.scrolled = 0,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    const menuItems = ["About", "Experience", "Work", "Contact"];
    // if (scrolled == 0) {
    return Stack(
      children: [
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
        //   ),
        // ),
        Container(
          // color: Colors.black.withOpacity(.8),
          padding: const EdgeInsets.only(right: 35.0, top: 50, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: menuItems
                .asMap()
                .map((k, v) {
                  return MapEntry(k, MenuItem(serial: k + 1, name: v));
                })
                .values
                .toList(),
          ),
        ),
      ],
    );
    // } else {
    return Container();
    // }
  }
}

class MenuItem extends StatelessWidget {
  final int serial;
  final String name;

  const MenuItem({required this.serial, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "0$serial.",
          style: const TextStyle(
            fontFamily: "IBMPlexMono",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColorDark,
          ),
        ),
        const SizedBox(width: 6),
        Text(name,
            style: const TextStyle(
              fontFamily: "IBMPlexMono",
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
        const SizedBox(width: 34),
      ],
    );
  }
}
