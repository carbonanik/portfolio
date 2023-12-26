import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/features/projects/ui/widgets/project_item.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/projects/models/category_project.dart';
import 'package:portfolio/features/projects/models/project.dart';
import 'package:portfolio/features/common/ui/widgets/scrollable_row.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

const des = "This is the real project i have made, you can believe me.";
final categories = [
  ProjectCategory(
    name: 'Flutter Projects',
    projects: [
      Project(
        name: 'Grocery Shop',
        description:
            'Complete e-commerce app 🛒 with robust performannce 🚀 & beautiful ui✨. And with a python backend 💻.',
        tags: ["Flutter", "Python"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/grocery_app/#readme',
          ),
        ],
      ),
      Project(
        name: 'Logic Builder',
        description: 'Friendly 👋 and lightweight 🎈 tool 🔬 to Design digital logic circuits 🧮',
        tags: ["Flutter"],
        imagePath:
            "https://raw.githubusercontent.com/carbonanik/logic_builder/master/screenshot/logic-builder-logo.png",
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/logic_builder/#readme',
          ),
        ],
      ),
      Project(
        name: 'Portfolio',
        description: "My personal website 🌐 (This site)",
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/portfolio/#readme',
          ),
          ProjectLink(
            name: "Live",
            link: 'https://carbonanik.web.app/',
          ),
        ],
      ),
      Project(
        name: 'Pin Bord',
        description: 'A simple sticky note app 📝',
        tags: ["Flutter", "Firebase"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/pin_bord/#readme',
          ),
          ProjectLink(
            name: "Live",
            link: 'https://pin-bord.web.app/',
          ),
        ],
      ),
    ],
  ),
  ProjectCategory(
    name: 'Kotlin Projects',
    projects: [
      Project(
          name: 'Tally Note',
          description: 'Tally Note is a modern account saving apps. 📝',
          tags: ["Kotlin", "Firebase"],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/TallyNote/#readme',
            )
          ]
      ),
      Project(
          name: 'Messapp',
          description: 'A messenger app 📱',
          tags: ["Kotlin", "Python"],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/MessApp/#readme',
            )
          ]
      )
    ],
  ),
  ProjectCategory(
    name: 'Flutter Demos',
    projects: [
      Project(
        name: 'Travel App',
        description: 'A simple travel app 🚗',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          ),
        ],
      ),
      Project(
        name: 'Coffee Shop (Parallax Effect)',
        description: 'A simple coffee shop app 🍵',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          ),
        ],
      ),
      Project(
        name: 'E-Commerce App',
        description: 'A simple e-commerce app 🛒',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          ),
        ],
      ),
      Project(
        name: 'Grocery App (Animation)',
        description: 'A simple grocery app 🛒',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          )
        ]
      ),
      Project(
        name: 'Ml Kit',
        description: 'A simple ml kit app 🤖',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          )
        ]
      ),
      Project(
        name: 'Nested Todos',
        description: 'A simple nested todos app 📝',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          )
        ]
      )
    ],
  ),
];

@RoutePage()
class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

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
          left: context.adaptiveResponsiveWidth(desktop: 100, mobile: 10),
          top: context.responsiveSize(desktop: 100, tablet: 100, mobile: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.folder,
                    color: appColors.foregroundColor,
                    size: context.adaptiveResponsiveWidth(desktop: 70),
                  ),
                  SizedBox(width: context.responsiveSize(desktop: 20)),
                  Text(
                    "Projects",
                    style: titleTwoTextStyle.copyWith(
                      fontSize: context.adaptiveResponsiveWidth(desktop: 32),
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
                    SizedBox(width: context.adaptiveResponsiveWidth(desktop: 34)),
                    // ? side line
                    Container(
                      width: lineWidth,
                      height: height - context.responsiveSize(desktop: 100, tablet: 200, mobile: 150), // line height
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
                                width: width - context.adaptiveResponsiveWidth(desktop: 200, tablet: 200, mobile: 50),
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
              width: context.adaptiveResponsiveWidth(desktop: 100, mobile: 30),
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
                    size: context.adaptiveResponsiveWidth(desktop: 55),
                  ),
                  SizedBox(width: context.responsiveSize(desktop: 20)),
                  Text(
                    category.name,
                    style: titleTwoTextStyle.copyWith(
                      fontSize: context.adaptiveResponsiveWidth(desktop: 24),
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
                  ? Builder(
                      builder: (context) {
                        final contentHeight = context.adaptiveResponsiveWidth(desktop: 380, tablet: 340, mobile: 260);
                        final contentWidth = context.adaptiveResponsiveWidth(desktop: 380, tablet: 340, mobile: 220);
                        final horizontalSpace = context.adaptiveResponsiveWidth(desktop: 60, mobile: 20);

                        return ScrollableRow(
                          contentHeight: contentHeight,
                          itemTotalWidth: contentWidth + horizontalSpace,
                          itemCount: category.projects.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(width: horizontalSpace),
                                ProjectItemView(
                                  project: category.projects[index],
                                  borderColor: borderColor,
                                  blobHoverEffect: (data) {
                                    blobHoverData = data;
                                  },
                                  width: contentWidth,
                                  height: contentHeight,
                                ),
                              ],
                            );
                          },
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
