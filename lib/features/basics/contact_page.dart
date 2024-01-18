import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/glitch_effect.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/gen/fonts.gen.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      showClock: false,
      showMadeWithText: false,
      showSocial: false,
      menuItem: "Contact",
      children: [
        GlitchEffect(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "sheikhanikbd@gmail.com",
                    style: titleOneTextStyle(context) .copyWith(
                      fontFamily: FontFamily.iBMPlexMono,
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "+880 1766 785027",
                    style: titleOneTextStyle(context) .copyWith(
                      fontFamily: FontFamily.iBMPlexMono,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
