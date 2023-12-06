import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContentPage(
      showClock: false,
      menuItem: "Contact",
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "✉ carbonanik@gmail.com",
                style: titleOneTextStyle.copyWith(
                  fontFamily: ibmPlexMono,
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
              Text(
                "☎ +880 1766 785027",
                style: titleOneTextStyle.copyWith(
                  fontFamily: ibmPlexMono,
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
