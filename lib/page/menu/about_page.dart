import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:portfolio/common/custom_gallery.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/custom_loading_animation.dart';
import 'package:portfolio/common/widget/intro.dart';
import 'package:portfolio/common/widget/social_column.dart';
import 'package:portfolio/common/widget/text_background.dart';
import 'package:portfolio/common/widget/top_menu_bar.dart';
import 'package:portfolio/page/random_appear_animation_text.dart';

import '../../theme/colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  BlobHoverData blobHoverData = const BlobHoverData.initial();

  @override
  Widget build(BuildContext context) {
    return MenuContentPage(
        menuItem: "About",
        blobHoverData: blobHoverData,

        children: [
          Positioned(
            top: 200,
            left: 120,
            child: Intro(blobHoverEffect: (data) {
              setState(() {
                blobHoverData = data;
              });
            },),
          ),
          // const Positioned(
          //     right: 0,
          //     bottom: 0,
          //     child: CustomGallery()
          // ),
        ],
      );
  }
}
