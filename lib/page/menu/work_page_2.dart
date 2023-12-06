import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/project_item.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:sa4_migration_kit/timeline_tween/timeline_tween.dart';
import 'package:supercharged/supercharged.dart';

class ProjectCategory {
  final String name;
  final List<Project> projects;

  ProjectCategory({
    required this.name,
    required this.projects,
  });
}

class Project {
  final String name;
  final String description;
  final String imagePath;
  final String link;

  Project({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.link,
  });
}

final categories = [
  ProjectCategory(
    name: 'Complete Project',
    projects: [
      Project(
        name: 'E-Commerce',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
      Project(
        name: 'Portfolio',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
    ],
  ),
  ProjectCategory(
    name: 'Demos',
    projects: [
      Project(
        name: 'Weather App',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
    ],
  ),
  ProjectCategory(
    name: 'Working On',
    projects: [
      Project(
        name: 'Project 1',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
      Project(
        name: 'Project 2',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
    ],
  ),
];

class WorkPage2 extends StatefulWidget {
  const WorkPage2({Key? key}) : super(key: key);

  @override
  State<WorkPage2> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage2> with TickerProviderStateMixin {
  late AnimationController _nextButtonController;

  bool isLoading = false;
  final borderColor = appColors.accentColor.withOpacity(.2); //const Color(0xFF382A04);
  final lineColor = appColors.accentColor.withOpacity(.4); //const Color(0xFF382A04);///backgroundTextColor;
  final lineWidth = 2.0;
  BlobHoverData blobHoverData = const BlobHoverData.initial();
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _nextButtonController = AnimationController(duration: 10.seconds, vsync: this);
    _nextButtonController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MenuContentPage(
      blobHoverData: blobHoverData,
      showClock: false,
      menuItem: 'Work',
      isLoading: isLoading,
      children: [
        Positioned(
          left: 100,
          top: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.folder,
                    color: appColors.foregroundColor,
                    size: 70,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Projects",
                    style: titleTwoTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: appColors.foregroundColor,
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 34),
                  Container(
                    width: lineWidth,
                    height: height - 200, // line height
                    color: lineColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      categories.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          buildProjectCategoryItem(
                            index: index,
                            category: categories[index],
                            width: width - 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProjectCategoryItem({required int index, required ProjectCategory category, required double width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: lineWidth,
              color: lineColor,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index == selectedIndex ? -1 : index;
                });
              },
              child: Row(
                children: [
                  Icon(
                    index == selectedIndex ? Icons.folder_copy : Icons.folder,
                    color: appColors.foregroundColor,
                    size: 55,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    category.name,
                    style: titleTwoTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: appColors.foregroundColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        AnimatedSize(
          duration: 300.milliseconds,
          curve: Curves.fastOutSlowIn,
          child: SizedBox(
            width: width,
            child: AnimatedSwitcher(
              duration: 300.milliseconds,
              transitionBuilder: (Widget child, Animation<double> animation) {
                final offsetAnimation =
                    Tween<Offset>(begin: const Offset(0.0, -0.2), end: Offset.zero).animate(animation);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              child: index == selectedIndex
                  ? Column(
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const SizedBox(width: 40),
                            buildAnimatedNextButton(1),

                            ...List.generate(
                              category.projects.length,
                              (index) => Row(
                                children: [
                                  const SizedBox(width: 60),
                                  ProjectItem(project: category.projects[index], borderColor: borderColor),
                                ],
                              ),
                            ),

                            // const SizedBox(width: 60),
                            // ProjectItem(borderColor: borderColor),
                            // const SizedBox(width: 60),
                            // ProjectItem(borderColor: borderColor),
                            // const SizedBox(width: 60),
                            // ProjectItem(borderColor: borderColor),
                            const SizedBox(width: 60),

                            buildAnimatedNextButton(3),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedNextButton(int turns) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: _nextButtonController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _nextButtonController.value * 2.0 * pi,
                  child: CustomPaint(
                    painter: DottedCirclePainter(color: lineColor),
                    child: Container(),
                  ),
                );
              }),
          MouseRegion(
            onEnter: (_) {
              _nextButtonController.duration = 2.seconds;
              _nextButtonController.repeat();
            },
            onExit: (_) {
              _nextButtonController.duration = 10.seconds;
              _nextButtonController.repeat();
            },
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: appColors.accentColor.withOpacity(.1),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: RotatedBox(
                quarterTurns: turns,
                child: Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  size: 30.0,
                  color: lineColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedCirclePainter extends CustomPainter {
  DottedCirclePainter({
    this.length = 24,
    this.height,
    this.width,
    this.color,
    this.strokeWidth = 2,
  });

  final int length;
  final double? height;
  final double? width;
  final Color? color;
  final int strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final dashLineBrush = Paint()
      ..color = color ?? appColors.accentColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final dashLength = pi * 2 / length;

    for (int index = 0; index < length; index++) {
      if (index % 2 == 0) {
        final rect = Rect.fromLTRB(0, 0, width ?? size.width, height ?? size.height);
        final startAngle = dashLength * index;
        final sweepAngle = dashLength;
        canvas.drawArc(rect, startAngle, sweepAngle, false, dashLineBrush);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
