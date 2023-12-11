import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/project_item.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/page/menu/work/project_scrollable_row.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
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
        name: 'The best E-Commerce app',
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
      Project(
        name: 'E-Commerce2',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
      Project(
        name: 'Portfolio2',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
      Project(
        name: 'E-Commerce3',
        description: 'Description',
        imagePath: Assets.image.banner.path,
        link: 'https://www.google.com',
      ),
      Project(
        name: 'Portfolio3',
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

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> with TickerProviderStateMixin {
  final borderColor = appColors.accentColor.withOpacity(.2); //const Color(0xFF382A04);
  final lineColor = appColors.accentColor.withOpacity(.4); //const Color(0xFF382A04);///backgroundTextColor;
  final lineWidth = 2.0;
  BlobHoverData blobHoverData = const BlobHoverData.initial();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return PageContainer(
      blobHoverData: blobHoverData,
      showClock: true,
      menuItem: 'Work',
      children: [
        Positioned.fill(
          left: context.responsiveSize(desktop: 100, mobile: 10),
          top: context.responsiveSize(desktop: 100, tablet: 100, mobile: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.folder,
                    color: appColors.foregroundColor,
                    size: context.responsiveSize(desktop: 70),
                  ),
                  SizedBox(width: context.responsiveSize(desktop: 20)),
                  Text(
                    "Projects",
                    style: titleTwoTextStyle.copyWith(
                      fontSize: context.responsiveSize(desktop: 32),
                      fontWeight: FontWeight.bold,
                      color: appColors.foregroundColor,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: context.responsiveSize(desktop: 34)),
                    // ? side line
                    Container(
                      width: lineWidth,
                      height: height - context.responsiveSize(desktop: 200, tablet: 200, mobile: 150), // line height
                      color: lineColor,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          categories.length,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * .04),
                              buildProjectCategoryItem(
                                index: index,
                                category: categories[index],
                                width: width - context.responsiveSize(desktop: 200, tablet: 200, mobile: 50),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
              width: context.responsiveSize(desktop: 100, mobile: 30),
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
                    size: context.responsiveSize(desktop: 55),
                  ),
                  SizedBox(width: context.responsiveSize(desktop: 20)),
                  Text(
                    category.name,
                    style: titleTwoTextStyle.copyWith(
                      fontSize: context.responsiveSize(desktop: 24),
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
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(0.0, -0.2),
                  end: Offset.zero,
                ).animate(animation);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              child: index == selectedIndex
                  ? ScrollableRow(

                      itemCount: category.projects.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: context.responsiveSize(desktop: 60, mobile: 20)),
                            ProjectItem(
                              project: category.projects[index],
                              borderColor: borderColor,
                            ),
                          ],
                        );
                      },

                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
