import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';
import 'package:portfolio/features/basics/about/intro.dart';
import 'package:portfolio/features/common/extensions/ext.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

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
