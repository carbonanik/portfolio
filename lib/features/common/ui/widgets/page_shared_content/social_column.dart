import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/random_appear_animation_text.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialItem {
  final String shortName;
  final IconData icon;
  final String? url;

  SocialItem({
    required this.shortName,
    required this.icon,
    this.url,
  });
}

class SocialColumn extends ConsumerStatefulWidget {
  const SocialColumn({super.key});

  @override
  ConsumerState<SocialColumn> createState() => _SocialColumnState();
}

class _SocialColumnState extends ConsumerState<SocialColumn> with TickerProviderStateMixin {
  AnimationController? backController; // todo: paglami code need to be changed

  @override
  Widget build(BuildContext context) {
    final socialItems = [
      SocialItem(shortName: "gh.", icon: EvaIcons.github, url: "https://github.com/carbonanik"),
      SocialItem(shortName: "in.", icon: EvaIcons.linkedin, url: "https://www.linkedin.com/in/carbonanik"),
      SocialItem(shortName: "tw.", icon: EvaIcons.twitter, url: "https://twitter.com/carbonanik"),
      SocialItem(shortName: "fb.", icon: EvaIcons.facebook, url: "https://www.facebook.com/makhdum.sh/"),
      // SocialItem(shortName: "Follow me", icon: EvaIcons.bookOpen),

      // SocialItem(shortName: "em.", icon: Icons.email_rounded),
    ]; //em = email

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        backController?.reset();
        backController?.forward();
      },
      child: MouseRegion(
        onEnter: (event) {
          backController?.reset();
          backController?.forward();
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            SizedBox(
              height: size.height,
              width: context.responsiveSize(desktop: 30, tablet: 30, mobile: 20),
            ),
            Container(
              height: size.height / 1.4,
              width: context.responsiveSize(desktop: 30, tablet: 30, mobile: 20),
              padding: const EdgeInsets.only(bottom: 10),
              color: Theme.of(context).colorScheme.primary.withOpacity(.8),
            ),
            Container(
              height: size.height / 5,
              width: context.responsiveSize(desktop: 30, tablet: 30, mobile: 20),
              padding: const EdgeInsets.only(bottom: 10),
              color: Theme.of(context).colorScheme.primary.darken(70),
            ),
            SizedBox(
              height: size.height / 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...socialItems.map(
                    (item) => Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: size.height * .03),
                        VerticalSocialItem(item: item),
                        SizedBox(height: size.height * .03),
                      ],
                    ),
                  ),
                  buildFollowMeAnimation(size, context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildFollowMeAnimation(Size size, BuildContext context) {
    return SizedBox(
      height: size.height / 5,
      child: Center(
        child: RotatedBox(
          quarterTurns: -1,
          child: Padding(
            padding: EdgeInsets.only(
              // left: 20,
              // right: 20,
              top: 10,
              bottom: context.responsiveSize(desktop: 3, tablet: 3, mobile: 0),
            ),
            child: RandomAppearAnimationText(
              giveMeMyAnimationController: (controller) {
                backController = controller;
              },
              runOnHover: true,
              text: "Follow me",
              style: menuTextStyle(context) .copyWith(
                color: Theme.of(context).colorScheme.primary.darken(30),
                fontSize: context.responsiveSize(
                  desktop: menuTextStyle(context) .fontSize!,
                  tablet: menuTextStyle(context) .fontSize!,
                  mobile: menuTextStyle(context) .fontSize! - 4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalSocialItem extends StatefulWidget {
  final SocialItem item;

  const VerticalSocialItem({super.key, required this.item});

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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (widget.item.url != null) {
            await launchUrl(Uri.parse(widget.item.url!));
          }
        },
        child: context.isMobile ? buildItemTitle(context) : buildITemTitleWithHoverAnim(context),
      ),
    );
  }

  Widget buildITemTitleWithHoverAnim(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _controller.forward();
        setState(() {});
      },
      onExit: (event) {
        _controller.reverse();
        setState(() {});
      },
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
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            buildItemTitle(context),
          ],
        ),
      ),
    );
  }

  RotatedBox buildItemTitle(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 10,
          bottom: context.responsiveSize(desktop: 3, tablet: 3, mobile: 0),
        ),
        child: Text(
          widget.item.shortName,
          style: menuTextStyle(context) .copyWith(
            color: Theme.of(context).colorScheme.background,
            fontSize: context.responsiveSize(
              desktop: menuTextStyle(context) .fontSize!,
              tablet: menuTextStyle(context) .fontSize!,
              mobile: menuTextStyle(context) .fontSize! - 4,
            ),
          ),
        ),
      ),
    );
  }
}
