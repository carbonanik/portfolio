import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/features/projects/ui/widgets/project_item.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/projects/models/category_project.dart';
import 'package:portfolio/features/projects/models/project.dart';
import 'package:portfolio/features/common/ui/widgets/scrollable_row.dart';
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
        tags: ["Flutter", "Python", "Firebase", "REST API"],
        platform: "Android & iOS",
        role: "Full-stack Flutter Developer",
        problemStatement:
            "Users struggled to shop for groceries online because existing apps were slow, had complicated checkout processes, and didn't provide real-time inventory updates.",
        goals: [
          "Reduce checkout time by 50%",
          "Implement real-time stock tracking",
          "Create a visually appealing and intuitive UI",
        ],
        constraints: [
          "Tight 3-month development cycle",
          "Integration with a legacy inventory API",
          "Targeting low-end Android devices",
        ],
        thinkingProcess: [
          "I chose Clean Architecture with BLoC to ensure scalability and testability.",
          "I implemented a reactive UI that updates instantly when data changes.",
          "I focused on minimizing the number of taps required to complete a purchase.",
        ],
        designDecisions: [
          "Used a vibrant yet clean color palette to evoke freshness.",
          "Implemented a 'Quick Add' feature for frequent items.",
          "Used skeleton loaders to improve perceived performance during data fetching.",
        ],
        technicalImplementation: [
          "Used BLoC for predictable state management.",
          "Implemented Dio for efficient API requests and interceptors.",
          "Used Hive for local caching of product data and user preferences.",
        ],
        challenges: [
          ChallengeSolution(
            challenge: "Slow API response for search results.",
            solution:
                "Implemented debouncing on the search input and client-side filtering for already loaded categories.",
          ),
          ChallengeSolution(
            challenge: "Complex cart logic with various discounts.",
            solution:
                "Developed a dedicated calculation engine within the business logic layer to handle complex pricing rules consistently.",
          ),
        ],
        results: [
          "Successfully launched on Play Store and App Store.",
          "Users reported high satisfaction with the ease of use.",
          "App remains smooth and responsive even with thousands of products.",
        ],
        futureImprovements: [
          "Implement voice-activated search.",
          "Add personalized product recommendations based on shopping habits.",
        ],
        screenshots: [
          "https://raw.githubusercontent.com/carbonanik/grocery_app/master/screenshots/home.png",
          "https://raw.githubusercontent.com/carbonanik/grocery_app/master/screenshots/product_detail.png",
          "https://raw.githubusercontent.com/carbonanik/grocery_app/master/screenshots/cart.png",
        ],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/grocery_app/#readme',
          ),
        ],
      ),
      Project(
        name: 'Logic Builder',
        description:
            'Friendly 👋 and lightweight 🎈 tool 🔬 to Design digital logic circuits 🧮',
        tags: ["Flutter"],
        imagePath:
            "https://raw.githubusercontent.com/carbonanik/logic_builder/master/screenshot/logic-builder-logo.png",
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/logic_builder/#readme',
          ),
          ProjectLink(
            name: "Live",
            link: 'https://logic-builder-carbondev.web.app/',
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
          tags: [
            "Kotlin",
            "Firebase"
          ],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/TallyNote/#readme',
            )
          ]),
      Project(name: 'Messapp', description: 'A messenger app 📱', tags: [
        "Kotlin",
        "Python"
      ], links: [
        ProjectLink(
          name: "Github",
          link: 'https://github.com/carbonanik/MessApp/#readme',
        )
      ])
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
          tags: [
            "Flutter"
          ],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/',
            )
          ]),
      Project(name: 'Ml Kit', description: 'A simple ml kit app 🤖', tags: [
        "Flutter"
      ], links: [
        ProjectLink(
          name: "Github",
          link: 'https://github.com/carbonanik/',
        )
      ]),
      Project(
          name: 'Nested Todos',
          description: 'A simple nested todos app 📝',
          tags: [
            "Flutter"
          ],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/',
            )
          ])
    ],
  ),
];

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> with TickerProviderStateMixin {
  final lineWidth = 2.0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final borderColor = Theme.of(context)
        .colorScheme
        .primary
        .withOpacity(.2); //const Color(0xFF382A04);
    final lineColor = Theme.of(context)
        .colorScheme
        .primary
        .withOpacity(.4); //const Color(0xFF382A04);///backgroundTextColor;

    return PageContainer(
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
                    color: Theme.of(context).colorScheme.tertiary,
                    size: context.adaptiveResponsiveWidth(desktop: 70),
                  ),
                  SizedBox(width: context.responsiveSize(desktop: 20)),
                  Text(
                    "Projects",
                    style: titleTwoTextStyle(context).copyWith(
                      fontSize: context.adaptiveResponsiveWidth(desktop: 32),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: context.adaptiveResponsiveWidth(desktop: 34)),
                    // ? side line
                    Container(
                      width: lineWidth,
                      height: height -
                          context.responsiveSize(
                              desktop: 100,
                              tablet: 200,
                              mobile: 150), // line height
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
                                width: width -
                                    context.adaptiveResponsiveWidth(
                                        desktop: 200, tablet: 200, mobile: 50),
                                lineColor: lineColor,
                                borderColor: borderColor,
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

  Widget buildProjectCategoryItem({
    required int index,
    required ProjectCategory category,
    required double width,
    required Color lineColor,
    required Color borderColor,
  }) {
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
                    color: Theme.of(context).colorScheme.tertiary,
                    size: context.adaptiveResponsiveWidth(desktop: 55),
                  ),
                  SizedBox(width: context.responsiveSize(desktop: 20)),
                  Text(
                    category.name,
                    style: titleTwoTextStyle(context).copyWith(
                      fontSize: context.adaptiveResponsiveWidth(desktop: 24),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary,
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
                        final contentHeight = context.adaptiveResponsiveWidth(
                            desktop: 380, tablet: 340, mobile: 260);
                        final contentWidth = context.adaptiveResponsiveWidth(
                            desktop: 380, tablet: 340, mobile: 220);
                        final horizontalSpace = context.adaptiveResponsiveWidth(
                            desktop: 60, mobile: 20);

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
