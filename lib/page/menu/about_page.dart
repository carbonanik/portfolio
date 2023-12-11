import 'package:flutter/material.dart';
import 'package:portfolio/ascii_media.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/intro.dart';
import 'package:portfolio/ext.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  BlobHoverData blobHoverData = const BlobHoverData.initial();

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      menuItem: "About",
      blobHoverData: blobHoverData,
      children: [
        Positioned(
          top: 200,
          left: context.responsiveSize(desktop: 120, mobile: 20),
          child: Intro(
            blobHoverEffect: (data) {
              setState(() {
                blobHoverData = data;
              });
            },
          ),
        ),
        // Positioned(
        //   right: 100,
        //   child: AsciiMedia(),
        // )
        // const Positioned(
        //     right: 0,
        //     bottom: 0,
        //     child: CustomGallery()
        // ),
      ],
    );
  }
}
