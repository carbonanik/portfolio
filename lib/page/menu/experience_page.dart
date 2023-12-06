import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  BlobHoverData blobHoverData = const BlobHoverData.initial();

  @override
  Widget build(BuildContext context) {
    return MenuContentPage(
      menuItem: "Blog",
      blobHoverData: blobHoverData,
      children: [
        Positioned(
          child: MouseRegion(
            onEnter: (hovering) {
              setState((){
                blobHoverData =  BlobHoverData(
                  color: appColors.foregroundColor,
                  size: 400,
                );
              });
            },
            onExit: (event) {
              setState(() {
                blobHoverData = const BlobHoverData.initial();
              });
            },
            child: Text(
              "HI THERE",
              style: titleOneTextStyle.copyWith(
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
          ),
        ),
      ],
    );
  }
}
