import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/features/basics/about/intro.dart';
import 'package:portfolio/features/common/extensions/ext.dart';

import '../../../core/util/not_used/custom_gallery.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      menuItem: "About",
      showMadeWithText: true,
      isLoading: false,
      children: [
        Positioned(
          top: 200,
          left: context.responsiveSize(desktop: 120, mobile: 20),
          child: const Intro(),
        ),
        // const Positioned(
        //   right: 100,
        //   child: ExperimentWidget(),
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
