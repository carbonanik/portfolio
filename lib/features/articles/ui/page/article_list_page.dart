import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/text_background.dart';
import 'package:portfolio/theme/colors.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const TextBackground(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            height: 200,
                            child:
                                Image(image: AssetImage("image/banner.png"))),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Title",
                              style:  TextStyle(
                                fontFamily: "Cabin",
                                  fontSize: 33,
                                  fontWeight: FontWeight.w800,
                                  height: 1,

                              ),
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width: 1000,
                              child: Text(
                                "I’m a software engineer specializing in building (and occasionally designing) "
                                    "exceptional digital experiences. Currently, I’m focused on building accessible, "
                                    "human-centered products.",
                                maxLines: 4,
                                style:  TextStyle(
                                  fontFamily: "Cabin",
                                      fontSize: 22, fontWeight: FontWeight.w400, color: appColors.foregroundColorDark
                                    // height: 2
                                  ),

                              ),
                            ),
                            const SizedBox(height: 15,),
                            Text(
                              "Title",
                              style:  TextStyle(
                                fontFamily: "IBMPlexMono",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                    color: appColors.accentColor),
                              ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
