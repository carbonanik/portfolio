import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/clock/clock_view.dart';
import 'package:portfolio/common/widget/intro.dart';
import 'package:portfolio/theme/colors.dart';

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
      children:  [
        Positioned(
          top: 200,
          left: 120,
          child: Intro(
            blobHoverEffect: (data) {
              setState(() {
                blobHoverData = data;
              });
            },
          ),
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

