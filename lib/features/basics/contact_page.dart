import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      showClock: false,
      menuItem: "Contact",
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "sheikhanikbd@gmail.com",
                style: titleOneTextStyle.copyWith(
                  fontFamily: ibmPlexMono,
                  fontSize: 28,
                  shadows: [
                    Shadow(
                      blurRadius: 20,
                      color: appColors.foregroundColor.withOpacity(.7),
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: appColors.backgroundColorLite.withOpacity(.2),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "+880 1766 785027",
                style: titleOneTextStyle.copyWith(
                  fontFamily: ibmPlexMono,
                  fontSize: 28,
                  shadows: [
                    Shadow(
                      blurRadius: 20,
                      color: appColors.foregroundColor.withOpacity(.7),
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: appColors.backgroundColorLite.withOpacity(.2),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
