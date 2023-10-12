import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

import '../../theme/colors.dart';

class SocialItem {
  final String shortName;
  final IconData icon;

  SocialItem({
    required this.shortName,
    required this.icon,
  });
}

class SocialColumn extends StatelessWidget {
  const SocialColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialItems = [
      SocialItem(shortName: "gh.", icon: EvaIcons.github),
      SocialItem(shortName: "in.", icon: EvaIcons.linkedin),
      SocialItem(shortName: "tw.", icon: EvaIcons.twitter),
      SocialItem(shortName: "fb.", icon: EvaIcons.facebook),
      SocialItem(shortName: "em.", icon: Icons.email_rounded),
    ]; //em = email

    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Positioned(
          // right: 0,
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: size.height / 1.2,
                width: 30,
                padding: const EdgeInsets.only(bottom: 10),
                color: appColors.accentColor.withOpacity(.8),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: size.height / 1.2,
            padding: const EdgeInsets.only(bottom: 10),
            // color: Colors.red.withOpacity(.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: socialItems
                  .map((item) => Column(
                        children: [
                          const SizedBox(height: 30),
                          VerticalSocialItem(item: item),
                          const SizedBox(height: 40),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class VerticalSocialItem extends StatefulWidget {
  final SocialItem item;

  const VerticalSocialItem({Key? key, required this.item}) : super(key: key);

  @override
  State<VerticalSocialItem> createState() => _VerticalSocialItemState();
}

class _VerticalSocialItemState extends State<VerticalSocialItem> with TickerProviderStateMixin {
  bool hovered = false;

  late final AnimationController _controller = AnimationController(
    duration: 80.milliseconds,
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.4, 0.0),
  ).animate(
    _controller,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        onEnter: (event) {
          _controller.forward();
          setState(() {});
        },
        onExit: (event) {
          _controller.reverse();
          setState(() {});
        },
        child: ClipRect(
          child: SlideTransition(
            position: _offsetAnimation,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: Container(
                    transform: Matrix4.translationValues(30, 0, 0),
                    child: Icon(
                      widget.item.icon,
                      color: appColors.foregroundColor,
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 10,
                      bottom: 3,
                    ),
                    child: Text(
                      widget.item.shortName,
                      style: menuTextStyle.copyWith(color: appColors.backgroundColor),
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
