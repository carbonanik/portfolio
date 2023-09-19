import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../common/widget/text_background.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          TextBackground(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 200,
                            child:
                                Image(image: AssetImage("image/banner.png"))),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title",
                              style:  TextStyle(
                                fontFamily: "Cabin",
                                  fontSize: 33,
                                  fontWeight: FontWeight.w800,
                                  height: 1,

                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              width: 1000,
                              child: Text(
                                "I’m a software engineer specializing in building (and occasionally designing) "
                                    "exceptional digital experiences. Currently, I’m focused on building accessible, "
                                    "human-centered products.",
                                maxLines: 4,
                                style:  TextStyle(
                                  fontFamily: "Cabin",
                                      fontSize: 22, fontWeight: FontWeight.w400, color: foregroundColorDark
                                    // height: 2
                                  ),

                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              "Title",
                              style:  TextStyle(
                                fontFamily: "IBMPlexMono",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                    color: accentColor),
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
